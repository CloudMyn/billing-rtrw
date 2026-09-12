package com.alijaya.customer.ui.login

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.alijaya.customer.CustomerApplication
import com.alijaya.customer.data.api.ApiClient
import com.alijaya.customer.data.pref.SessionManager
import com.alijaya.customer.databinding.ActivityLoginBinding
import com.alijaya.customer.ui.main.MainActivity
import com.alijaya.customer.ui.server.ServerConfigActivity
import com.journeyapps.barcodescanner.ScanContract
import com.journeyapps.barcodescanner.ScanIntentResult
import com.journeyapps.barcodescanner.ScanOptions
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.util.concurrent.TimeUnit

class LoginActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLoginBinding

    private val qrScanLauncher = registerForActivityResult(ScanContract()) { result: ScanIntentResult ->
        if (result.contents != null) {
            handleQrCodeResult(result.contents)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.tvServerUrl.text = "Server: " + CustomerApplication.sessionManager.getServerBaseUrl()

        val prefillId = intent.getStringExtra("PREFILL_ID")
        if (!prefillId.isNullOrBlank()) {
            binding.etLoginId.setText(prefillId)
            binding.etPassword.requestFocus()
        }

        binding.btnScanQrLogin.setOnClickListener {
            val options = ScanOptions().apply {
                setDesiredBarcodeFormats(ScanOptions.QR_CODE)
                setPrompt("Arahkan kamera ke QR Code pada stiker modem ONU")
                setCameraId(0)
                setBeepEnabled(true)
                setBarcodeImageEnabled(false)
                setOrientationLocked(false)
            }
            qrScanLauncher.launch(options)
        }

        binding.btnServerSetting.setOnClickListener {
            startActivity(Intent(this, ServerConfigActivity::class.java))
        }

        binding.btnLogin.setOnClickListener {
            val loginId = binding.etLoginId.text.toString().trim()
            val password = binding.etPassword.text.toString().trim()

            if (loginId.isEmpty()) {
                Toast.makeText(this, "Username / No. WA / ID harus diisi", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }
            if (password.isEmpty()) {
                Toast.makeText(this, "Password / PIN harus diisi", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            doLogin(loginId, password)
        }
    }

    override fun onResume() {
        super.onResume()
        binding.tvServerUrl.text = "Server: " + CustomerApplication.sessionManager.getServerBaseUrl()
    }

    private fun doLogin(loginId: String, pass: String) {
        binding.progressBar.visibility = View.VISIBLE
        binding.btnLogin.isEnabled = false

        lifecycleScope.launch {
            try {
                val body = mapOf(
                    "loginId" to loginId,
                    "password" to pass
                )

                val res = ApiClient.getService().login(body)
                if (res.isSuccessful && res.body()?.success == true) {
                    val token = res.body()?.token ?: ""
                    val role = res.body()?.role ?: SessionManager.PORTAL_CUSTOMER
                    val cust = res.body()?.customer
                    val user = res.body()?.user

                    val session = CustomerApplication.sessionManager
                    session.saveAuthToken(token)
                    session.saveConfig(session.getServerBaseUrl(), role)

                    if (cust != null) {
                        session.saveCustomerInfo(cust.id, cust.name, cust.phone)
                    } else if (user != null) {
                        session.saveCustomerInfo(user.id, user.name, user.phone ?: "")
                    }

                    Toast.makeText(this@LoginActivity, "Login berhasil sebagai " + session.getPortalDisplayName() + "!", Toast.LENGTH_SHORT).show()
                    val intent = Intent(this@LoginActivity, MainActivity::class.java).apply {
                        flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
                    }
                    startActivity(intent)
                    finish()
                } else {
                    val err = res.body()?.message ?: "Login gagal. Username atau password salah."
                    Toast.makeText(this@LoginActivity, err, Toast.LENGTH_LONG).show()
                }
            } catch (e: Exception) {
                val errMsg = e.message ?: "Koneksi ke server gagal"
                Toast.makeText(this@LoginActivity, "Gagal terhubung: " + errMsg, Toast.LENGTH_LONG).show()
            } finally {
                binding.progressBar.visibility = View.GONE
                binding.btnLogin.isEnabled = true
            }
        }
    }

    private fun handleQrCodeResult(raw: String) {
        val str = raw.trim()
        if (str.isEmpty()) return

        var targetUrl = ""
        var customerId: String? = null

        try {
            if (str.startsWith("{") && str.endsWith("}")) {
                val json = JSONObject(str)
                targetUrl = json.optString("url", json.optString("server", ""))
                customerId = json.optString("cid", json.optString("customerId", null))
            } else if (str.startsWith("http://", ignoreCase = true) || str.startsWith("https://", ignoreCase = true)) {
                val uri = Uri.parse(str)
                val scheme = uri.scheme ?: "http"
                val host = uri.host ?: ""
                val port = uri.port
                targetUrl = if (port != -1 && port != 80 && port != 443) {
                    "$scheme://$host:$port"
                } else {
                    "$scheme://$host"
                }
                customerId = uri.getQueryParameter("cid")
            } else {
                targetUrl = if (str.contains("://")) str else "http://$str"
            }
        } catch (e: Exception) {
            targetUrl = str
        }

        if (targetUrl.isNotBlank()) {
            val cleanUrl = targetUrl.trimEnd('/')
            CustomerApplication.sessionManager.saveServerBaseUrl(cleanUrl)
            binding.tvServerUrl.text = "Server: $cleanUrl"

            if (!customerId.isNullOrBlank()) {
                binding.etLoginId.setText(customerId)
                binding.etPassword.requestFocus()
            }

            lifecycleScope.launch(Dispatchers.IO) {
                try {
                    val client = OkHttpClient.Builder().connectTimeout(4, TimeUnit.SECONDS).build()
                    val req = Request.Builder().url("$cleanUrl/api/customer/ping").build()
                    val resp = client.newCall(req).execute()
                    if (resp.isSuccessful) {
                        val body = resp.body?.string()
                        if (!body.isNullOrBlank()) {
                            val json = JSONObject(body)
                            val name = json.optString("companyHeader", json.optString("ispName", ""))
                            if (name.isNotBlank()) {
                                CustomerApplication.sessionManager.saveIspName(name)
                                withContext(Dispatchers.Main) {
                                    Toast.makeText(this@LoginActivity, "Terhubung ke $name!", Toast.LENGTH_SHORT).show()
                                }
                            }
                        }
                    }
                } catch (_: Exception) {}
            }

            Toast.makeText(this, "Server berhasil diperbarui!", Toast.LENGTH_SHORT).show()
        } else {
            Toast.makeText(this, "QR Code tidak valid", Toast.LENGTH_LONG).show()
        }
    }
}
