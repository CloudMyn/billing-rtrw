# sep/14/2026 20:17:40 CONVERTED FOR RouterOS v7 (RB4011)
# software id = 4IBM-G7NX
#
# model = RB4011iGS+
# serial number = F0380F3A826D
/interface bridge
add name=bridge-LAN
add add-dhcp-option82=yes dhcp-snooping=yes name=bridge1-HOTSPOT
/interface ethernet
set [ find default-name=ether1 ] name=ether1-ISP
set [ find default-name=ether2 ] name="ether2-CADANGAN ISP"
set [ find default-name=ether3 ] name=ether3-LOKAL
set [ find default-name=ether4 ] name=ether4-LOKAL-LEPTOP
set [ find default-name=ether5 ] name="ether5-LOKAL-REMOT OLT"
set [ find default-name=ether6 ] loop-protect=on name=\
    ether6-OLT-SFP1-TANJUNGPURA
set [ find default-name=ether7 ] loop-protect=on name=\
    ether7-OLT-SFP2-TANJUNGPURA2
set [ find default-name=ether8 ] loop-protect=on name=ether8-HOTSPOT-RADIO
set [ find default-name=ether9 ] loop-protect=on name=\
    ether9-HOTSPOT-SWICTHHUB
set [ find default-name=ether10 ] loop-protect=on name=\
    "ether10-POP PEGAGAN/JANGGAR"
/interface vlan
add interface=bridge1-HOTSPOT name="vlan1-Bridge Hotspot" vlan-id=100
add comment=DHCP-TR069 interface=bridge1-HOTSPOT name="vlan2-Bridge GenieAcs" \
    vlan-id=1111
add interface=bridge1-HOTSPOT name=vlan3-hotspot vlan-id=200
add interface=bridge1-HOTSPOT name=vlan4-tv vlan-id=300
add comment=DHCP-TR069 interface=bridge1-HOTSPOT name=vlan5-1011 vlan-id=1011
add comment=DHCP-TR069 interface=bridge1-HOTSPOT name=vlan6-1100 vlan-id=1100
add interface=bridge1-HOTSPOT name=vlan500-CCTV vlan-id=500
# /interface ethernet switch port (Default switch port settings are preserved in ROS7)
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server option
add code=43 name=ACS-PC value=\
    0x0118687474703a2f2f3139322e3136382e382e38393a37353437
add code=43 name="acs 89" value=\
    0x01687474703a2f2f3139322e3136382e382e38393a37353437
add code=43 name=option1 value=\
    0x0118687474703a2f2f3139322e3136382e382e38393a37353437
/ip hotspot profile
add dns-name=alijayanet.login hotspot-address=192.168.100.1 html-directory=\
    loginpage-HUTRI-81 login-by=http-chap,http-pap,mac-cookie name=hsprof1
add dns-name=alijayanet.login hotspot-address=192.168.100.1 html-directory=\
    loginpage-HUTRI-81 login-by=http-chap,https,http-pap,mac-cookie name=\
    hsprof2
add dns-name=alijayanet.login hotspot-address=192.168.1.1 html-directory=\
    loginpage-HUTRI-81 login-by=http-chap,https,http-pap,mac-cookie name=\
    hsprof4
add dns-name=alijayanet.login hotspot-address=192.168.200.1 html-directory=\
    loginpage-HUTRI-81 login-by=http-chap,https,http-pap,mac-cookie name=\
    hsprof3
/ip hotspot user profile
set [ find default=yes ] on-login=":put (\",,0,,,,Disable,\");{\r\
    \n:local mac \$\"mac-address\";\r\
    \n:local Mwp [/ip hotspot user get [find name=\"\$user\"] uptime];\r\
    \n:local dvc [/ip dhcp-server lease get [find mac-address=\"\$mac\"] host-\
    name];\r\
    \n:local Mpkt [/ip hotspot user get [find name=\"\$user\"] profile];\r\
    \n:local Md [/ip hotspot user get [find name=\"\$user\"] bytes-in];\r\
    \n:local Mu [/ip hotspot user get [find name=\"\$user\"] bytes-out];\r\
    \n:local limit [/ip hotspot user get [find name=\"\$user\"] limit-bytes-to\
    tal];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n\r\
    \n\r\
    \n:put (\",,0,,,,Disable,\");{\r\
    \n:local mac \$\"mac-address\";\r\
    \n:local Mwp [/ip hotspot user get [find name=\"\$user\"] uptime];\r\
    \n:local dvc [/ip dhcp-server lease get [find mac-address=\"\$mac\"] host-\
    name];\r\
    \n:local Mpkt [/ip hotspot user get [find name=\"\$user\"] profile];\r\
    \n:local Md [/ip hotspot user get [find name=\"\$user\"] bytes-in];\r\
    \n:local Mu [/ip hotspot user get [find name=\"\$user\"] bytes-out];\r\
    \n:local limit [/ip hotspot user get [find name=\"\$user\"] limit-bytes-to\
    tal];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local Mt [(((\$Md)+(\$Mu))/1048576)];\r\
    \n:local sisa [(\$totq-(\$Md+\$Mu)/1048576)];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$user\"] comment];\r\
    \n:local Ma [/ip hotspot active print count-only];\r\
    \n/tool fetch url=\"https://api.telegram.org/bot2084785429:AAF8eDb70l5hL8R\
    kIHwSkXWgFel97N4ZYzA/sendMessage\?chat_id=567858628&text==>> LOG-IN \$user\
    \_<<==%0A- IP Address : \$address%0A- Mac Address : \$mac%0A- Device : \$d\
    vc%0A- Agen Vcr : ALIJAYA %0A- Waktu Terpakai : \$Mwp%0A- Kuota Terpakai :\
    \_\$Mt Mb%0A- exp : \$exp%0A- Online : \$Ma Users\" mode=http keep-result=\
    no}\r\
    \n\r\
    \n:local Mt [(((\$Md)+(\$Mu))/1048576)];\r\
    \n:local sisa [(\$totq-(\$Md+\$Mu)/1048576)];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$user\"] comment];\r\
    \n:local Ma [/ip hotspot active print count-only];\r\
    \n/tool fetch url=\"https://api.telegram.org/bot2084785429:AAF8eDb70l5hL8R\
    kIHwSkXWgFel97N4ZYzA/sendMessage\?chat_id=567858628&text==>> LOG-IN \$user\
    \_<<==%0A- IP Address : \$address%0A- Mac Address : \$mac%0A- Device : \$d\
    vc%0A- Agen Vcr : DEWEK %0A- Waktu Terpakai : \$Mwp%0A- Kuota Terpakai : \
    \$Mt Mb%0A- exp : \$exp%0A- Online : \$Ma Users\" mode=http keep-result=no\
    }\r\
    \n\r\
    \n:local URL \"https://onemonbot.oneradius.site/api/notif\";\
    \n:local TOKEN \"mIeXCD6dHrY9\";\
    \n:local MSG \"vcr \$user berhasil terhubung\";\
    \n/tool fetch url=\"\$URL\\\?token=\$TOKEN&vcr=\$user&msg=\$MSG\" keep-res\
    ult=no;\r\
    \n" on-logout=ignore rate-limit=5M/5M
add name=3k on-login=":put (\",rem,2000,1d,3000,,Disable,\"); {:local comment \
    [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] comme\
    nt]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode =\
    \_\"up\" or \$comment = \"\") do={ :local date [ /system clock get date ];\
    :local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys \
    sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :del\
    ay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] n\
    ext-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic\
    \_\$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\
    \$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where na\
    me=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$\
    date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip h\
    otspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s\
    ; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=5k on-login=":put (\",rem,4000,2d,5000,,Disable,\"); {:local comment \
    [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] comme\
    nt]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode =\
    \_\"up\" or \$comment = \"\") do={ :local date [ /system clock get date ];\
    :local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys \
    sch add name=\"\$user\" disable=no start-date=\$date interval=\"2d\"; :del\
    ay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] n\
    ext-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic\
    \_\$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\
    \$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where na\
    me=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$\
    date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip h\
    otspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s\
    ; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=10k on-login=":put (\",rem,8000,5d,10000,,Disable,\"); {:local commen\
    t [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"5d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=15k on-login=":put (\",rem,13000,7d,15000,,Disable,\"); {:local comme\
    nt [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] co\
    mment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucod\
    e = \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"7d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=25k on-login=":put (\",rem,23000,15d,25000,,Disable,\"); {:local comm\
    ent [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] c\
    omment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$uco\
    de = \"up\" or \$comment = \"\") do={ :local date [ /system clock get date\
    \_];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /\
    sys sch add name=\"\$user\" disable=no start-date=\$date interval=\"15d\";\
    \_:delay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\
    \" ] next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d\
    \_[:pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local e\
    xp (\"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find wh\
    ere name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set commen\
    t=\"\$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={\
    \_/ip hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:d\
    elay 5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=\
    none rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=50k on-login=":put (\",rem,45000,30d,50000,,Disable,\"); {:local comm\
    ent [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] c\
    omment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$uco\
    de = \"up\" or \$comment = \"\") do={ :local date [ /system clock get date\
    \_];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /\
    sys sch add name=\"\$user\" disable=no start-date=\$date interval=\"30d\";\
    \_:delay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\
    \" ] next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d\
    \_[:pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local e\
    xp (\"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find wh\
    ere name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set commen\
    t=\"\$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={\
    \_/ip hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:d\
    elay 5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=\
    none rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k" shared-users=2
add name=client on-login=":put (\",,0,,0,noexp,Disable,Disable,\")" \
    on-logout=ignore parent-queue=none rate-limit=\
    "1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=diskon on-login=":put (\",rem,0,30d,0,,Disable,\"); {:local comment [\
    \_/ip hotspot user get [/ip hotspot user find where name=\"\$user\"] comme\
    nt]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode =\
    \_\"up\" or \$comment = \"\") do={ :local date [ /system clock get date ];\
    :local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys \
    sch add name=\"\$user\" disable=no start-date=\$date interval=\"30d\"; :de\
    lay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] \
    next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pi\
    c \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\
    \$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where na\
    me=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$\
    date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip h\
    otspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s\
    ; /sys sch remove [find where name=\"\$user\"]}}" on-logout=ignore \
    parent-queue=none rate-limit="512K/756K 1M/1M 384K/567K 16/11 8 64K/95K"
add name=erik-3k on-login=":put (\",rem,2009,1d,0,,Disable,\"); {:local commen\
    t [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=erik-5k on-login=":put (\",rem,4000,2d,0,,Disable,\"); {:local commen\
    t [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"2d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=erik-10k on-login=":put (\",rem,8000,5d,0,,Disable,\"); {:local comme\
    nt [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] co\
    mment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucod\
    e = \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"5d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=umi-3k on-login=":put (\",rem,2008,1d,0,,Disable,\"); {:local comment\
    \_[ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\":local nama \$user;\
    \n:local mac \$\"mac-address\";\
    \n:local ipAddr \$address;\
    \n:local Mwp [/ip hotspot user get [find name=\$nama] uptime];\
    \n:local Mpkt [/ip hotspot user get [find name=\$nama] profile];\
    \n:local exp [/ip hotspot user get [find name=\$nama] comment];\
    \n:local Md [/ip hotspot user get [find name=\$nama] bytes-in];\
    \n:local Mu [/ip hotspot user get [find name=\$nama] bytes-out];\
    \n:local Ma [/ip hotspot active print count-only];\
    \n:local dvc [/ip dhcp-server lease get [find mac-address=\$mac] host-name\
    ];\
    \n:if ([:len \$dvc] = 0) do={ :set dvc \"Unknown\" }\
    \n\
    \n\
    \n:local Mt (((\$Md + \$Mu) / 1024) / 1024);:local waUrl \"https://whatsap\
    p.alijaya.net/send-message\"\
    \n:local waApiKey \"UfjhCLeQoEmKird0wq08XDBCgqI6lb\"\
    \n:local waSender \"6287820851413\"\
    \n:local waTo \"6283824370937\"\
    \n\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=\$waApiKey&sender=\$waSende\
    r&number=\$waTo&message======================%0A*Monitor-Voucher-Hotspot*%\
    0A======================%0AKode Voucher : \$nama%0AMAC-Address : \$mac%0A=\
    =====================%0A*Detail-Aktivasi:*%0APaket : *\$Mpkt*%0AMasa Aktif\
    \_: \$exp%0AJenis HP : \$dvc%0AUser Aktif : \$Ma User&parse_mode=markdown\
    \" url=\$waUrl keep-result=no;]}}" parent-queue=none rate-limit=\
    "1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=dewek on-login=":put (\",,0,,0,noexp,Disable,Disable,\")" on-logout=\
    ignore parent-queue=none rate-limit=3M/3M shared-users=2
add name=dhea-3k on-login=":put (\",rem,2007,1d,0,,Disable,\"); {:local commen\
    t [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=codet-3k on-login=":put (\",rem,2006,1d,0,,Disable,\"); {:local comme\
    nt [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] co\
    mment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucod\
    e = \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=2hp on-login=":put (\",rem,0,30d,0,,Disable,\"); {:local comment [ /i\
    p hotspot user get [/ip hotspot user find where name=\"\$user\"] comment];\
    \_:local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"\
    up\" or \$comment = \"\") do={ :local date [ /system clock get date ];:loc\
    al year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys sch \
    add name=\"\$user\" disable=no start-date=\$date interval=\"30d\"; :delay \
    5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next\
    -run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$\
    exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\
    \$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where name=\
    \"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$dat\
    e \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hots\
    pot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s; /\
    sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 750K/750K 16/16 8 125K/125K" shared-users=2
add name=4hp on-login=":put (\",rem,0,30d,0,,Disable,\"); {:local comment [ /i\
    p hotspot user get [/ip hotspot user find where name=\"\$user\"] comment];\
    \_:local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"\
    up\" or \$comment = \"\") do={ :local date [ /system clock get date ];:loc\
    al year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys sch \
    add name=\"\$user\" disable=no start-date=\$date interval=\"30d\"; :delay \
    5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next\
    -run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$\
    exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\
    \$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where name=\
    \"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$dat\
    e \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hots\
    pot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s; /\
    sys sch remove [find where name=\"\$user\"]}}" on-logout=ignore \
    parent-queue=none rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k" \
    shared-users=4
add name=dafa-3k on-login=":put (\",rem,2004,1d,0,,Disable,\"); {:local commen\
    t [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=dona-3k on-login=":put (\",rem,2002,1d,0,,Disable,\"); {:local commen\
    t [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=v15 on-login=":put (\",rem,15000,7d,0,,Disable,\"); {:local comment [\
    \_/ip hotspot user get [/ip hotspot user find where name=\"\$user\"] comme\
    nt]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode =\
    \_\"up\" or \$comment = \"\") do={ :local date [ /system clock get date ];\
    :local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys \
    sch add name=\"\$user\" disable=no start-date=\$date interval=\"7d\"; :del\
    ay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] n\
    ext-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic\
    \_\$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\
    \$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where na\
    me=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$\
    date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip h\
    otspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s\
    ; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=v25 on-login=":put (\",rem,23000,15d,0,,Disable,\"); {:local comment \
    [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] comme\
    nt]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode =\
    \_\"up\" or \$comment = \"\") do={ :local date [ /system clock get date ];\
    :local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys \
    sch add name=\"\$user\" disable=no start-date=\$date interval=\"15d\"; :de\
    lay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] \
    next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pi\
    c \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\
    \$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where na\
    me=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$\
    date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip h\
    otspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s\
    ; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=v50 on-login=":put (\",rem,45000,30d,0,,Disable,\"); {:local comment \
    [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] comme\
    nt]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode =\
    \_\"up\" or \$comment = \"\") do={ :local date [ /system clock get date ];\
    :local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sys \
    sch add name=\"\$user\" disable=no start-date=\$date interval=\"30d\"; :de\
    lay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] \
    next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pi\
    c \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\
    \$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where na\
    me=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$\
    date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip h\
    otspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay 5s\
    ; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k" shared-users=2
add name=v3 on-login="{\
    \n  :local vmode \"remc\";\
    \n  :local price \"2000\";\
    \n  :local sprice \"3000\";\
    \n  :local validity \"1d\";\
    \n  :local comment [ /ip hotspot user get [/ip hotspot user find where nam\
    e=\"\$user\"] comment];\
    \n  :local ucode [:pick \$comment 0 2];\
    \n  :if (\$ucode != \"vc\" && \$ucode != \"up\") do={\
    \n    :local date [ /system clock get date ];\
    \n    :local time [ /system clock get time ];\
    \n    /sys sch add name=\"\$user\" interval=\$validity on-event=\"/ip hots\
    pot user remove [find where name=\\\"\$user\\\"]; /ip hotspot active remov\
    e [find where user=\\\"\$user\\\"]; /sys sch remove [find where name=\\\"\
    \$user\\\"]\" comment=\"mikhmon-\$date-\$time\";\
    \n    /ip hotspot user set [find where name=\"\$user\"] comment=\"mikhmon-\
    \$user-\$price-\$validity-\$sprice\";\
    \n  }\
    \n}" parent-queue=none rate-limit=\
    "1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=3k-plentong on-login=":put (\",rem,2001,1d,0,,Disable,\"); {:local co\
    mment [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"]\
    \_comment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$\
    ucode = \"up\" or \$comment = \"\") do={ :local date [ /system clock get d\
    ate ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ];\
    \_/sys sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\
    \"; :delay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$us\
    er\" ] next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local\
    \_d [:pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local\
    \_exp (\"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find\
    \_where name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set co\
    mment=\"\$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) \
    do={ /ip hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];}\
    ;:delay 5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=\
    none rate-limit="1M/1M 2M/2M 750K/750K 16/16 8 125K/125K"
add name=rasta-3k on-login=":put (\",rem,2015,1d,0,,Disable,\"); {:local comme\
    nt [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] co\
    mment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucod\
    e = \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 750K/750K 16/16 8 125K/125K"
add name=ipit-3k on-login=":put (\",rem,2003,1d,0,,Disable,\"); {:local commen\
    t [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] com\
    ment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode\
    \_= \"up\" or \$comment = \"\") do={ :local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]; /sy\
    s sch add name=\"\$user\" disable=no start-date=\$date interval=\"1d\"; :d\
    elay 5s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ]\
    \_next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\"\$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\
    \$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip\
    \_hotspot user set comment=\"\$exp\" [find where name=\"\$user\"];};:delay\
    \_5s; /sys sch remove [find where name=\"\$user\"]}}" parent-queue=none \
    rate-limit="1M/1M 2M/2M 768k/768k 16/16 8 512k/512k"
add name=nyobua on-login="{\
    \n  :local vmode \"rem\";\
    \n  :local price \"2000\";\
    \n  :local sprice \"3000\";\
    \n  :local validity \"1d\";\
    \n  :local comment [ /ip hotspot user get [/ip hotspot user find where nam\
    e=\"\$user\"] comment];\
    \n  :local ucode [:pick \$comment 0 2];\
    \n  :if (\$ucode != \"vc\" && \$ucode != \"up\") do={\
    \n    :local date [ /system clock get date ];\
    \n    :local time [ /system clock get time ];\
    \n    /sys sch add name=\"\$user\" interval=\$validity on-event=\"/ip hots\
    pot user remove [find where name=\\\"\$user\\\"]; /ip hotspot active remov\
    e [find where user=\\\"\$user\\\"]; /sys sch remove [find where name=\\\"\
    \$user\\\"]\" comment=\"mikhmon-\$date-\$time\";\
    \n    /ip hotspot user set [find where name=\"\$user\"] comment=\"mikhmon-\
    \$user-\$price-\$validity-\$sprice\";\
    \n  }\
    \n}" rate-limit=5M/5M
/ip pool
add name=pool_pppoe ranges=192.168.10.15-192.168.10.254
add name=hs-pool-13-Hotspot ranges=192.168.100.2-192.168.100.254
add name=dhcp_pool6 ranges=192.168.8.100-192.168.8.254
add name=dhcp_pool9 ranges=192.168.1.2-192.168.1.254
add name=dhcp_VLAN-Hotspot ranges=192.168.1.2-192.168.1.254
add name=dhcp_vlan-GenieAcs ranges=192.168.2.2-192.168.2.254
add name=pool2-vlan2-hotspot ranges=192.168.200.2-192.168.200.254
add name=pool-VLANTV ranges=192.168.0.2-192.168.0.254
add name=isolir ranges=192.168.205.2-192.168.205.254
add name=pool1-vlan1011 ranges=192.168.3.2-192.168.3.254
add name=dhcp_pool22 ranges=192.168.3.2-192.168.3.254
add name=pool3-vlan1100 ranges=192.168.4.2-192.168.4.254
add name=dhcp_pool24 ranges=192.168.4.2-192.168.4.254
add name=pppoe-pool ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool26 ranges=192.168.8.2-192.168.8.254
add name=dhcp_pool31 ranges=192.168.7.2-192.168.7.254
add name=LAN-POOL ranges=192.168.50.1-192.168.50.254
add name=dhcp_pool33 ranges=192.168.8.2-192.168.8.254
add name=nuxbill ranges=192.168.88.2-192.168.88.254
/ip dhcp-server
add address-pool=hs-pool-13-Hotspot disabled=no interface=bridge1-HOTSPOT \
    name=dhcp1
add address-pool=dhcp_VLAN-Hotspot disabled=no interface=\
    "vlan1-Bridge Hotspot" name=dhcp3
add address-pool=dhcp_vlan-GenieAcs disabled=no interface=\
    "vlan2-Bridge GenieAcs" name=dhcp4
add address-pool=pool2-vlan2-hotspot disabled=no interface=vlan3-hotspot \
    lease-time=1h name=dhcp5
add address-pool=pool-VLANTV disabled=no interface=vlan4-tv name=\
    server-VlanTV
add address-pool=dhcp_pool22 disabled=no interface=vlan5-1011 name=dhcp6
add address-pool=dhcp_pool24 disabled=no interface=vlan6-1100 name=dhcp7
add address-pool=dhcp_pool33 disabled=no interface=bridge-LAN name=dhcp2
/ip hotspot
add address-pool=hs-pool-13-Hotspot addresses-per-mac=1 disabled=no \
    interface=bridge1-HOTSPOT name=hotspot1 profile=hsprof1
add address-pool=dhcp_pool9 addresses-per-mac=1 disabled=no interface=\
    "vlan1-Bridge Hotspot" name="hs-vlan1-Bridge Hotspot" profile=hsprof4
add address-pool=pool2-vlan2-hotspot addresses-per-mac=1 disabled=no \
    interface=vlan3-hotspot name=hs-vlan3-hotspot profile=hsprof3
/ppp profile
set *0 dns-server=8.8.8.8,8.8.4.4 local-address=192.168.10.1 remote-address=\
    pppoe-pool
add dns-server=8.8.8.8,1.1.1.1 local-address=192.168.10.1 name=1MB on-up="{\
    \n  :local user \"\$user\";\
    \n  :local validity \"30d\";\
    \n  :local isolirProfile \"ISOLIR\";\
    \n  /system scheduler remove [find name=\$user];\
    \n  /system scheduler add name=\$user interval=\$validity on-event=\"/ppp \
    secret set [find name=\\\"\$user\\\"] profile=\\\"\$isolirProfile\\\"; /pp\
    p active remove [find name=\\\"\$user\\\"]; /system scheduler remove [find\
    \_name=\\\"\$user\\\"];\" comment=\"auto-isolir-\$user\";\
    \n}" rate-limit="1M/1M 3M/3M 768k/768k 8/8" remote-address=pool_pppoe
add dns-server=8.8.8.8,8.8.4.4 local-address=192.168.10.1 name=2MB on-up=":loc\
    al nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" rate-limit="3M/3M 5M/5M 2250K/2250K 23/23 8 375K/375K" \
    remote-address=pool_pppoe
add local-address=192.168.10.1 name=3MB on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" rate-limit="3M/3M 5M/5M 2250K/2250K 14/14 8 375K/375K" \
    remote-address=pool_pppoe
add local-address=192.168.10.1 name=4m on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" rate-limit="3M/3M 5M/5M 2250K/2250K 23/23 8 375K/375K" \
    remote-address=pool_pppoe
add local-address=192.168.10.1 name=5MB on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" rate-limit="5M/5M 10M/10M 3750K/3750K 16/16 8 625K/625K" \
    remote-address=pool_pppoe
add dns-server=8.8.8.8 local-address=192.168.10.1 name=2m on-down=":local nama\
    \_\"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\F0\\9F\\\
    94\\B4 *TERPUTUS (LOGOUT)*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO USER*\r\
    \n\\F0\\9F\\91\\A5 Username : *\$nama*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n============================\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" parent-queue=none rate-limit=\
    "3M/3M 5M/5M 2250K/2250K 23/23 8 375K/375K" remote-address=pool_pppoe
add local-address=192.168.10.1 name=5Mb on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" rate-limit="5M/5M 10M/10M 3750K/3750K 16/16 8 625K/625K" \
    remote-address=pool_pppoe
add local-address=192.168.10.1 name=5m on-down=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\F0\\9F\\\
    94\\B4 *TERPUTUS (LOGOUT)*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO USER*\r\
    \n\\F0\\9F\\91\\A5 Username : *\$nama*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n============================\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 *TERHUBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;}}" rate-limit=\
    "5M/5M 10M/10M 3750K/3750K 16/16 8 625K/625K" remote-address=pool_pppoe
add dns-server=8.8.8.8 local-address=192.168.2.1 name=vlan-2M on-down="#SCRIPT\
    \_LOGOUT PPPOE\r\
    \n:local nama \"\$user\";\r\
    \n:local api \"3bd62c27f199f27c0024d057aabbae1a90574a79\"\r\
    \n:local id \"6315\"\r\
    \n:local hp \"087820851413\";\r\
    \n:local service [/ppp secret get [find name=\$nama] service];\r\
    \n:local local [/ppp secret get [find name=\$nama] local];\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local active [/ppp active print count];\r\
    \n:local last [/ppp secret get [find name=\$nama] last-logged-out];\r\
    \n:local lastcall [/ppp secret get [find name=\$nama] last-caller-id];\r\
    \n:local lastdic [/ppp secret get [find name=\$nama] last-disconnect-reaso\
    n];\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"id_group=120363031495796203@g.us&me\
    ssage=\\E2\\9C\\85 LOGOUT %0AUser: \$user%0AService: \$service %0ALocal Ad\
    dress: \$local%0ARemote Address: \$remote%0AProfile: \$profile%0ALast Logo\
    ut: \$last%0ALast Caller ID: \$lastcall %0ALast Disconnect Reason: \$lastd\
    ic%0ATotal active: *\$active* Client\" url=\"http://103.190.28.101:8000/se\
    nd-group-message\" keep-result=no;" on-up="#SCRIPT LOGIN LOGOUT BY LABKOM.\
    CO.ID\r\
    \n:local nama \"\$user\";\r\
    \n:local wa \"081947215703\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local up [/ppp active get [find name=\$nama] uptime];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local service [/ppp active get [find name=\$nama] service];\r\
    \n:local active [/ppp active print count];\r\
    \n:local datetime \"Tanggal: \$[/system clock get date] %0AJam: \$[/system\
    \_clock get time]\";\r\
    \n:local lastdisc [/ppp secret get [find name=\$user] last-disconnect-reas\
    on];\r\
    \n:local lastlogout [/ppp secret get [find name=\$user] last-logged-out];\
    \r\
    \n:local lastcall [/ppp secret get [find name=\$user] last-caller-id];\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"number=081947215703&message=\\E2\\9\
    C\\85 PPPoE LOGIN%0A\$datetime%0AUser: \$user%0AIP Client: \$ips%0ACaller \
    ID: \$caller%0AUptime: \$up%0ATotal Active: \$active Client%0AService: \$s\
    ervice%0ALast Disconnect Reason: \$lastdisc %0ALast Logout: \$lastlogout %\
    0ALast Caller ID: \$lastcall\" url=\"http://103.235.74.203:8000/send-messa\
    ge\" keep-result=no" parent-queue=none remote-address=dhcp_vlan-GenieAcs
add comment=TERBLOKIR local-address=192.168.205.1 name=ISOLIR on-down="/ip fir\
    ewall address-list remove [find list=LIST_ISOLIR address=\$remote-address]\
    " on-up="# Script untuk menghapus scheduler dengan nama user ketika login\
    \r\
    \n# Dapat ditempatkan di bagian \"on-login\" script dari PPPoE profile\r\
    \n\r\
    \n# Mendapatkan nama user yang sedang login\r\
    \n:local username \$user\r\
    \n\r\
    \n# Mencari scheduler dengan nama yang sama dengan username\r\
    \n:local schedulerFound 0\r\
    \n:foreach i in=[/system scheduler find] do={\r\
    \n    :local schedulerName [/system scheduler get \$i name]\r\
    \n:local pengguna \$\"user\"; :local date [/system clock get date]; :local\
    \_time [/system clock get time]; :log warning \"User \$pengguna login meng\
    gunakan profile ISOLIR pada \$time tanggal \$date\"; :local schedulerName \
    \"\$pengguna\"; :local schedulerID [/system scheduler find name=\$schedule\
    rName]; :if (\$schedulerID != \"\") do={ /system scheduler remove \$schedu\
    lerID; :log info \"Scheduler '\$schedulerName' berhasil dihapus karena use\
    r \$pengguna menggunakan profile isolir\"; } else={ :log info \"Tidak ada \
    scheduler '\$schedulerName' yang perlu dihapus untuk user \$pengguna\"; }\
    \r\
    \n\r\
    \n:local nama \"\$user\";\r\
    \n:local bot \"bot2084785429:AAF8eDb70l5hL8RkIHwSkXWgFel97N4ZYzA\";\r\
    \n:local chat \"567858628\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local up [/ppp active get [find name=\$nama] uptime];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local service [/ppp active get [find name=\$nama] service];\r\
    \n:local active [/ppp active print count];\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat &text=LOGIN%0AUser: \$user%0AIP Client: \$ips%0ACaller ID: \$calle\
    r%0AUptime: \$up%0ATotal Active: \$active%0AService: \$service\" mode=http\
    \_keep-result=no;" rate-limit=2k/2k remote-address=isolir
add local-address=192.168.10.1 name="2M upto 3M" on-down=":local nama \"\$user\
    \";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\F0\\9F\\\
    94\\B4 *TERPUTUS (LOGOUT)*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO USER*\r\
    \n\\F0\\9F\\91\\A5 Username : *\$nama*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n============================\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" rate-limit="3M/3M 5M/5M 2250K/2250K 23/23 8 375K/375K" \
    remote-address=pool_pppoe
add dns-server=8.8.8.8 local-address=192.168.10.1 name=1m on-up=":local nama \
    \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" parent-queue=none rate-limit="1M/1M 3M/3M 768k/768k 8/8" \
    remote-address=pool_pppoe
add local-address=192.168.10.1 name=BRONZE on-down=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\F0\\9F\\\
    94\\B4 *TERPUTUS (LOGOUT)*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO USER*\r\
    \n\\F0\\9F\\91\\A5 Username : *\$nama*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n============================\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" parent-queue=none rate-limit=\
    "3M/3M 5M/5M 2250K/2250K 14/14 8 375K/375K" remote-address=pool_pppoe
add dns-server=192.168.10.1 local-address=192.168.10.1 name=silver on-down=":l\
    ocal nama \"\$user\";\r\
    \n:local api \"3bd62c27f199f27c0024d057aabbae1a90574a79\"\r\
    \n:local id \"98\"\r\
    \n:local hp \"081947215703\";\r\
    \n:local service [/ppp secret get [find name=\$nama] service];\r\
    \n:local local [/ppp secret get [find name=\$nama] local];\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local active [/ppp active print count];\r\
    \n:local last [/ppp secret get [find name=\$nama] last-logged-out];\r\
    \n:local lastcall [/ppp secret get [find name=\$nama] last-caller-id];\r\
    \n:local lastdic [/ppp secret get [find name=\$nama] last-disconnect-reaso\
    n];\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=\$api&id_device=\$id&no_hp=\
    \$hp&pesan=\\E2\\9C\\85 LOGOUT %0AUser: *\$user*%0AService: \$service %0AL\
    ocal Address: \$local%0ARemote Address: \$remote%0AProfile: \$profile%0ACl\
    ient Aktif: *\$active*%0ALast Logout: \$last%0ALast Caller ID: \$lastcall \
    %0ALast Disconnect Reason: \$lastdic\" url=\"https://api.watsap.id/send-me\
    ssage\" keep-result=no;" on-up=":local pengguna \$user;:local date [/syste\
    m clock get date];:local time [/system clock get time];:log warning \"\$pe\
    ngguna telah login pada jam \$time\";{:if ([/system scheduler find name=\$\
    pengguna]=\"\") do={/system scheduler add name=\$pengguna interval=30d on-\
    event=\"/ppp secret set profile=BEATISOLIR [find name=\$pengguna]\\r\\n/pp\
    p active remove [find name=\$pengguna]\\r\\n\"}}\r\
    \n\r\
    \n:local nama \"\$user\"; \r\
    \n:local ips [/ppp active get [find name=\$nama] address]; \r\
    \n:local up [/ppp active get [find name=\$nama] uptime]; \r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id]; \r\
    \n:local service [/ppp active get [find name=\$nama] service]; \r\
    \n:local active [/ppp active print count]; \r\
    \n:local secret [/ppp secret print count]; \r\
    \n:local terputus (\$secret - \$active) \r\
    \n:local serv [/ppp secret get [find name=\$nama] service]; \r\
    \n:local datetime \"Tanggal: \$[/system clock get date] %0AJam: \$[/system\
    \_clock get time]\"; \r\
    \n:local lastdisc [/ppp secret get [find name=\$user] last-disconnect-reas\
    on]; \r\
    \n:local last [/ppp secret get [find name=\$nama] last-logged-out]; \r\
    \n:local lastcall [/ppp secret get [find name=\$user] last-caller-id]; \r\
    \n:local profile [/ppp secret get [find name=\$nama] profile]; \r\
    \n:local password [/ppp secret get [find name=\$nama] password]; \r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"id_group=120363031495796203@g.us&me\
    ssage=\\E2\\9C\\85 *CLIENT TERHUBUNG*%0A\\F0\\9F\\91\\A5User : *\$user*%0A\
    \\F0\\9F\\94\\90 Password : \$password%0A\\F0\\9F\\93\\8CServices : *\$ser\
    v*%0A\\F0\\9F\\93\\86Profile : \$profile%0A\\F0\\9F\\93\\B6IP Address : \$\
    ips%0A\\E2\\8F\\B0WTerhubung : \$last%0A\\E2\\93\\82MAC : \$lastcall%0A%0A\
    *STATUS CLIENT*%0A\\F0\\9F\\93\\B4Jmlh Client%0A\\F0\\9F\\8C\\8DUser Aktif\
    \_: *\$active*%0A\\F0\\9F\\8C\\8DTotal PPPOE : *\$secret*%0A\\F0\\9F\\8C\\\
    8DTotal Mati: *\$terputus*%0A%0APowered by,%0A*PT. Alijaya Digital Network\
    *\" url=\"http://192.168.8.89:8000//send-group-message\" keep-result=no;\r\
    \n" parent-queue=none rate-limit=5M/5M remote-address=pool_pppoe
add dns-server=192.168.10.1 local-address=192.168.10.1 name=GOLD on-down=":loc\
    al nama \"\$user\"; \r\
    \n:local api \"jV1SOTRMSmRKcdnR3Z0KFoMIAdKBvD\" \r\
    \n:local sender \"6287820851413\" \r\
    \n:local hp \"120363031495796203@g.us\"; \r\
    \n:local ips [/ppp active get [find name=\$nama] address]; \r\
    \n:local up [/ppp active get [find name=\$nama] uptime]; \r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id]; \r\
    \n:local service [/ppp active get [find name=\$nama] service]; \r\
    \n:local active [/ppp active print count]; \r\
    \n:local secret [/ppp secret print count]; \r\
    \n:local terputus (\$secret - \$active) \r\
    \n:local serv [/ppp secret get [find name=\$nama] service]; \r\
    \n:local datetime \"Tanggal: \$[/system clock get date] %0AJam: \$[/system\
    \_clock get time]\"; \r\
    \n:local lastdisc [/ppp secret get [find name=\$user] last-disconnect-reas\
    on]; \r\
    \n:local last [/ppp secret get [find name=\$nama] last-logged-out]; \r\
    \n:local lastcall [/ppp secret get [find name=\$user] last-caller-id]; \r\
    \n:local profile [/ppp secret get [find name=\$nama] profile]; \r\
    \n:local password [/ppp secret get [find name=\$nama] password]; \r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=jV1SOTRMSmRKcdnR3Z0KFoMIAdK\
    BvD&sender=6287820851413&number=120363200614993481@g.us&message=\\F0\\9F\\\
    93\\B4  CLIENT TERPUTUS BOSS \r\
    \n \r\
    \n*DATA PELANGGAN* \r\
    \n\\F0\\9F\\91\\A5 User : *\$user* \r\
    \n\\F0\\9F\\94\\90 Password : \$password \r\
    \n\\F0\\9F\\93\\8C Services : *\$serv* \r\
    \n\\F0\\9F\\93\\86 Profile : \$profile \r\
    \n\\F0\\9F\\93\\B6 IP Address : \$ips \r\
    \n\\E2\\8F\\B0 Aktif : \$last \r\
    \n\\E2\\8F\\B0 Waktu connect : \$up \r\
    \n\\E2\\93\\82 MAC : \$lastcall \r\
    \n \r\
    \n*STATUS GANGGUAN* \r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *0 Terputus* \r\
    \n===========================\r\
    \n\\F0\\9F\\8C\\8D User Aktif : \$active \r\
    \n\\F0\\9F\\8C\\8D Total PPPOE : \$secret \r\
    \n\\F0\\9F\\8C\\8D Total Mati *(\$terputus)*: \r\
    \n=========================== \r\
    \n \r\
    \n_Powered by,_ \r\
    \n*PT. Alijaya Digital Network*\"  url=\"https://app1.alijayajuraganpulsa.\
    com/send-message\" keep-result=no;}}\r\
    \n" on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=Dd2az2yx5O36YfVboT0ieNKkgtn\
    kJT&sender=628781947215703&number=6287820851413&message=\\E2\\9C\\85 *TERH\
    UBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://wa.alijaya.net/send-messag\
    e\" keep-result=no;}}\r\
    \n" parent-queue=none rate-limit=\
    "4M/4M 5M/5M 2250K/2250K 14/14 8 375K/375K" remote-address=pool_pppoe
add dns-server=192.168.10.1 local-address=192.168.10.1 name=FAMILY on-down=":l\
    ocal nama \"\$user\"; \r\
    \n:local api \"jV1SOTRMSmRKcdnR3Z0KFoMIAdKBvD\" \r\
    \n:local sender \"6287820851413\" \r\
    \n:local hp \"120363031495796203@g.us\"; \r\
    \n:local ips [/ppp active get [find name=\$nama] address]; \r\
    \n:local up [/ppp active get [find name=\$nama] uptime]; \r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id]; \r\
    \n:local service [/ppp active get [find name=\$nama] service]; \r\
    \n:local active [/ppp active print count]; \r\
    \n:local secret [/ppp secret print count]; \r\
    \n:local terputus (\$secret - \$active) \r\
    \n:local serv [/ppp secret get [find name=\$nama] service]; \r\
    \n:local datetime \"Tanggal: \$[/system clock get date] %0AJam: \$[/system\
    \_clock get time]\"; \r\
    \n:local lastdisc [/ppp secret get [find name=\$user] last-disconnect-reas\
    on]; \r\
    \n:local last [/ppp secret get [find name=\$nama] last-logged-out]; \r\
    \n:local lastcall [/ppp secret get [find name=\$user] last-caller-id]; \r\
    \n:local profile [/ppp secret get [find name=\$nama] profile]; \r\
    \n:local password [/ppp secret get [find name=\$nama] password]; \r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=jV1SOTRMSmRKcdnR3Z0KFoMIAdK\
    BvD&sender=6287820851413&number=120363200614993481@g.us&message=\\F0\\9F\\\
    93\\B4  CLIENT TERPUTUS BOSS \r\
    \n \r\
    \n*DATA PELANGGAN* \r\
    \n\\F0\\9F\\91\\A5 User : *\$user* \r\
    \n\\F0\\9F\\94\\90 Password : \$password \r\
    \n\\F0\\9F\\93\\8C Services : *\$serv* \r\
    \n\\F0\\9F\\93\\86 Profile : \$profile \r\
    \n\\F0\\9F\\93\\B6 IP Address : \$ips \r\
    \n\\E2\\8F\\B0 Aktif : \$last \r\
    \n\\E2\\8F\\B0 Waktu connect : \$up \r\
    \n\\E2\\93\\82 MAC : \$lastcall \r\
    \n \r\
    \n*STATUS GANGGUAN* \r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *0 Terputus* \r\
    \n===========================\r\
    \n\\F0\\9F\\8C\\8D User Aktif : \$active \r\
    \n\\F0\\9F\\8C\\8D Total PPPOE : \$secret \r\
    \n\\F0\\9F\\8C\\8D Total Mati *(\$terputus)*: \r\
    \n=========================== \r\
    \n \r\
    \n_Powered by,_ \r\
    \n*PT. Alijaya Digital Network*\"  url=\"https://app1.alijayajuraganpulsa.\
    com/send-message\" keep-result=no;}}\r\
    \n" on-up=":local nama \"\$user\"; \r\
    \n:local ips [/ppp active get [find name=\$nama] address]; \r\
    \n:local up [/ppp active get [find name=\$nama] uptime]; \r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id]; \r\
    \n:local service [/ppp active get [find name=\$nama] service]; \r\
    \n:local active [/ppp active print count]; \r\
    \n:local secret [/ppp secret print count]; \r\
    \n:local terputus (\$secret - \$active) \r\
    \n:local serv [/ppp secret get [find name=\$nama] service]; \r\
    \n:local datetime \"Tanggal: \$[/system clock get date] %0AJam: \$[/system\
    \_clock get time]\"; \r\
    \n:local lastdisc [/ppp secret get [find name=\$user] last-disconnect-reas\
    on]; \r\
    \n:local last [/ppp secret get [find name=\$nama] last-logged-out]; \r\
    \n:local lastcall [/ppp secret get [find name=\$user] last-caller-id]; \r\
    \n:local profile [/ppp secret get [find name=\$nama] profile]; \r\
    \n:local password [/ppp secret get [find name=\$nama] password]; \r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"id_group=120363031495796203@g.us&me\
    ssage=\\E2\\9C\\85 *CLIENT TERHUBUNG*%0A\\F0\\9F\\91\\A5User : *\$user*%0A\
    \\F0\\9F\\94\\90 Password : \$password%0A\\F0\\9F\\93\\8CServices : *\$ser\
    v*%0A\\F0\\9F\\93\\86Profile : \$profile%0A\\F0\\9F\\93\\B6IP Address : \$\
    ips%0A\\E2\\8F\\B0WTerhubung : \$last%0A\\E2\\93\\82MAC : \$lastcall%0A%0A\
    *STATUS CLIENT*%0A\\F0\\9F\\93\\B4Jmlh Client%0A\\F0\\9F\\8C\\8DUser Aktif\
    \_: *\$active*%0A\\F0\\9F\\8C\\8DTotal PPPOE : *\$secret*%0A\\F0\\9F\\8C\\\
    8DTotal Mati: *\$terputus*%0A%0APowered by,%0A*PT. Alijaya Digital Network\
    *\" url=\"http://192.168.8.89:8000//send-group-message\" keep-result=no;\r\
    \n" parent-queue=none rate-limit=\
    "756K/756K 1M/1M 384K/384K 16/16 8 256K/256K" remote-address=pool_pppoe
add local-address=192.168.10.1 name=3m on-down=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\F0\\9F\\\
    94\\B4 *TERPUTUS (LOGOUT)*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO USER*\r\
    \n\\F0\\9F\\91\\A5 Username : *\$nama*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n============================\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-method=post http-data=\"text=\\E2\\9C\\85 *TERHUBUNG KE\
    MBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\\F0\\9F\\92\\B6 Tagihan : *Rp.110.000,-*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://api.telegram.org/bot531239\
    822:AAG4LbYXmz9d3xfIjr7CCUnb0jT4F9fcYCw/sendMessage\?chat_id=567858628&par\
    se_mode=markdown\" mode=https keep-result=no http-header-field=\"Content-T\
    ype: application/x-www-form-urlencoded; charset=UTF-8, User-Agent: Firefox\
    \";" rate-limit="3M/3M 5M/5M 2250K/2250K 14/14 8 375K/375K" \
    remote-address=pool_pppoe
add local-address=192.168.205.1 name=isolir on-down="/ip firewall address-list\
    \_remove [find list=LIST_ISOLIR address=\$remote-address]" on-up="# Script\
    \_untuk menghapus scheduler dengan nama user ketika login\r\
    \n# Dapat ditempatkan di bagian \"on-login\" script dari PPPoE profile\r\
    \n\r\
    \n# Mendapatkan nama user yang sedang login\r\
    \n:local username \$user\r\
    \n\r\
    \n# Mencari scheduler dengan nama yang sama dengan username\r\
    \n:local schedulerFound 0\r\
    \n:foreach i in=[/system scheduler find] do={\r\
    \n    :local schedulerName [/system scheduler get \$i name]\r\
    \n    :if (\$schedulerName = \$username) do={\r\
    \n        # Hapus scheduler jika ditemukan\r\
    \n        /system scheduler remove \$i\r\
    \n        :set schedulerFound 1\r\
    \n    }\r\
    \n}\r\
    \n\r\
    \n# Log untuk debugging (opsional)\r\
    \n:if (\$schedulerFound = 1) do={\r\
    \n    :log info (\"Scheduler untuk user \" . \$username . \" telah dihapus\
    \")\r\
    \n} else={\r\
    \n    :log info (\"Tidak ada scheduler ditemukan untuk user \" . \$usernam\
    e)\r\
    \n}\r\
    \n\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 *TERHUBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;}}; /ip firewall address-list remove [find list=L\
    IST_ISOLIR address=\$remote-address]; /ip firewall address-list add list=L\
    IST_ISOLIR address=\$remote-address comment=\$user timeout=23h" \
    rate-limit=2k/2k remote-address=isolir
add local-address=192.168.10.1 name=bronze on-up=":local pengguna \$user;:loca\
    l date [/system clock get date];:local time [/system clock get time];:log \
    warning \"\$pengguna telah login pada jam \$time\";{:if ([/system schedule\
    r find name=\$pengguna]=\"\") do={/system scheduler add name=\$pengguna in\
    terval=30d on-event=\"/ppp secret set profile=BEATISOLIR [find name=\$peng\
    guna]\\r\\n/ppp active remove [find name=\$pengguna]\\r\\n\"}}\r\
    \n:log warning \"PPPOE \$user login kembali.\";\r\
    \n\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 *TERHUBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;}}" parent-queue=none rate-limit=\
    "3M/3M 5M/5M 2250K/2250K 14/14 8 375K/375K" remote-address=pool_pppoe
add local-address=192.168.10.1 name=10M on-down=":local nama \"\$user\";\r\
    \n\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=JPweqBKzCUX6MqHAIZN9iXK6Y1B\
    9qD&sender=6287820851413&number=6281947215703&message=\\E2\\9D\\8C *TERPUT\
    US*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n*INFO LAYANAN*\r\
    \n\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\r\
    \n\\F0\\9F\\93\\8C IP Address : *\$ips*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n_Powered by,_\r\
    \n\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://wa.alijaya.net/send-messag\
    e\" keep-result=no;" on-up=":local pengguna \$\"user\"; :local date [/syst\
    em clock get date]; :local time [/system clock get time]; :log warning \"U\
    ser \$pengguna login menggunakan profile ISOLIR pada \$time tanggal \$date\
    \"; :local schedulerName \"\$pengguna\"; :local schedulerID [/system sched\
    uler find name=\$schedulerName]; :if (\$schedulerID != \"\") do={ /system \
    scheduler remove \$schedulerID; :log info \"Scheduler '\$schedulerName' be\
    rhasil dihapus karena user \$pengguna menggunakan profile isolir\"; } else\
    ={ :log info \"Tidak ada scheduler '\$schedulerName' yang perlu dihapus un\
    tuk user \$pengguna\"; }\r\
    \n\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=bincZlkLrtPZHhjnAqpmiFvCk5k\
    bzj&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 *TERHUBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;}}" rate-limit=\
    "10M/10M 200M/200M 3750K/3750K 16/16 8 625K/625K" remote-address=\
    pool_pppoe
add incoming-filter="" local-address=192.168.205.1 name=BEATISOLIR on-down="/i\
    p firewall address-list remove [find list=LIST_ISOLIR address=\$remote-add\
    ress]" on-up=":local pengguna \$\"user\"; :local date [/system clock get d\
    ate]; :local time [/system clock get time]; :log warning \"User \$pengguna\
    \_login menggunakan profile ISOLIR pada \$time tanggal \$date\"; :local sc\
    hedulerName \"\$pengguna\"; :local schedulerID [/system scheduler find nam\
    e=\$schedulerName]; :if (\$schedulerID != \"\") do={ /system scheduler rem\
    ove \$schedulerID; :log info \"Scheduler '\$schedulerName' berhasil dihapu\
    s karena user \$pengguna menggunakan profile isolir\"; } else={ :log info \
    \"Tidak ada scheduler '\$schedulerName' yang perlu dihapus untuk user \$pe\
    ngguna\"; }\r\
    \n\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 *TERHUBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;}}" outgoing-filter="" rate-limit=2k/2k \
    remote-address=isolir
add incoming-filter="" local-address=192.168.205.1 name=blokir on-down="/ip fi\
    rewall address-list remove [find list=LIST_ISOLIR address=\$remote-address\
    ]" on-up=":local pengguna \$\"user\"; :local date [/system clock get date]\
    ; :local time [/system clock get time]; :log warning \"User \$pengguna log\
    in menggunakan profile ISOLIR pada \$time tanggal \$date\"; :local schedul\
    erName \"\$pengguna\"; :local schedulerID [/system scheduler find name=\$s\
    chedulerName]; :if (\$schedulerID != \"\") do={ /system scheduler remove \
    \$schedulerID; :log info \"Scheduler '\$schedulerName' berhasil dihapus ka\
    rena user \$pengguna menggunakan profile isolir\"; } else={ :log info \"Ti\
    dak ada scheduler '\$schedulerName' yang perlu dihapus untuk user \$penggu\
    na\"; }\r\
    \n\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 *TERHUBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;}}" outgoing-filter="" rate-limit=2k/2k \
    remote-address=isolir
add local-address=192.168.10.1 name=SILVER on-up=":local nama \"\$user\";\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local un [/ppp secret get [find name=\$nama] name];\r\
    \n:local pw [/ppp secret get [find name=\$nama] password];\r\
    \n:local serv [/ppp secret get [find name=\$nama] service];\r\
    \n:local profile [/ppp secret get [find name=\$nama] profile];\r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id];\r\
    \n:local date \"\$[/system clock get date] \$[/system clock get time]\";\r\
    \n:local secret [/ppp secret print count];\r\
    \n:local status value=\"\";\r\
    \n:foreach pppuser in=[/ppp secret find ] do={\r\
    \n :local pppname [/ppp secret get \$pppuser name]\r\
    \n :do {\r\
    \n  :local tmp [/ppp active get [find where name=\"\$pppname\"]]\r\
    \n } on-error={\r\
    \n  ##:put \$pppname\r\
    \n  :set status value=(\$status.\$pppname.\",%0A\")\r\
    \n }\r\
    \n};\r\
    \n\r\
    \n:local kodeprofile [/ppp profile get [find name=\$profile] comment];\r\
    \n\r\
    \n:local hitung [:len [/system script find where name=\$nama]];\r\
    \n:if ( \$hitung = 0 ) do={\r\
    \n/system script add name=\$nama source=\"0\" comment=\"CEK TOTAL GANGGUAN\
    \";\r\
    \n};\r\
    \n\r\
    \n:local getjumlah [:put ([/system script get [find name=\$nama] source] +\
    \_1)];\r\
    \n[/system script set source=\$getjumlah \"\$nama\"];\r\
    \n\r\
    \n:local active [/ppp active print count]; \r\
    \n:local terputus (\$secret - \$active)\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=UfjhCLeQoEmKird0wq08XDBCgqI\
    6lb&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 *TERHUBUNG KEMBALI*\r\
    \n============================\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n============================\r\
    \n*INFO LAYANAN*\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\\F0\\9F\\94\\90 Password : *\$pw*\r\
    \n\\F0\\9F\\93\\8C Services : *\$serv*\r\
    \n\\F0\\9F\\86\\94 IP Address : *\$ips*\r\
    \n\\E2\\93\\82 MAC Address : *\$caller*\r\
    \n\r\
    \n*STATUS GANGGUAN*\r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *\$[/system script get [find name=\$nam\
    a] source]x Terputus*\r\
    \n============================\r\
    \n*\$secret* Total Secret\r\
    \n*\$active* Total Active\r\
    \n============================\r\
    \nUser Terputus *(\$terputus)*:\r\
    \n*\$status*\r\
    \n_Powered by,_\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://whatsapp.alijaya.net/send-\
    message\" keep-result=no;}}" rate-limit=\
    "5M/5M 10M/10M 3750K/3750K 16/16 8 625K/625K" remote-address=pool_pppoe
add dns-server=8.8.8.8,1.1.1.1 local-address=192.168.10.1 name=tester on-up=":\
    local pengguna \$user;:local date [/system clock get date];:local time [/s\
    ystem clock get time];:log warning \"\$pengguna telah login pada jam \$tim\
    e\";{:if ([/system scheduler find name=\$pengguna]=\"\") do={/system sched\
    uler add name=\$pengguna interval=7d on-event=\"/ppp secret set profile=IS\
    OLIR [find name=\$pengguna]\\r\\n/ppp active remove [find name=\$pengguna]\
    \\r\\n\"}};\r\
    \n:log warning \"PPPOE \$user login kembali.\";" rate-limit=\
    "10M/10M 10M/10M 4M/4M 16/16" remote-address=pool_pppoe
/queue simple
add name="==============PPPoE===================" target=""
add max-limit=3M/3M name="====RADIAH======" target=\
    192.168.10.8/32,192.168.10.9/32,192.168.10.11/32
/queue type
set 5 pcq-limit=1000KiB
set 6 pcq-limit=1000KiB
/snmp community
set [ find default=yes ] disabled=yes
add addresses=103.28.52.100/32 name=RadbooX write-access=yes
/user group
add comment="group for mixradius authentication" name=mixradius.group policy="\
    read,write,policy,test,sensitive,api,!local,!telnet,!ssh,!ftp,!reboot,!win\
    box,!password,!web,!sniff,!romon"
/interface bridge filter
add action=accept chain=forward dst-port=67 ip-protocol=udp mac-protocol=ip \
    out-interface="ether10-POP PEGAGAN/JANGGAR" src-port=68
add action=accept chain=forward dst-port=67 ip-protocol=udp mac-protocol=ip \
    out-interface=ether6-OLT-SFP1-TANJUNGPURA src-port=68
add action=accept chain=forward dst-port=67 ip-protocol=udp mac-protocol=ip \
    out-interface=ether7-OLT-SFP2-TANJUNGPURA2 src-port=68
add action=accept chain=forward dst-port=67 ip-protocol=udp mac-protocol=ip \
    out-interface=ether8-HOTSPOT-RADIO src-port=68
add action=accept chain=forward dst-port=67 ip-protocol=udp mac-protocol=ip \
    out-interface=ether9-HOTSPOT-SWICTHHUB src-port=68
add action=accept chain=forward dst-port=67 ip-protocol=udp mac-protocol=ip \
    out-interface="ether10-POP PEGAGAN/JANGGAR" src-port=68
/interface bridge port
add bridge=bridge1-HOTSPOT interface=ether6-OLT-SFP1-TANJUNGPURA
add bridge=bridge1-HOTSPOT interface=ether7-OLT-SFP2-TANJUNGPURA2
add bridge=bridge1-HOTSPOT interface=ether8-HOTSPOT-RADIO
add bridge=bridge1-HOTSPOT interface=ether9-HOTSPOT-SWICTHHUB
add bridge=bridge1-HOTSPOT interface="ether10-POP PEGAGAN/JANGGAR"
add bridge=bridge-LAN interface=ether3-LOKAL
add bridge=bridge-LAN interface=ether4-LOKAL-LEPTOP
add bridge=bridge-LAN interface="ether5-LOKAL-REMOT OLT"
add bridge=bridge-LAN interface=vlan500-CCTV
/ip neighbor discovery-settings
set discover-interface-list=all
/interface detect-internet
set detect-interface-list=all
/interface l2tp-server server
set enabled=yes
/interface pppoe-server server
add disabled=no interface=bridge1-HOTSPOT service-name=service1-PPPoE
/ip address
add address=192.168.100.1/24 interface=bridge1-HOTSPOT network=192.168.100.0
add address=192.168.10.1/24 interface=bridge1-HOTSPOT network=192.168.10.0
add address=192.168.20.1/24 comment="EXPIRED By BNT" interface=\
    bridge1-HOTSPOT network=192.168.20.0
add address=103.175.238.126/30 interface=ether1-ISP network=103.175.238.124
add address=192.168.1.1/24 interface="vlan1-Bridge Hotspot" network=\
    192.168.1.0
add address=192.168.2.1/24 interface="vlan2-Bridge GenieAcs" network=\
    192.168.2.0
add address=137.0.0.1 interface=ether1-ISP network=137.0.0.1
add address=192.168.200.1/24 interface=vlan3-hotspot network=192.168.200.0
add address=192.168.88.1/24 interface=vlan4-tv network=192.168.88.0
add address=192.168.3.1/24 comment=vlan1101 interface=vlan5-1011 network=\
    192.168.3.0
add address=192.168.4.1/24 interface=vlan6-1100 network=192.168.4.0
add address=192.168.8.1/24 interface=bridge-LAN network=192.168.8.0
add address=10.10.99.1/24 comment=Gateway-Isolir-RADIUS interface=bridge-LAN \
    network=10.10.99.0
/ip arp
add address=192.168.8.185 interface=bridge-LAN mac-address=00:15:18:01:81:31
add address=192.168.8.8 interface=bridge-LAN mac-address=D0:27:88:EC:39:55
/ip cloud
set update-time=no
/ip cloud advanced
set use-local-address=yes
/ip dhcp-client
add disabled=no interface=ether1-ISP
add disabled=no interface="ether2-CADANGAN ISP"
add add-default-route=no interface=bridge1-HOTSPOT use-peer-dns=no \
    use-peer-ntp=no
/ip dhcp-server alert
add alert-timeout=5m disabled=no interface=ether9-HOTSPOT-SWICTHHUB on-alert="\
    /ip dhcp-server set authoritative=yes\r\
    \n\r\
    \n:local output\r\
    \n:local bot \"829798569:AAFQuj3Ank0TNGP9JtfWDZ3_wmh4TDpgCs4\";\r\
    \n:local chatID \"567858628\";\r\
    \n:local mikrotik [/system identity get name] ;\r\
    \n:foreach activeIndex in=[/ip dhcp-server alert find comment=lan1] do={\r\
    \n:local interface [/ip dhcp-server alert get value-name=\"interface\" \$a\
    ctiveIndex];\r\
    \n:local valid [/ip dhcp-server alert get value-name=\"valid\" \$activeInd\
    ex];\r\
    \n:local unk [/ip dhcp-server alert get value-name=\"unknown-server\" \$ac\
    tiveIndex];\r\
    \n:log warning \"Nama Mikrotik: \$mikrotikNama interface: \$interface \\nM\
    AC VALID: \$valid \\nMAC ROUGE\$unk\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 ROTER: \$mikrotik %0A\\E2\\9C\\85 Interface:\
    \_\$interface %0A\\E2\\9C\\85 Valid MAC: \$valid %0A\\E2\\9C\\85 MAC Rouge\
    : \$unk\" keep-result=no\r\
    \n}" valid-server=DC:2C:6E:37:22:11
add alert-timeout=5m disabled=no interface=ether8-HOTSPOT-RADIO on-alert="/ip \
    dhcp-server set authoritative=yes\r\
    \n\r\
    \n:local output\r\
    \n:local bot \"829798569:AAFQuj3Ank0TNGP9JtfWDZ3_wmh4TDpgCs4\";\r\
    \n:local chatID \"567858628\";\r\
    \n:local mikrotik [/system identity get name] ;\r\
    \n:foreach activeIndex in=[/ip dhcp-server alert find comment=lan1] do={\r\
    \n:local interface [/ip dhcp-server alert get value-name=\"interface\" \$a\
    ctiveIndex];\r\
    \n:local valid [/ip dhcp-server alert get value-name=\"valid\" \$activeInd\
    ex];\r\
    \n:local unk [/ip dhcp-server alert get value-name=\"unknown-server\" \$ac\
    tiveIndex];\r\
    \n:log warning \"Nama Mikrotik: \$mikrotikNama interface: \$interface \\nM\
    AC VALID: \$valid \\nMAC ROUGE\$unk\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 ROTER: \$mikrotik %0A\\E2\\9C\\85 Interface:\
    \_\$interface %0A\\E2\\9C\\85 Valid MAC: \$valid %0A\\E2\\9C\\85 MAC Rouge\
    : \$unk\" keep-result=no\r\
    \n}" valid-server=DC:2C:6E:37:22:10
add alert-timeout=5m disabled=no interface=ether6-OLT-SFP1-TANJUNGPURA \
    on-alert="/ip dhcp-server set authoritative=yes\r\
    \n\r\
    \n:local output\r\
    \n:local bot \"829798569:AAFQuj3Ank0TNGP9JtfWDZ3_wmh4TDpgCs4\";\r\
    \n:local chatID \"567858628\";\r\
    \n:local mikrotik [/system identity get name] ;\r\
    \n:foreach activeIndex in=[/ip dhcp-server alert find comment=lan1] do={\r\
    \n:local interface [/ip dhcp-server alert get value-name=\"interface\" \$a\
    ctiveIndex];\r\
    \n:local valid [/ip dhcp-server alert get value-name=\"valid\" \$activeInd\
    ex];\r\
    \n:local unk [/ip dhcp-server alert get value-name=\"unknown-server\" \$ac\
    tiveIndex];\r\
    \n:log warning \"Nama Mikrotik: \$mikrotikNama interface: \$interface \\nM\
    AC VALID: \$valid \\nMAC ROUGE\$unk\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 ROTER: \$mikrotik %0A\\E2\\9C\\85 Interface:\
    \_\$interface %0A\\E2\\9C\\85 Valid MAC: \$valid %0A\\E2\\9C\\85 MAC Rouge\
    : \$unk\" keep-result=no\r\
    \n}" valid-server=DC:2C:6E:37:22:0E
add alert-timeout=5m disabled=no interface=ether7-OLT-SFP2-TANJUNGPURA2 \
    on-alert="/ip dhcp-server set authoritative=yes\r\
    \n\r\
    \n:local output\r\
    \n:local bot \"829798569:AAFQuj3Ank0TNGP9JtfWDZ3_wmh4TDpgCs4\";\r\
    \n:local chatID \"567858628\";\r\
    \n:local mikrotik [/system identity get name] ;\r\
    \n:foreach activeIndex in=[/ip dhcp-server alert find comment=lan1] do={\r\
    \n:local interface [/ip dhcp-server alert get value-name=\"interface\" \$a\
    ctiveIndex];\r\
    \n:local valid [/ip dhcp-server alert get value-name=\"valid\" \$activeInd\
    ex];\r\
    \n:local unk [/ip dhcp-server alert get value-name=\"unknown-server\" \$ac\
    tiveIndex];\r\
    \n:log warning \"Nama Mikrotik: \$mikrotikNama interface: \$interface \\nM\
    AC VALID: \$valid \\nMAC ROUGE\$unk\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 ROTER: \$mikrotik %0A\\E2\\9C\\85 Interface:\
    \_\$interface %0A\\E2\\9C\\85 Valid MAC: \$valid %0A\\E2\\9C\\85 MAC Rouge\
    : \$unk\" keep-result=no\r\
    \n}" valid-server=DC:2C:6E:37:22:0F
add alert-timeout=5m disabled=no interface="ether10-POP PEGAGAN/JANGGAR" \
    on-alert="/ip dhcp-server set authoritative=yes\r\
    \n\r\
    \n:local output\r\
    \n:local bot \"829798569:AAFQuj3Ank0TNGP9JtfWDZ3_wmh4TDpgCs4\";\r\
    \n:local chatID \"567858628\";\r\
    \n:local mikrotik [/system identity get name] ;\r\
    \n:foreach activeIndex in=[/ip dhcp-server alert find comment=lan1] do={\r\
    \n:local interface [/ip dhcp-server alert get value-name=\"interface\" \$a\
    ctiveIndex];\r\
    \n:local valid [/ip dhcp-server alert get value-name=\"valid\" \$activeInd\
    ex];\r\
    \n:local unk [/ip dhcp-server alert get value-name=\"unknown-server\" \$ac\
    tiveIndex];\r\
    \n:log warning \"Nama Mikrotik: \$mikrotikNama interface: \$interface \\nM\
    AC VALID: \$valid \\nMAC ROUGE\$unk\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 ROTER: \$mikrotik %0A\\E2\\9C\\85 Interface:\
    \_\$interface %0A\\E2\\9C\\85 Valid MAC: \$valid %0A\\E2\\9C\\85 MAC Rouge\
    : \$unk\" keep-result=no\r\
    \n}" valid-server=DC:2C:6E:37:22:12
/ip dhcp-server network
add address=137.6.1.0/24 gateway=137.6.1.1
add address=192.168.0.0/24 gateway=192.168.0.100
add address=192.168.1.0/24 dns-server=192.168.1.1,8.8.8.8 gateway=192.168.1.1
add address=192.168.2.0/24 dhcp-option=ACS-PC dns-server=192.168.2.1,8.8.8.8 \
    gateway=192.168.2.1
add address=192.168.3.0/24 gateway=192.168.3.1
add address=192.168.4.0/24 gateway=192.168.4.1
add address=192.168.7.0/24 gateway=192.168.7.1
add address=192.168.8.0/24 gateway=192.168.8.1
add address=192.168.10.0/24 dns-server=192.168.8.89,8.8.8.8,8.8.4.4 domain=\
    local gateway=192.168.10.1
add address=192.168.88.0/24 dns-server=8.8.8.8 gateway=192.168.88.1
add address=192.168.100.0/24 comment="hotspot network" gateway=192.168.100.1
add address=192.168.200.0/24 comment="hotspot network" gateway=192.168.200.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d cache-size=16348KiB servers=\
    8.8.8.8,8.8.4.4,192.168.100.1
/ip dns static
add address=192.168.66.1 name=internet.isolir
add address=192.168.8.89 name=genieacs.local ttl=5m
add address=192.168.8.89 name=acs.local ttl=5m
add address=192.168.8.89 name=tr069.local ttl=5m
add address=192.168.8.89 name=salbiyah.my.id
/ip firewall address-list
add address=192.168.500.1-192.168.500.254 list=kecuali
add address=192.168.500.1-192.168.500.254 list=lokal
add address=172.171.0.2-172.171.255.254 comment=expire-rule list=kecuali
add address=103.175.238.0/30 list=kecuali
add address=137.0.0.0 list=kecuali
add address=192.168.10.0/24 comment=\
    "PPPoE Users untuk TR069 (Auto-Generated)" list=tr069-users
/ip firewall filter
add action=drop chain=input comment="Blokir IP Penyerang Manual" src-address=\
    213.207.45.114
add action=drop chain=forward comment="Block suspended customers (static IP)" \
    src-address-list=blocked_customers
add action=accept chain=input comment=ISOLIR disabled=yes dst-port=7777 \
    protocol=tcp
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=fasttrack-connection chain=forward comment="ML [FASTTRACK]" \
    connection-state=established,related dst-port=\
    5000-5221,5224-5227,5229-5241,5243-5508,5551-5559,5601-5700,9001,9443 \
    protocol=tcp src-address=192.168.100.0/24
add action=fasttrack-connection chain=forward connection-state=\
    established,related dst-port=5520-5529,10003,30000-30300 protocol=tcp \
    src-address=192.168.100.0/24
add action=fasttrack-connection chain=forward connection-state=\
    established,related dst-port=\
    4001-4009,5000-5221,5224-5241,5243-5508,5551-5559,5601-5700 protocol=udp \
    src-address=192.168.100.0/24
add action=fasttrack-connection chain=forward connection-state=\
    established,related dst-port=\
    2702,3702,5517,5520-5529,8001,9000-9010,9992,10003,30000-30300 protocol=\
    udp src-address=192.168.100.0/24
add action=accept chain=forward connection-state=established,related
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=drop chain=forward comment=expire-rule dst-address-list=!kecuali \
    src-address-list=Expire
add action=drop chain=input comment=\
    "Block suspended customers from accessing router (static IP)" \
    src-address-list=blocked_customers
add action=accept chain=forward comment=tr069-allow-http dst-address=\
    192.168.8.89 dst-port=7547 protocol=tcp src-address=192.168.10.0/24
add action=accept chain=forward comment=tr069-allow-https dst-address=\
    192.168.8.89 dst-port=7548 protocol=tcp src-address=192.168.10.0/24
add action=accept chain=forward comment=tr069-allow-dns dst-address=\
    192.168.8.89 dst-port=53 protocol=udp src-address=192.168.10.0/24
add action=accept chain=forward comment=tr069-allow-dns-tcp dst-address=\
    192.168.8.89 dst-port=53 protocol=tcp src-address=192.168.10.0/24
add action=accept chain=forward comment=BILLING_API_ISOLIR_DNS dst-port=53 \
    protocol=udp src-address-list=LIST_ISOLIR
add action=accept chain=forward comment=BILLING_API_ISOLIR_ALLOW dst-address=\
    127.0.0.1 src-address-list=LIST_ISOLIR
add action=accept chain=forward comment=BILLING_API_ISOLIR_DNS_TCP dst-port=\
    53 protocol=tcp src-address-list=LIST_ISOLIR
add action=drop chain=forward comment=BLOCK_ISOLIR src-address-list=\
    LIST_ISOLIR
add action=drop chain=forward comment=Isolir-RADIUS-Block-Internet \
    src-address=10.10.99.0/24
/ip firewall mangle
add action=mark-connection chain=prerouting comment="PORT GAME" dst-port=\
    30097-30147,30000-30150,9001,30101-30106,5057,5228,5001-5009 \
    new-connection-mark="PORT GAME" passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    5601-5602,5020-5030,5605,5101-5109,5001-5009,30101 new-connection-mark=\
    "PORT GAME" passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=\
    5520-5529,5020-5030,5501-5509,5517,5510,5010 new-connection-mark=\
    "PORT GAME" passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=\
    5520-5529,5551,5651,5153,5523,5022,5010 new-connection-mark="PORT GAME" \
    passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    7006,39003,39698,39779,6006,7889,8001,10012 new-connection-mark=\
    "PORT GAME" passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    10001-10007,10012,7008,2000,20001,10100 new-connection-mark="PORT GAME" \
    passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=\
    10001-10007,10012,6006,6008,7008,2000,20001,10100 new-connection-mark=\
    "PORT GAME" passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    7006,39003,39698,39779,6006,7889,8001,10012 new-connection-mark=\
    "PORT GAME" passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=10289,10451,19305 \
    new-connection-mark="PORT GAME" passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=10012,17500 \
    new-connection-mark="PORT GAME" passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port="10147,10491,10010,10013,\
    10612,20002,20001,20000,12235,13748,13972,13894,11455,10096,10039" \
    new-connection-mark="PORT GAME" passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=1700,10071 \
    new-connection-mark="PORT GAME" passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=9339 \
    new-connection-mark="PORT GAME" passthrough=yes protocol=tcp
add action=mark-packet chain=forward connection-mark="PORT GAME" \
    in-interface=ether1-ISP new-packet-mark=game_down passthrough=yes
add action=mark-packet chain=forward connection-mark="PORT GAME" \
    new-packet-mark=game_up out-interface=ether1-ISP passthrough=yes
add action=mark-connection chain=prerouting comment=BROWSING dst-port=\
    21,22,23,81,88,5050,843,182,8777,1935,53,8000-8081,80,443 \
    new-connection-mark=browsing passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    67,5228,35915,39397,110,5060,6666,3478,66,53 new-connection-mark=browsing \
    passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=\
    21,22,23,81,88,5050,843,182,8777,1935,53,8000-8081,80,443 \
    new-connection-mark=browsing passthrough=yes protocol=udp
add action=mark-connection chain=prerouting dst-port=\
    67,5228,35915,39397,110,5060,6666,3478,66,53 new-connection-mark=browsing \
    passthrough=yes protocol=udp
add action=mark-packet chain=forward connection-mark=browsing in-interface=\
    ether1-ISP new-packet-mark=browsing_down passthrough=yes
add action=mark-packet chain=forward connection-mark=browsing \
    new-packet-mark=browsing_up out-interface=ether1-ISP passthrough=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat
add action=src-nat chain=srcnat comment="Main Uliz" out-interface=ether1-ISP \
    to-addresses=103.175.238.126
add action=dst-nat chain=dstnat comment="pc server SSH" dst-address=\
    103.175.238.126 dst-port=3003 protocol=tcp to-addresses=192.168.8.16 \
    to-ports=3003
add action=dst-nat chain=dstnat comment="pc server SSH" dst-address=\
    103.175.238.126 dst-port=8856 protocol=tcp to-addresses=192.168.8.16 \
    to-ports=8856
add action=dst-nat chain=dstnat comment="pc server SSH" dst-address=\
    103.175.238.126 dst-port=8000 protocol=tcp to-addresses=192.168.8.89 \
    to-ports=8080
add action=dst-nat chain=dstnat comment=CCTV dst-address=103.175.238.126 \
    dst-port=3500 protocol=tcp to-addresses=192.168.8.110 to-ports=3500
add action=dst-nat chain=dstnat comment="pc server SSH" dst-address=\
    103.175.238.126 dst-port=4447 protocol=tcp to-addresses=192.168.8.89 \
    to-ports=7557
add action=dst-nat chain=dstnat comment="pc server SSH" dst-address=\
    103.175.238.126 dst-port=7547 protocol=tcp to-addresses=192.168.8.89 \
    to-ports=7547
add action=dst-nat chain=dstnat comment="pc server SSH" dst-address=\
    103.175.238.126 dst-port=8888 protocol=tcp to-addresses=192.168.8.89 \
    to-ports=8888
add action=dst-nat chain=dstnat comment=webhook dst-address=103.175.238.126 \
    dst-port=7557 protocol=tcp to-addresses=192.168.8.185 to-ports=7557
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.1.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.1.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.200.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.100.0/24
add action=redirect chain=dstnat comment=expire-rule dst-address-list=\
    !kecuali dst-port=80 protocol=tcp src-address-list=Expire to-ports=7777
add action=dst-nat chain=dstnat dst-port=80,443 protocol=tcp \
    src-address-list=isolir-clients to-addresses=192.168.8.138 to-ports=80
add action=masquerade chain=srcnat comment=tr069-genieacs dst-address=\
    192.168.8.89 dst-port=7547 protocol=tcp src-address=192.168.10.0/24
add action=masquerade chain=srcnat comment=tr069-genieacs-https dst-address=\
    192.168.8.89 dst-port=7548 protocol=tcp src-address=192.168.10.0/24
add action=dst-nat chain=dstnat comment="ACS-Lite Web Port 80" disabled=yes \
    dst-port=80 protocol=tcp to-addresses=192.168.8.223 to-ports=80
add action=dst-nat chain=dstnat comment="ACS-Lite PHP API" disabled=yes \
    dst-port=8888 protocol=tcp to-addresses=192.168.8.223 to-ports=8888
add action=dst-nat chain=dstnat comment="kamera masjid" disabled=yes \
    dst-port=5544 protocol=tcp to-addresses=192.168.8.70 to-ports=554
add action=dst-nat chain=dstnat comment="ACS-Lite Web" disabled=yes dst-port=\
    80 protocol=tcp to-addresses=192.168.8.223 to-ports=80
add action=dst-nat chain=dstnat comment="ACS-Lite API" disabled=yes dst-port=\
    8888 protocol=tcp to-addresses=192.168.8.223 to-ports=8888
add action=dst-nat chain=dstnat comment="ACS-Lite TR069" disabled=yes \
    dst-port=7547 protocol=tcp to-addresses=192.168.8.223 to-ports=7547
add action=dst-nat chain=dstnat comment=BILLING_API_ISOLIR_HTTP dst-port=80 \
    protocol=tcp src-address-list=LIST_ISOLIR to-addresses=127.0.0.1 \
    to-ports=4555
add action=dst-nat chain=dstnat comment=BILLING_API_ISOLIR_HTTPS dst-port=443 \
    protocol=tcp src-address-list=LIST_ISOLIR to-addresses=127.0.0.1 \
    to-ports=443
add action=dst-nat chain=dstnat comment=maint-185 dst-address=103.175.238.126 \
    dst-port=9922 protocol=tcp to-addresses=192.168.8.185 to-ports=22
add action=dst-nat chain=dstnat comment=maint-008 dst-address=103.175.238.126 \
    dst-port=9923 protocol=tcp to-addresses=192.168.8.8 to-ports=22
/ip firewall raw
add action=drop chain=prerouting comment=ISOLIR disabled=yes \
    dst-address-list=!web-isolir dst-port=!80,7777 protocol=tcp \
    src-address-list=ISOLIR-LIST
add action=drop chain=prerouting comment=ISOLIR disabled=yes dst-port=!53 \
    protocol=udp src-address-list=ISOLIR-LIST
/ip hotspot user
add name=aqila2 password=aqila2 profile=client
add name=ibnu password=ibnu profile=client
add name=aqila password=aqila profile=client
add name=codet1 password=codet1 profile=client
add name=mimi password=mimi
add name=yafie password=yafie
add name=060111 password=060111
add name=ALIE27 password=ALIE
add name=wilda password=wilda profile=client
add name=wilda2 password=wilda2 profile=client
add name=kepet password=kepet profile=client
add name=suliwa2023 password=suliwa2023 profile=dewek
add name=703 password=703
add name=sandy1 password=sandy1 profile=client
add name=sandy2 password=sandy2 profile=client
add name=tyas password=tyas profile=client
add name=tyas2 password=tyas2 profile=client
add name=intan2 password=intan2 profile=dewek
add name=Baa password=Baa profile=client
add name=Asep password=Asep profile=client
add name=yogie password=yogie profile=client
add name=KUS password=KUS profile=client
add name=ucok password=ucok profile=client
add name=kasmuri password=kasmuri profile=client
add name=afra password=afra profile=client
add name=afra1 password=afra1 profile=client
add name=jupri password=jupri profile=client
add name=murba5 password=murba5 profile=client
add name=dhea password=dhea profile=client
add name=daffa password=daffa profile=client
add name=nani password=nani profile=erik-3k
add name=ERIK password=ERIK profile=client
add name=yuri password=yuri profile=client
add name=YAFIE password=YAFIE profile=dewek
add comment="oct/05/2026 20:38:14" name=ASTRI password=ASTRI profile=diskon
add name=kenzo password=kenzo profile=client
add name=astri password=astri profile=client
add name=astri2 password=astri2 profile=client
add name=astri3 password=astri3 profile=client
add name=NOVITA password=NOVITA profile=dewek
add name=lisan password=lisan profile=client
add name=karwek password=karwek profile=client
add name=naruto password=naruto profile=client
add name=elin22 password=elin22 profile=10k
add comment=vc-229-03.27.25- name=485947 password=485947 profile=ipit-3k
add comment=vc-229-03.27.25- name=376342 password=376342 profile=ipit-3k
add comment=vc-229-03.27.25- name=992865 password=992865 profile=ipit-3k
add comment=vc-229-03.27.25- name=352347 password=352347 profile=ipit-3k
add comment=vc-229-03.27.25- name=523263 password=523263 profile=ipit-3k
add comment=vc-229-03.27.25- name=767695 password=767695 profile=ipit-3k
add comment=vc-229-03.27.25- name=469829 password=469829 profile=ipit-3k
add comment=vc-229-03.27.25- name=697555 password=697555 profile=ipit-3k
add comment=vc-229-03.27.25- name=696272 password=696272 profile=ipit-3k
add comment=vc-229-03.27.25- name=967233 password=967233 profile=ipit-3k
add comment=vc-590-04.01.25- name=8938 password=8938 profile=erik-3k
add comment=vc-590-04.01.25- name=7797 password=7797 profile=erik-3k
add comment=vc-590-04.01.25- name=9432 password=9432 profile=erik-3k
add comment=vc-590-04.01.25- name=8338 password=8338 profile=erik-3k
add comment=vc-590-04.01.25- name=9868 password=9868 profile=erik-3k
add comment=vc-609-04.01.25- name=95336 password=95336 profile=erik-3k
add comment=vc-609-04.01.25- name=69667 password=69667 profile=erik-3k
add comment=vc-609-04.01.25- name=99798 password=99798 profile=erik-3k
add comment=vc-609-04.01.25- name=96997 password=96997 profile=erik-3k
add comment=vc-609-04.01.25- name=37438 password=37438 profile=erik-3k
add comment=vc-609-04.01.25- name=77632 password=77632 profile=erik-3k
add comment=vc-609-04.01.25- name=48352 password=48352 profile=erik-3k
add comment=vc-609-04.01.25- name=57949 password=57949 profile=erik-3k
add comment=vc-609-04.01.25- name=85995 password=85995 profile=erik-3k
add comment=vc-609-04.01.25- name=23522 password=23522 profile=erik-3k
add comment=vc-609-04.01.25- name=79355 password=79355 profile=erik-3k
add comment=vc-609-04.01.25- name=43779 password=43779 profile=erik-3k
add comment=vc-609-04.01.25- name=54932 password=54932 profile=erik-3k
add comment=vc-609-04.01.25- name=53343 password=53343 profile=erik-3k
add comment=vc-609-04.01.25- name=25423 password=25423 profile=erik-3k
add comment=vc-145-04.01.25- name=28723 password=28723 profile=erik-3k
add comment=vc-145-04.01.25- name=83248 password=83248 profile=erik-3k
add comment=vc-900-04.16.25- name=09254 password=09254 profile=3k
add comment=vc-900-04.16.25- name=04625 password=04625 profile=3k
add comment=vc-900-04.16.25- name=07549 password=07549 profile=3k
add comment=vc-900-04.16.25- name=07275 password=07275 profile=3k
add comment=vc-900-04.16.25- name=02543 password=02543 profile=3k
add comment=vc-900-04.16.25- name=09328 password=09328 profile=3k
add comment=vc-900-04.16.25- name=03926 password=03926 profile=3k
add comment=vc-900-04.16.25- name=09959 password=09959 profile=3k
add name=yogi55 password=yogi55 profile=client
add name=astri1 password=astri1 profile=client
add name=najrul password=najrul profile=client
add comment=vc-429-05.21.25- name=336689 password=336689 profile=3k
add comment=vc-429-05.21.25- name=398573 password=398573 profile=3k
add comment=vc-429-05.21.25- name=368238 password=368238 profile=3k
add comment=vc-429-05.21.25- name=336488 password=336488 profile=3k
add comment=vc-527-05.25.25- name=79956 password=79956 profile=dona-3k
add comment=vc-527-05.25.25- name=35439 password=35439 profile=dona-3k
add comment=vc-527-05.25.25- name=83978 password=83978 profile=dona-3k
add comment=vc-527-05.25.25- name=54452 password=54452 profile=dona-3k
add comment=vc-527-05.25.25- name=55369 password=55369 profile=dona-3k
add comment=vc-527-05.25.25- name=75788 password=75788 profile=dona-3k
add comment=vc-527-05.25.25- name=74837 password=74837 profile=dona-3k
add comment=vc-527-05.25.25- name=69532 password=69532 profile=dona-3k
add comment=vc-527-05.25.25- name=26986 password=26986 profile=dona-3k
add comment=vc-527-05.25.25- name=27346 password=27346 profile=dona-3k
add comment=vc-527-05.25.25- name=44465 password=44465 profile=dona-3k
add comment=vc-527-05.25.25- name=22778 password=22778 profile=dona-3k
add comment=vc-527-05.25.25- name=84984 password=84984 profile=dona-3k
add comment=vc-527-05.25.25- name=62975 password=62975 profile=dona-3k
add comment=vc-820-06.03.25- name=663429 password=663429 profile=10k
add comment=vc-820-06.03.25- name=465953 password=465953 profile=10k
add comment=vc-820-06.03.25- name=269522 password=269522 profile=10k
add comment=vc-820-06.03.25- name=636293 password=636293 profile=10k
add comment=vc-820-06.03.25- name=776538 password=776538 profile=10k
add comment=vc-820-06.03.25- name=292955 password=292955 profile=10k
add comment=vc-956-06.04.25- name=9279 password=9279 profile=erik-3k
add comment=vc-956-06.04.25- name=6536 password=6536 profile=erik-3k
add comment=vc-824-07.02.25- name=542338 password=542338 profile=3k
add comment=vc-824-07.02.25- name=424782 password=424782 profile=3k
add comment=vc-824-07.02.25- name=233335 password=233335 profile=3k
add comment=vc-824-07.02.25- name=843842 password=843842 profile=3k
add comment=vc-654-07.02.25- name=9344 password=9344 profile=umi-3k
add comment=vc-654-07.02.25- name=8482 password=8482 profile=umi-3k
add comment=vc-654-07.02.25- name=6847 password=6847 profile=umi-3k
add comment=vc-654-07.02.25- name=3664 password=3664 profile=umi-3k
add comment=vc-654-07.02.25- name=3396 password=3396 profile=umi-3k
add comment=vc-274-07.07.25- name=64285267 password=64285267 profile=erik-5k
add comment=vc-274-07.07.25- name=25637825 password=25637825 profile=erik-5k
add comment=vc-274-07.07.25- name=25335599 password=25335599 profile=erik-5k
add comment=vc-476-07.07.25- name=93899224 password=93899224 profile=erik-3k
add comment=vc-476-07.07.25- name=48482638 password=48482638 profile=erik-3k
add comment=vc-476-07.07.25- name=24943775 password=24943775 profile=erik-3k
add name=asad password=asad profile=client
add comment=vc-228-07.12.25- name=87287 password=87287 profile=dafa-3k
add comment=vc-816-07.12.25- name=326533 password=326533 profile=dhea-3k
add comment=vc-816-07.12.25- name=835758 password=835758 profile=dhea-3k
add name=866475 password=866475 profile=5k
add name=alisah password=alisah profile=client
add comment=vc-503-07.31.25- name=147684 password=147684 profile=10k
add comment=vc-503-07.31.25- name=147556 password=147556 profile=10k
add comment=vc-503-07.31.25- name=196734 password=196734 profile=10k
add comment=vc-503-07.31.25- name=189896 password=189896 profile=10k
add comment=vc-503-07.31.25- name=172656 password=172656 profile=10k
add comment=vc-503-07.31.25- name=176835 password=176835 profile=10k
add comment=vc-305-07.31.25- name=26623 password=26623 profile=dona-3k
add comment=vc-305-07.31.25- name=26272 password=26272 profile=dona-3k
add comment=vc-305-07.31.25- name=23524 password=23524 profile=dona-3k
add comment=vc-305-07.31.25- name=23835 password=23835 profile=dona-3k
add comment=vc-305-07.31.25- name=28965 password=28965 profile=dona-3k
add comment=vc-305-07.31.25- name=24925 password=24925 profile=dona-3k
add comment=vc-305-07.31.25- name=25455 password=25455 profile=dona-3k
add comment=vc-305-07.31.25- name=27625 password=27625 profile=dona-3k
add comment=vc-919-07.31.25- name=8243 password=8243 profile=3k
add comment=vc-919-07.31.25- name=4377 password=4377 profile=3k
add comment=vc-919-07.31.25- name=6826 password=6826 profile=3k
add comment=vc-919-07.31.25- name=3355 password=3355 profile=3k
add comment=vc-919-07.31.25- name=5424 password=5424 profile=3k
add comment=vc-347-08.14.25- name=593797 password=593797 profile=5k
add comment=vc-347-08.14.25- name=522453 password=522453 profile=5k
add comment=vc-347-08.14.25- name=559238 password=559238 profile=5k
add comment=vc-347-08.14.25- name=524629 password=524629 profile=5k
add comment=vc-347-08.14.25- name=559629 password=559629 profile=5k
add comment=vc-347-08.14.25- name=532368 password=532368 profile=5k
add comment=vc-343-08.14.25- name=587677 password=587677 profile=3k-plentong
add comment=vc-343-08.14.25- name=989554 password=989554 profile=3k-plentong
add comment=vc-343-08.14.25- name=562794 password=562794 profile=3k-plentong
add comment=vc-343-08.14.25- name=928832 password=928832 profile=3k-plentong
add comment=vc-343-08.14.25- name=688296 password=688296 profile=3k-plentong
add comment=vc-343-08.14.25- name=879559 password=879559 profile=3k-plentong
add comment=vc-833-08.14.25- name=22963 password=22963 profile=umi-3k
add comment=vc-833-08.14.25- name=46864 password=46864 profile=umi-3k
add comment=vc-833-08.14.25- name=92295 password=92295 profile=umi-3k
add comment=vc-833-08.14.25- name=66347 password=66347 profile=umi-3k
add comment=vc-803-08.14.25- name=43929 password=43929 profile=ipit-3k
add comment=vc-803-08.14.25- name=83222 password=83222 profile=ipit-3k
add comment=vc-803-08.14.25- name=82599 password=82599 profile=ipit-3k
add comment=vc-803-08.14.25- name=38232 password=38232 profile=ipit-3k
add comment=vc-803-08.14.25- name=75646 password=75646 profile=ipit-3k
add comment=vc-385-08.16.25- name=76928839 password=76928839 profile=erik-5k
add comment=vc-385-08.16.25- name=88226628 password=88226628 profile=erik-5k
add comment=vc-385-08.16.25- name=49632553 password=49632553 profile=erik-5k
add comment=vc-385-08.16.25- name=77364355 password=77364355 profile=erik-5k
add comment=vc-385-08.16.25- name=26488528 password=26488528 profile=erik-5k
add comment=vc-385-08.16.25- name=86537752 password=86537752 profile=erik-5k
add comment=vc-385-08.16.25- name=29344843 password=29344843 profile=erik-5k
add comment=vc-385-08.16.25- name=46348429 password=46348429 profile=erik-5k
add comment=vc-385-08.16.25- name=72787255 password=72787255 profile=erik-5k
add comment=vc-385-08.16.25- name=63522484 password=63522484 profile=erik-5k
add comment=vc-385-08.16.25- name=24964389 password=24964389 profile=erik-5k
add comment=vc-385-08.16.25- name=85777987 password=85777987 profile=erik-5k
add comment=vc-385-08.16.25- name=72395668 password=72395668 profile=erik-5k
add comment=vc-385-08.16.25- name=38268549 password=38268549 profile=erik-5k
add comment=vc-385-08.16.25- name=64724594 password=64724594 profile=erik-5k
add comment=vc-385-08.16.25- name=24888266 password=24888266 profile=erik-5k
add comment=vc-385-08.16.25- name=95742238 password=95742238 profile=erik-5k
add comment=vc-385-08.16.25- name=75389297 password=75389297 profile=erik-5k
add comment=vc-385-08.16.25- name=47682765 password=47682765 profile=erik-5k
add comment=vc-385-08.16.25- name=43575667 password=43575667 profile=erik-5k
add comment=vc-385-08.16.25- name=74596656 password=74596656 profile=erik-5k
add comment=vc-385-08.16.25- name=29985268 password=29985268 profile=erik-5k
add comment=vc-385-08.16.25- name=56587995 password=56587995 profile=erik-5k
add comment=vc-385-08.16.25- name=49844662 password=49844662 profile=erik-5k
add comment=vc-385-08.16.25- name=77388242 password=77388242 profile=erik-5k
add comment=vc-385-08.16.25- name=36453652 password=36453652 profile=erik-5k
add comment=vc-385-08.16.25- name=89622289 password=89622289 profile=erik-5k
add comment=vc-385-08.16.25- name=28766267 password=28766267 profile=erik-5k
add comment=vc-385-08.16.25- name=25989574 password=25989574 profile=erik-5k
add comment=vc-385-08.16.25- name=32394645 password=32394645 profile=erik-5k
add comment=vc-385-08.16.25- name=67755434 password=67755434 profile=erik-5k
add comment=vc-385-08.16.25- name=86372286 password=86372286 profile=erik-5k
add comment=vc-385-08.16.25- name=88929873 password=88929873 profile=erik-5k
add comment=vc-385-08.16.25- name=25828943 password=25828943 profile=erik-5k
add comment=vc-385-08.16.25- name=89926544 password=89926544 profile=erik-5k
add comment=vc-385-08.16.25- name=43449626 password=43449626 profile=erik-5k
add comment=vc-385-08.16.25- name=86967349 password=86967349 profile=erik-5k
add comment=vc-385-08.16.25- name=89997942 password=89997942 profile=erik-5k
add comment=vc-385-08.16.25- name=37496692 password=37496692 profile=erik-5k
add comment=vc-385-08.16.25- name=79983558 password=79983558 profile=erik-5k
add comment=vc-407-08.20.25- name=588238 password=588238 profile=5k
add comment=vc-407-08.20.25- name=235962 password=235962 profile=5k
add comment=vc-558-08.20.25- name=67932 password=67932 profile=dafa-3k
add comment=vc-558-08.20.25- name=52332 password=52332 profile=dafa-3k
add comment=vc-558-08.20.25- name=36992 password=36992 profile=dafa-3k
add comment=vc-826-08.20.25- name=278596 password=278596 profile=dhea-3k
add comment=vc-826-08.20.25- name=297823 password=297823 profile=dhea-3k
add comment=vc-826-08.20.25- name=847873 password=847873 profile=dhea-3k
add name=290802 password=290802
add limit-uptime=5d name=9140 password=9140
add comment=vc-151-09.07.25- name=62448 password=62448 profile=umi-3k
add comment=vc-151-09.07.25- name=43723 password=43723 profile=umi-3k
add comment=vc-151-09.07.25- name=24249 password=24249 profile=umi-3k
add comment=vc-151-09.07.25- name=55748 password=55748 profile=umi-3k
add comment=vc-151-09.07.25- name=88446 password=88446 profile=umi-3k
add comment=vc-151-09.07.25- name=89424 password=89424 profile=umi-3k
add comment=vc-151-09.07.25- name=49555 password=49555 profile=umi-3k
add limit-uptime=2w1d name=39038 password=39038 profile=25k
add limit-uptime=4w2d name=765579 password=765579 profile=50k
add comment=vc-933-09.07.25- name=39959 password=39959 profile=3k
add comment=vc-933-09.07.25- name=88384 password=88384 profile=3k
add comment=vc-933-09.07.25- name=29796 password=29796 profile=3k
add comment=vc-933-09.07.25- name=24585 password=24585 profile=3k
add comment=vc-933-09.07.25- name=69572 password=69572 profile=3k
add comment=vc-933-09.07.25- name=24769 password=24769 profile=3k
add comment=vc-933-09.07.25- name=56895 password=56895 profile=3k
add comment=vc-985-09.07.25- name=479799 password=479799 profile=5k
add comment=vc-985-09.07.25- name=686527 password=686527 profile=5k
add comment=vc-985-09.07.25- name=746443 password=746443 profile=5k
add comment=vc-985-09.07.25- name=523355 password=523355 profile=5k
add comment=vc-985-09.07.25- name=754248 password=754248 profile=5k
add comment=vc-985-09.07.25- name=438654 password=438654 profile=5k
add comment=vc-985-09.07.25- name=677864 password=677864 profile=5k
add comment=vc-765-09.14.25- name=652885 password=652885 profile=5k
add comment=vc-765-09.14.25- name=272429 password=272429 profile=5k
add comment=vc-765-09.14.25- name=736938 password=736938 profile=5k
add comment=vc-765-09.14.25- name=434336 password=434336 profile=5k
add comment=vc-670-09.14.25- name=35989 password=35989 profile=3k-plentong
add comment=vc-670-09.14.25- name=35384 password=35384 profile=3k-plentong
add comment=vc-670-09.14.25- name=68987 password=68987 profile=3k-plentong
add comment=vc-480-09.14.25- name=643462 password=643462 profile=dona-3k
add comment=vc-480-09.14.25- name=949573 password=949573 profile=dona-3k
add comment=vc-480-09.14.25- name=277626 password=277626 profile=dona-3k
add name=nyanyo password=nyanyo profile=diskon
add name=wadi12 password=wadi12 profile=diskon
add comment=vc-620-09.29.25- name=84347772 password=84347772 profile=10k
add comment=vc-620-09.29.25- name=95773863 password=95773863 profile=10k
add comment=vc-620-09.29.25- name=75698829 password=75698829 profile=10k
add comment=vc-620-09.29.25- name=92929388 password=92929388 profile=10k
add comment=vc-620-09.29.25- name=38745628 password=38745628 profile=10k
add comment=vc-620-09.29.25- name=33727456 password=33727456 profile=10k
add comment=vc-620-09.29.25- name=67878322 password=67878322 profile=10k
add comment=vc-620-09.29.25- name=99349568 password=99349568 profile=10k
add comment=vc-620-09.29.25- name=24442939 password=24442939 profile=10k
add comment=vc-620-09.29.25- name=72992468 password=72992468 profile=10k
add comment=vc-620-09.29.25- name=46282756 password=46282756 profile=10k
add comment=vc-620-09.29.25- name=55478347 password=55478347 profile=10k
add comment=vc-620-09.29.25- name=63538624 password=63538624 profile=10k
add comment=vc-620-09.29.25- name=66548369 password=66548369 profile=10k
add comment=vc-620-09.29.25- name=97286797 password=97286797 profile=10k
add comment=vc-620-09.29.25- name=55556579 password=55556579 profile=10k
add comment=vc-620-09.29.25- name=72486228 password=72486228 profile=10k
add comment=vc-620-09.29.25- name=52867622 password=52867622 profile=10k
add comment=vc-620-09.29.25- name=52898529 password=52898529 profile=10k
add comment=vc-620-09.29.25- name=25687455 password=25687455 profile=10k
add comment=vc-620-09.29.25- name=74762858 password=74762858 profile=10k
add comment=vc-620-09.29.25- name=47454475 password=47454475 profile=10k
add comment=vc-620-09.29.25- name=23673399 password=23673399 profile=10k
add comment=vc-620-09.29.25- name=43385369 password=43385369 profile=10k
add comment=vc-620-09.29.25- name=35327788 password=35327788 profile=10k
add comment=vc-620-09.29.25- name=47764734 password=47764734 profile=10k
add comment=vc-620-09.29.25- name=23978674 password=23978674 profile=10k
add comment=vc-620-09.29.25- name=92669927 password=92669927 profile=10k
add comment=vc-620-09.29.25- name=34885548 password=34885548 profile=10k
add comment=vc-620-09.29.25- name=66384695 password=66384695 profile=10k
add comment=vc-620-09.29.25- name=76863748 password=76863748 profile=10k
add comment=vc-620-09.29.25- name=34237293 password=34237293 profile=10k
add comment=vc-578-09.30.25- name=399356 password=399356 profile=umi-3k
add comment=vc-216-09.30.25- name=495558 password=495558 profile=ipit-3k
add comment=vc-216-09.30.25- name=762425 password=762425 profile=ipit-3k
add comment=vc-216-09.30.25- name=395292 password=395292 profile=ipit-3k
add comment=vc-216-09.30.25- name=694493 password=694493 profile=ipit-3k
add comment=vc-216-09.30.25- name=845339 password=845339 profile=ipit-3k
add comment=vc-216-09.30.25- name=459757 password=459757 profile=ipit-3k
add comment=vc-216-09.30.25- name=796583 password=796583 profile=ipit-3k
add comment=vc-216-09.30.25- name=972547 password=972547 profile=ipit-3k
add comment=vc-216-09.30.25- name=393443 password=393443 profile=ipit-3k
add comment=vc-216-09.30.25- name=853495 password=853495 profile=ipit-3k
add comment=vc-216-09.30.25- name=865343 password=865343 profile=ipit-3k
add comment=vc-216-09.30.25- name=559496 password=559496 profile=ipit-3k
add comment=vc-216-09.30.25- name=637828 password=637828 profile=ipit-3k
add comment=vc-216-09.30.25- name=827955 password=827955 profile=ipit-3k
add comment=vc-216-09.30.25- name=475566 password=475566 profile=ipit-3k
add comment=vc-216-09.30.25- name=265398 password=265398 profile=ipit-3k
add comment=vc-216-09.30.25- name=575458 password=575458 profile=ipit-3k
add comment=vc-216-09.30.25- name=825588 password=825588 profile=ipit-3k
add comment=vc-216-09.30.25- name=929548 password=929548 profile=ipit-3k
add comment=vc-216-09.30.25- name=852483 password=852483 profile=ipit-3k
add comment=vc-216-09.30.25- name=856479 password=856479 profile=ipit-3k
add comment=vc-216-09.30.25- name=535987 password=535987 profile=ipit-3k
add comment=vc-889-09.30.25- name=557726 password=557726 profile=5k
add comment=vc-889-09.30.25- name=554885 password=554885 profile=5k
add comment=vc-889-09.30.25- name=578326 password=578326 profile=5k
add comment=vc-406-09.30.25- name=372899 password=372899 profile=dafa-3k
add comment=vc-406-09.30.25- name=454738 password=454738 profile=dafa-3k
add comment=vc-809-09.30.25- name=852442 password=852442 profile=dona-3k
add comment=vc-809-09.30.25- name=777839 password=777839 profile=dona-3k
add comment=vc-809-09.30.25- name=354975 password=354975 profile=dona-3k
add comment=vc-809-09.30.25- name=994898 password=994898 profile=dona-3k
add comment=vc-809-09.30.25- name=933535 password=933535 profile=dona-3k
add comment=vc-809-09.30.25- name=933374 password=933374 profile=dona-3k
add comment=vc-809-09.30.25- name=353683 password=353683 profile=dona-3k
add comment=vc-809-09.30.25- name=963372 password=963372 profile=dona-3k
add comment=vc-798-10.01.25- name=4988974 password=4988974 profile=10k
add comment=vc-798-10.01.25- name=8295977 password=8295977 profile=10k
add comment=vc-798-10.01.25- name=9737864 password=9737864 profile=10k
add comment=vc-798-10.01.25- name=8792656 password=8792656 profile=10k
add comment=vc-798-10.01.25- name=6287683 password=6287683 profile=10k
add comment=vc-798-10.01.25- name=2783856 password=2783856 profile=10k
add comment=vc-798-10.01.25- name=7438846 password=7438846 profile=10k
add comment=vc-798-10.01.25- name=4394892 password=4394892 profile=10k
add comment=vc-798-10.01.25- name=3396868 password=3396868 profile=10k
add comment=vc-798-10.01.25- name=5938859 password=5938859 profile=10k
add comment=vc-798-10.01.25- name=8995659 password=8995659 profile=10k
add comment=vc-798-10.01.25- name=7468574 password=7468574 profile=10k
add comment=vc-798-10.01.25- name=7233592 password=7233592 profile=10k
add comment=vc-798-10.01.25- name=8598689 password=8598689 profile=10k
add comment=vc-798-10.01.25- name=8268952 password=8268952 profile=10k
add comment=vc-798-10.01.25- name=8284475 password=8284475 profile=10k
add comment=vc-798-10.01.25- name=9984358 password=9984358 profile=10k
add comment=vc-798-10.01.25- name=3427699 password=3427699 profile=10k
add comment=vc-798-10.01.25- name=8726757 password=8726757 profile=10k
add comment=vc-798-10.01.25- name=5253484 password=5253484 profile=10k
add comment=vc-798-10.01.25- name=7372766 password=7372766 profile=10k
add comment=vc-798-10.01.25- name=6943774 password=6943774 profile=10k
add comment=vc-798-10.01.25- name=7977536 password=7977536 profile=10k
add comment=vc-798-10.01.25- name=4532259 password=4532259 profile=10k
add comment=vc-798-10.01.25- name=2757627 password=2757627 profile=10k
add comment=vc-798-10.01.25- name=2869767 password=2869767 profile=10k
add comment=vc-798-10.01.25- name=7544464 password=7544464 profile=10k
add comment=vc-798-10.01.25- name=5427584 password=5427584 profile=10k
add comment=vc-798-10.01.25- name=6828422 password=6828422 profile=10k
add name=22334455 password=22334455 profile=5k
add comment=vc-955-10.09.25- name=558562 password=558562 profile=5k
add comment=vc-955-10.09.25- name=522485 password=522485 profile=5k
add comment=vc-955-10.09.25- name=585932 password=585932 profile=5k
add comment=vc-955-10.09.25- name=526349 password=526349 profile=5k
add comment=vc-955-10.09.25- name=528692 password=528692 profile=5k
add comment=vc-955-10.09.25- name=567377 password=567377 profile=5k
add comment=vc-955-10.09.25- name=553855 password=553855 profile=5k
add comment=vc-955-10.09.25- name=534674 password=534674 profile=5k
add comment=vc-955-10.09.25- name=536873 password=536873 profile=5k
add comment=vc-955-10.09.25- name=547642 password=547642 profile=5k
add comment=vc-955-10.09.25- name=572543 password=572543 profile=5k
add comment=vc-955-10.09.25- name=529246 password=529246 profile=5k
add comment=vc-955-10.09.25- name=586274 password=586274 profile=5k
add comment=vc-955-10.09.25- name=587852 password=587852 profile=5k
add comment=vc-955-10.09.25- name=598374 password=598374 profile=5k
add comment=vc-941-10.19.25- name=669625 password=669625 profile=5k
add comment=vc-941-10.19.25- name=828223 password=828223 profile=5k
add comment=vc-941-10.19.25- name=675462 password=675462 profile=5k
add comment=vc-941-10.19.25- name=499233 password=499233 profile=5k
add comment=vc-258-10.19.25- name=625823 password=625823 profile=5k
add comment=vc-258-10.19.25- name=777327 password=777327 profile=5k
add comment=vc-495-10.19.25- name=369726 password=369726 profile=dhea-3k
add comment=vc-365-10.19.25- name=929834 password=929834 profile=umi-3k
add comment=vc-365-10.19.25- name=894288 password=894288 profile=umi-3k
add comment=vc-365-10.19.25- name=596738 password=596738 profile=umi-3k
add comment=vc-365-10.19.25- name=455447 password=455447 profile=umi-3k
add name=adiva password=adiva profile=client
add comment=vc-532-10.26.25- name=88349287 password=88349287 profile=erik-3k
add comment=vc-532-10.26.25- name=43239333 password=43239333 profile=erik-3k
add comment=vc-532-10.26.25- name=43699798 password=43699798 profile=erik-3k
add comment=vc-532-10.26.25- name=66645876 password=66645876 profile=erik-3k
add comment=vc-532-10.26.25- name=65437677 password=65437677 profile=erik-3k
add comment=vc-532-10.26.25- name=95827695 password=95827695 profile=erik-3k
add comment=vc-532-10.26.25- name=56274864 password=56274864 profile=erik-3k
add comment=vc-532-10.26.25- name=66572868 password=66572868 profile=erik-3k
add comment=vc-532-10.26.25- name=93243574 password=93243574 profile=erik-3k
add comment=vc-532-10.26.25- name=98789776 password=98789776 profile=erik-3k
add comment=vc-286-11.02.25- name=529643 password=529643 profile=5k
add comment=vc-162-11.03.25- name=692336 password=692336 profile=3k
add comment=vc-162-11.03.25- name=353728 password=353728 profile=3k
add comment=vc-162-11.03.25- name=987433 password=987433 profile=3k
add name=kenzo2 password=kenzo2 profile=client
add name=genta password=genta profile=client
add comment=vc-442-11.09.25- name=969845 password=969845 profile=umi-3k
add comment=vc-442-11.09.25- name=887878 password=887878 profile=umi-3k
add comment=vc-442-11.09.25- name=895789 password=895789 profile=umi-3k
add comment=vc-442-11.09.25- name=575274 password=575274 profile=umi-3k
add comment=vc-442-11.09.25- name=867559 password=867559 profile=umi-3k
add comment=vc-442-11.09.25- name=584487 password=584487 profile=umi-3k
add comment=vc-442-11.09.25- name=792686 password=792686 profile=umi-3k
add comment=vc-695-11.09.25- name=283556 password=283556 profile=dafa-3k
add comment=vc-695-11.09.25- name=379993 password=379993 profile=dafa-3k
add comment=vc-695-11.09.25- name=696686 password=696686 profile=dafa-3k
add comment=vc-695-11.09.25- name=289583 password=289583 profile=dafa-3k
add comment=vc-695-11.09.25- name=284723 password=284723 profile=dafa-3k
add comment=vc-726-11.09.25- name=539337 password=539337 profile=dona-3k
add comment=vc-726-11.09.25- name=875444 password=875444 profile=dona-3k
add comment=vc-726-11.09.25- name=267388 password=267388 profile=dona-3k
add comment=vc-726-11.09.25- name=829423 password=829423 profile=dona-3k
add name=regina password=regina profile=client
add comment=vc-857-11.20.25- name=456255 password=456255 profile=5k
add comment=vc-369-11.24.25- name=876925 password=876925 profile=umi-3k
add comment=vc-369-11.24.25- name=479769 password=479769 profile=umi-3k
add comment=vc-369-11.24.25- name=258476 password=258476 profile=umi-3k
add comment=vc-369-11.24.25- name=536525 password=536525 profile=umi-3k
add comment=vc-427-11.24.25- name=2485933 password=2485933 profile=5k
add comment=vc-427-11.24.25- name=3642689 password=3642689 profile=5k
add comment=vc-427-11.24.25- name=7693625 password=7693625 profile=5k
add comment=vc-427-11.24.25- name=6262876 password=6262876 profile=5k
add comment=up-WA-5703-241125 name=48910 password=48910 profile=3k
add comment=up-WA-5703-251125 name=93559 password=93559 profile=3k
add comment=up-WA-5703-261125 name=86499 password=86499 profile=3k
add comment=up-WA-5703-261125 name=41494 password=41494 profile=3k
add comment=up-VOUCHER-5703-271125 name=70917 password=70917 profile=2hp
add comment=Agent-AG001-291125 name=55790 password=55790 profile=3k
add comment=Agent-AG001-291125 name=28443 password=28443 profile=3k
add comment=up-WA-5703-301125 name=50840 password=50840 profile=15k
add comment=up-VOUCHER-MANUAL-5703-021225 name=ompong password=ompong \
    profile=client
add comment=vc-805-12.03.25- name=8387369 password=8387369 profile=5k
add comment=vc-805-12.03.25- name=8489736 password=8489736 profile=5k
add comment=vc-805-12.03.25- name=9756893 password=9756893 profile=5k
add comment=vc-805-12.03.25- name=5368478 password=5368478 profile=5k
add comment=vc-805-12.03.25- name=7888964 password=7888964 profile=5k
add comment=vc-805-12.03.25- name=7497586 password=7497586 profile=5k
add comment=vc-805-12.03.25- name=5644755 password=5644755 profile=5k
add comment=vc-805-12.03.25- name=4446229 password=4446229 profile=5k
add comment=vc-805-12.03.25- name=6694832 password=6694832 profile=5k
add comment=vc-805-12.03.25- name=9522926 password=9522926 profile=5k
add comment=vc-805-12.03.25- name=4686494 password=4686494 profile=5k
add comment=vc-805-12.03.25- name=8852626 password=8852626 profile=5k
add comment=vc-805-12.03.25- name=7979738 password=7979738 profile=5k
add comment=vc-805-12.03.25- name=6882284 password=6882284 profile=5k
add comment=vc-805-12.03.25- name=7289527 password=7289527 profile=5k
add comment=vc-805-12.03.25- name=5228659 password=5228659 profile=5k
add comment=vc-805-12.03.25- name=8645429 password=8645429 profile=5k
add comment=vc-805-12.03.25- name=7684957 password=7684957 profile=5k
add comment=vc-370-12.03.25- name=43228838 password=43228838 profile=10k
add comment=vc-370-12.03.25- name=96662839 password=96662839 profile=10k
add comment=vc-370-12.03.25- name=87285479 password=87285479 profile=10k
add comment=vc-370-12.03.25- name=84238544 password=84238544 profile=10k
add comment=vc-370-12.03.25- name=77599864 password=77599864 profile=10k
add comment=vc-370-12.03.25- name=38693722 password=38693722 profile=10k
add comment=vc-370-12.03.25- name=86353836 password=86353836 profile=10k
add comment=vc-370-12.03.25- name=54258436 password=54258436 profile=10k
add comment=vc-370-12.03.25- name=73425623 password=73425623 profile=10k
add comment=vc-370-12.03.25- name=36456993 password=36456993 profile=10k
add comment=vc-370-12.03.25- name=63544446 password=63544446 profile=10k
add comment=vc-370-12.03.25- name=94632254 password=94632254 profile=10k
add comment=vc-370-12.03.25- name=53426883 password=53426883 profile=10k
add comment=vc-370-12.03.25- name=74654747 password=74654747 profile=10k
add comment=vc-370-12.03.25- name=54987488 password=54987488 profile=10k
add comment=vc-370-12.03.25- name=65767848 password=65767848 profile=10k
add comment=vc-370-12.03.25- name=26346447 password=26346447 profile=10k
add comment=up-WA-5703-051225 name=91771 password=91771 profile=5k
add comment=up-WA-5703-051225 name=96079 password=96079 profile=10k
add comment=up-VOUCHER-MANUAL-5703-061225 name=kerang password=kerang \
    profile=client
add comment=vc-937-12.08.25- name=846887 password=846887 profile=umi-3k
add comment=vc-937-12.08.25- name=668372 password=668372 profile=umi-3k
add comment=vc-937-12.08.25- name=455772 password=455772 profile=umi-3k
add comment=vc-937-12.08.25- name=692676 password=692676 profile=umi-3k
add comment=vc-203-12.08.25- name=488259 password=488259 profile=dhea-3k
add comment=vc-203-12.08.25- name=286543 password=286543 profile=dhea-3k
add comment=vc-203-12.08.25- name=488835 password=488835 profile=dhea-3k
add comment=vc-329-12.08.25- name=964652 password=964652 profile=dona-3k
add comment=vc-329-12.08.25- name=988368 password=988368 profile=dona-3k
add comment=vc-841-12.08.25- name=595744 password=595744 profile=5k
add comment=vc-841-12.08.25- name=537863 password=537863 profile=5k
add comment=vc-841-12.08.25- name=557549 password=557549 profile=5k
add comment=up-VOUCHER-MANUAL-5703-201225 name=oland password=oland profile=\
    client
add comment=up-VOUCHER-MANUAL-5703-231225 name=bunga password=bunga profile=\
    client
add comment=vc-172-12.26.25- name=676582 password=676582 profile=5k
add comment=vc-526-12.26.25- name=155929 password=155929 profile=umi-3k
add comment=vc-526-12.26.25- name=165966 password=165966 profile=umi-3k
add comment=vc-526-12.26.25- name=159948 password=159948 profile=umi-3k
add comment=vc-207-12.29.25- name=3799 password=3799 profile=3k
add comment=vc-207-12.29.25- name=4445 password=4445 profile=3k
add comment=vc-207-12.29.25- name=6936 password=6936 profile=3k
add comment=vc-336-01.01.26- name=4449 password=4449 profile=3k
add comment=vc-832-01.03.26- name=326753 password=326753 profile=5k
add comment=vc-832-01.03.26- name=597844 password=597844 profile=5k
add comment=vc-832-01.03.26- name=835692 password=835692 profile=5k
add comment=vc-87874-gembok limit-uptime=1d name=87874 password=87874 \
    profile=15k
add name=inu password=inu profile=dewek
add comment=vc-261-01.10.26- name=84345 password=84345 profile=umi-3k
add comment=vc-261-01.10.26- name=59679 password=59679 profile=umi-3k
add comment=vc-261-01.10.26- name=83279 password=83279 profile=umi-3k
add comment=vc-261-01.10.26- name=96395 password=96395 profile=umi-3k
add comment=vc-261-01.10.26- name=36338 password=36338 profile=umi-3k
add comment=vc-261-01.10.26- name=34358 password=34358 profile=umi-3k
add comment=vc-346-01.10.26- name=435348 password=435348 profile=ipit-3k
add comment=vc-346-01.10.26- name=728247 password=728247 profile=ipit-3k
add comment=vc-346-01.10.26- name=469843 password=469843 profile=ipit-3k
add comment=vc-346-01.10.26- name=793669 password=793669 profile=ipit-3k
add comment=vc-346-01.10.26- name=729966 password=729966 profile=ipit-3k
add comment=vc-346-01.10.26- name=492475 password=492475 profile=ipit-3k
add comment=vc-346-01.10.26- name=838977 password=838977 profile=ipit-3k
add comment="sep/14/2026 20:59:14" name=777879 password=777879 profile=\
    ipit-3k
add comment=vc-346-01.10.26- name=252275 password=252275 profile=ipit-3k
add comment=vc-346-01.10.26- name=283335 password=283335 profile=ipit-3k
add comment=vc-346-01.10.26- name=857293 password=857293 profile=ipit-3k
add comment=vc-346-01.10.26- name=925968 password=925968 profile=ipit-3k
add comment=vc-346-01.10.26- name=357726 password=357726 profile=ipit-3k
add comment=vc-346-01.10.26- name=644336 password=644336 profile=ipit-3k
add comment=vc-346-01.10.26- name=249775 password=249775 profile=ipit-3k
add comment=vc-346-01.10.26- name=223729 password=223729 profile=ipit-3k
add comment=vc-346-01.10.26- name=334858 password=334858 profile=ipit-3k
add comment=vc-346-01.10.26- name=539289 password=539289 profile=ipit-3k
add comment=vc-346-01.10.26- name=852335 password=852335 profile=ipit-3k
add comment=vc-346-01.10.26- name=526548 password=526548 profile=ipit-3k
add comment=vc-346-01.10.26- name=264963 password=264963 profile=ipit-3k
add comment=vc-144-01.10.26- name=535598 password=535598 profile=3k
add comment=vc-144-01.10.26- name=976662 password=976662 profile=3k
add comment=vc-144-01.10.26- name=722887 password=722887 profile=3k
add comment=vc-144-01.10.26- name=696532 password=696532 profile=3k
add comment=vc-144-01.10.26- name=966849 password=966849 profile=3k
add comment=vc-144-01.10.26- name=436459 password=436459 profile=3k
add comment=vc-144-01.10.26- name=273878 password=273878 profile=3k
add comment=vc-144-01.10.26- name=527294 password=527294 profile=3k
add comment=vc-144-01.10.26- name=727883 password=727883 profile=3k
add comment=vc-144-01.10.26- name=483698 password=483698 profile=3k
add comment=vc-144-01.10.26- name=626226 password=626226 profile=3k
add comment=vc-144-01.10.26- name=922662 password=922662 profile=3k
add comment=vc-144-01.10.26- name=662579 password=662579 profile=3k
add comment=vc-144-01.10.26- name=524976 password=524976 profile=3k
add comment=vc-144-01.10.26- name=424543 password=424543 profile=3k
add comment=vc-144-01.10.26- name=575297 password=575297 profile=3k
add comment=vc-144-01.10.26- name=328387 password=328387 profile=3k
add comment=vc-144-01.10.26- name=967385 password=967385 profile=3k
add comment=up-VOUCHER-MANUAL-5703-130126 name=nissa password=nissa profile=\
    client
add comment=vc-513-01.14.26- name=643928 password=643928 profile=3k-plentong
add comment=vc-513-01.14.26- name=557928 password=557928 profile=3k-plentong
add comment=vc-513-01.14.26- name=384268 password=384268 profile=3k-plentong
add comment=vc-513-01.14.26- name=624642 password=624642 profile=3k-plentong
add comment=vc-624-01.15.26- name=66423 password=66423 profile=dafa-3k
add comment=vc-624-01.15.26- name=33929 password=33929 profile=dafa-3k
add comment=vc-343-01.15.26- name=643247 password=643247 profile=5k
add comment=vc-343-01.15.26- name=622298 password=622298 profile=5k
add comment=vc-343-01.15.26- name=487949 password=487949 profile=5k
add comment=vc-343-01.15.26- name=836933 password=836933 profile=5k
add comment=vc-343-01.15.26- name=733932 password=733932 profile=5k
add comment=vc-343-01.15.26- name=539532 password=539532 profile=5k
add comment=vc-343-01.15.26- name=544446 password=544446 profile=5k
add comment=vc-343-01.15.26- name=532459 password=532459 profile=5k
add comment=up-VOUCHER-MANUAL-5703-160126 name=winata password=winata \
    profile=client
add comment=vc-471-01.31.26- name=627925 password=627925 profile=umi-3k
add comment=vc-471-01.31.26- name=982765 password=982765 profile=umi-3k
add comment=vc-471-01.31.26- name=657523 password=657523 profile=umi-3k
add comment=vc-471-01.31.26- name=425563 password=425563 profile=umi-3k
add comment=vc-471-01.31.26- name=664829 password=664829 profile=umi-3k
add comment=vc-471-01.31.26- name=576837 password=576837 profile=umi-3k
add comment=vc-471-01.31.26- name=668939 password=668939 profile=umi-3k
add comment=vc-471-01.31.26- name=844846 password=844846 profile=umi-3k
add comment=vc-471-01.31.26- name=488449 password=488449 profile=umi-3k
add comment="sep/15/2026 12:43:36" name=693238 password=693238 profile=umi-3k
add comment=vc-471-01.31.26- name=555338 password=555338 profile=umi-3k
add comment=vc-471-01.31.26- name=484965 password=484965 profile=umi-3k
add comment=vc-471-01.31.26- name=594893 password=594893 profile=umi-3k
add comment=vc-189-01.31.26- name=575756 password=575756 profile=5k
add comment=vc-92272-gembok limit-uptime=1d name=92272 password=92272 \
    profile=15k
add comment=vc-57233-gembok limit-uptime=1d name=57233 password=57233 \
    profile=client
add comment=vc-93144-gembok limit-uptime=1d name=93144 password=93144 \
    profile=3k
add comment=vc-43417-gembok limit-uptime=1d name=43417 password=43417 \
    profile=3k
add comment=vc-59204-gembok limit-uptime=1d name=59204 password=59204 \
    profile=5k
add comment=vc-84373-gembok limit-uptime=1d name=84373 password=84373 \
    profile=3k
add comment=vc-62256-gembok limit-uptime=1d name=62256 password=62256 \
    profile=3k
add comment=vc-32636-gembok limit-uptime=1d name=32636 password=32636 \
    profile=client
add comment=vc-42284-gembok limit-uptime=1d name=42284 password=42284 \
    profile=3k
add comment=vc-32943-gembok limit-uptime=1d name=32943 password=32943 \
    profile=3k
add comment=vc-17519-gembok limit-uptime=1d name=17519 password=17519 \
    profile=client
add comment=vc-383-02.11.26- name=3429567 password=3429567 profile=5k
add comment=vc-383-02.11.26- name=6669367 password=6669367 profile=5k
add comment=vc-383-02.11.26- name=7894299 password=7894299 profile=5k
add comment=vc-383-02.11.26- name=4333637 password=4333637 profile=5k
add comment=vc-383-02.11.26- name=3888563 password=3888563 profile=5k
add comment=vc-383-02.11.26- name=3445654 password=3445654 profile=5k
add comment=vc-38867-gembok limit-uptime=1d name=38867 password=38867 \
    profile=3k
add comment=vc-48139-gembok limit-uptime=1d name=48139 password=48139 \
    profile=3k
add comment=vc-64494-gembok limit-uptime=1d name=64494 password=64494
add comment=vc-85580-gembok limit-uptime=1d name=85580 password=85580 \
    profile=3k
add comment=vc-43207-gembok limit-uptime=1d name=43207 password=43207 \
    profile=client
add comment=vc-550-02.12.26- name=27747937 password=27747937 profile=10k
add comment=vc-550-02.12.26- name=59997967 password=59997967 profile=10k
add comment=vc-550-02.12.26- name=46875829 password=46875829 profile=10k
add comment=vc-550-02.12.26- name=97534658 password=97534658 profile=10k
add comment=vc-550-02.12.26- name=54799235 password=54799235 profile=10k
add comment=vc-550-02.12.26- name=67244567 password=67244567 profile=10k
add comment=vc-550-02.12.26- name=37688929 password=37688929 profile=10k
add comment=vc-550-02.12.26- name=32669538 password=32669538 profile=10k
add comment=vc-550-02.12.26- name=95584727 password=95584727 profile=10k
add comment=vc-18566-gembok limit-uptime=1d name=18566 password=18566
add comment=vc-93959-gembok limit-uptime=1d name=93959 password=93959
add comment=vc-73903-gembok limit-uptime=1d name=73903 password=73903 \
    profile=3k
add comment=vc-97924-gembok limit-uptime=1d name=97924 password=97924 \
    profile=5k
add comment=vc-77594-gembok limit-uptime=1d name=77594 password=77594 \
    profile=50k
add comment=vc-96083-gembok limit-uptime=1d name=96083 password=96083 \
    profile=client
add comment=vc-88380-gembok limit-uptime=1d name=88380 password=88380 \
    profile=3k
add comment=vc-82521-gembok limit-uptime=1d name=82521 password=82521 \
    profile=5k
add comment=vc-62491-gembok limit-uptime=1d name=62491 password=62491 \
    profile=3k
add comment=vc-92922-gembok limit-uptime=1d name=92922 password=92922 \
    profile=25k
add comment=vc-65058-gembok limit-uptime=1d name=65058 password=65058
add comment=vc-16702-gembok limit-uptime=1d name=16702 password=16702
add comment=vc-27635-gembok limit-uptime=1d name=27635 password=27635 \
    profile=10k
add comment=vc-45838-gembok limit-uptime=1d name=45838 password=45838 \
    profile=15k
add comment=vc-84893-gembok limit-uptime=1d name=84893 password=84893 \
    profile=10k
add comment=vc-86872-gembok limit-uptime=1d name=86872 password=86872 \
    profile=10k
add comment=vc-31748-gembok limit-uptime=1d name=31748 password=31748 \
    profile=5k
add comment=vc-61958-gembok limit-uptime=1d name=61958 password=61958
add comment=vc-779-02.20.26- name=66542 password=66542 profile=umi-3k
add comment=vc-779-02.20.26- name=42668 password=42668 profile=umi-3k
add comment=vc-779-02.20.26- name=46846 password=46846 profile=umi-3k
add comment=vc-779-02.20.26- name=25778 password=25778 profile=umi-3k
add comment=vc-101-02.20.26- name=686392 password=686392 profile=dafa-3k
add comment=vc-101-02.20.26- name=457775 password=457775 profile=dafa-3k
add comment=vc-101-02.20.26- name=897883 password=897883 profile=dafa-3k
add comment=vc-101-02.20.26- name=253844 password=253844 profile=dafa-3k
add comment=vc-101-02.20.26- name=724623 password=724623 profile=dafa-3k
add comment=vc-101-02.20.26- name=868732 password=868732 profile=dafa-3k
add comment=vc-86361-gembok limit-uptime=1d name=86361 password=86361 \
    profile=3k
add comment=vc-49538-gembok limit-uptime=1d name=49538 password=49538 \
    profile=client
add comment=vc-65695-gembok limit-uptime=1d name=65695 password=65695 \
    profile=5k
add comment=vc-49855-gembok limit-uptime=1d name=49855 password=49855 \
    profile=10k
add comment=vc-31370-gembok limit-uptime=1d name=31370 password=31370 \
    profile=50k
add comment=vc-71711-gembok limit-uptime=1d name=71711 password=71711 \
    profile=3k
add comment=vc-61525-gembok limit-uptime=1d name=61525 password=61525 \
    profile=3k
add comment=sales:alijaya-26/02/26 name=WJ8NH8 password=WJ8NH8 profile=3k
add comment=vc-11608-gembok limit-uptime=1d name=11608 password=11608 \
    profile=3k
add comment=vc-51744-gembok limit-uptime=1d name=51744 password=51744 \
    profile=5k
add comment=vc-12801-gembok limit-uptime=1d name=12801 password=12801 \
    profile=3k
add comment=vc-86227-gembok limit-uptime=1d name=86227 password=86227 \
    profile=3k
add comment=vc-425-02.27.26- name=259837 password=259837 profile=5k
add comment=vc-425-02.27.26- name=562574 password=562574 profile=5k
add comment=vc-425-02.27.26- name=329749 password=329749 profile=5k
add comment=vc-81606-gembok limit-uptime=1d name=81606 password=81606 \
    profile=3k
add comment=vc-49260-gembok limit-uptime=1d name=49260 password=49260 \
    profile=client
add comment=vc-93399-gembok limit-uptime=1d name=93399 password=93399
add comment=vc-25477-gembok limit-uptime=1d name=25477 password=25477 \
    profile=client
add comment=vc-56920-gembok limit-uptime=1d name=56920 password=56920 \
    profile=5k
add comment=vc-160-03.05.26- name=272389 password=272389 profile=dona-3k
add comment=vc-160-03.05.26- name=656438 password=656438 profile=dona-3k
add comment=vc-160-03.05.26- name=335225 password=335225 profile=dona-3k
add comment=vc-731-03.05.26- name=273223 password=273223 profile=ipit-3k
add comment=vc-731-03.05.26- name=489842 password=489842 profile=ipit-3k
add comment=vc-731-03.05.26- name=325798 password=325798 profile=ipit-3k
add comment=vc-731-03.05.26- name=676428 password=676428 profile=ipit-3k
add comment=vc-731-03.05.26- name=385266 password=385266 profile=ipit-3k
add comment=vc-731-03.05.26- name=964892 password=964892 profile=ipit-3k
add comment=vc-731-03.05.26- name=227538 password=227538 profile=ipit-3k
add comment=vc-10354-gembok limit-uptime=1d name=10354 password=10354 \
    profile=50k
add comment=vc-41965-gembok limit-uptime=1d name=41965 password=41965 \
    profile=3k
add comment=vc-92117-gembok limit-uptime=1d name=92117 password=92117
add comment=vc-54570-gembok limit-uptime=1d name=54570 password=54570 \
    profile=3k
add comment=vc-412-03.14.26- name=683488 password=683488 profile=5k
add comment=vc-412-03.14.26- name=742558 password=742558 profile=5k
add comment=vc-412-03.14.26- name=924494 password=924494 profile=5k
add comment=vc-412-03.14.26- name=594774 password=594774 profile=5k
add comment=vc-412-03.14.26- name=975346 password=975346 profile=5k
add comment=vc-412-03.14.26- name=744626 password=744626 profile=5k
add comment=vc-412-03.14.26- name=243254 password=243254 profile=5k
add comment=vc-412-03.14.26- name=325772 password=325772 profile=5k
add comment=vc-16484-gembok limit-uptime=1d name=16484 password=16484 \
    profile=3k
add comment=vc-601-03.22.26- name=359749 password=359749 profile=umi-3k
add comment=vc-601-03.22.26- name=472746 password=472746 profile=umi-3k
add comment=vc-601-03.22.26- name=883325 password=883325 profile=umi-3k
add comment=vc-601-03.22.26- name=496544 password=496544 profile=umi-3k
add comment=vc-601-03.22.26- name=723775 password=723775 profile=umi-3k
add comment=vc-755-03.22.26- name=63775 password=63775 profile=ipit-3k
add comment=vc-239-03.22.26- name=978542 password=978542 profile=3k
add comment=vc-239-03.22.26- name=724683 password=724683 profile=3k
add comment=vc-239-03.22.26- name=866259 password=866259 profile=3k
add comment=vc-239-03.22.26- name=588546 password=588546 profile=3k
add comment=vc-239-03.22.26- name=832282 password=832282 profile=3k
add comment=vc-239-03.22.26- name=484989 password=484989 profile=3k
add comment=vc-239-03.22.26- name=759883 password=759883 profile=3k
add comment=vc-239-03.22.26- name=739452 password=739452 profile=3k
add comment=vc-239-03.22.26- name=828642 password=828642 profile=3k
add comment=vc-159-03.22.26- name=59238 password=59238 profile=5k
add comment=vc-54302-gembok limit-uptime=1d name=54302 password=54302 \
    profile=3k
add comment=vc-98174-gembok limit-uptime=1d name=98174 password=98174 \
    profile=3k
add comment=vc-40776-gembok limit-uptime=1d name=40776 password=40776 \
    profile=3k
add comment=vc-33593-gembok limit-uptime=1d name=33593 password=33593 \
    profile=client
add comment=vc-56559-gembok limit-uptime=1d name=56559 password=56559 \
    profile=50k
add comment=vc-75631-gembok limit-uptime=1d name=75631 password=75631 \
    profile=5k
add comment=vc-44537-gembok limit-uptime=1d name=44537 password=44537 \
    profile=15k
add comment=vc-23566-gembok limit-uptime=1d name=23566 password=23566 \
    profile=25k
add comment=vc-35322-gembok limit-uptime=1d name=35322 password=35322 \
    profile=5k
add comment=vc-71625-gembok limit-uptime=1d name=71625 password=71625 \
    profile=3k
add comment=vc-21202-gembok limit-uptime=1d name=21202 password=21202 \
    profile=50k
add comment=vc-96495-gembok limit-uptime=1d name=96495 password=96495 \
    profile=3k
add comment=vc-10402-gembok limit-uptime=1d name=10402 password=10402 \
    profile=client
add comment=vc-26811-gembok limit-uptime=1d name=26811 password=26811 \
    profile=client
add comment=vc-86112-gembok limit-uptime=1d name=86112 password=86112 \
    profile=client
add comment=vc-61799-gembok limit-uptime=1d name=61799 password=61799 \
    profile=25k
add comment=vc-48521-gembok limit-uptime=1d name=48521 password=48521
add comment=vc-324-03.31.26- name=4886369 password=4886369 profile=dafa-3k
add comment=vc-324-03.31.26- name=6952583 password=6952583 profile=dafa-3k
add comment=vc-369-03.31.26- name=45589 password=45589 profile=3k
add comment=vc-369-03.31.26- name=27338 password=27338 profile=3k
add comment=vc-369-03.31.26- name=59943 password=59943 profile=3k
add comment=vc-public-voucher-VCR20260401032319HGAG name=248094 password=\
    248094 profile=3k
add comment=vc-77015-gembok limit-uptime=1d name=77015 password=77015 \
    profile=3k
add comment=vc-45152-gembok limit-uptime=1d name=45152 password=45152
add comment=vc-92233-gembok limit-uptime=1d name=92233 password=92233 \
    profile=3k
add comment=vc-49998-gembok limit-uptime=1d name=49998 password=49998
add comment=vc-12030-gembok limit-uptime=1d name=12030 password=12030 \
    profile=client
add comment=vc-60699-gembok limit-uptime=1d name=60699 password=60699 \
    profile=3k
add comment=vc-14827-gembok limit-uptime=1d name=14827 password=14827
add comment=vc-84145-gembok limit-uptime=1d name=84145 password=84145 \
    profile=client
add comment=vc-51933-gembok limit-uptime=1d name=51933 password=51933 \
    profile=5k
add comment=vc-41715-gembok limit-uptime=1d name=41715 password=41715 \
    profile=5k
add comment=vc-84147-gembok limit-uptime=1d name=84147 password=84147 \
    profile=10k
add comment=vc-62521-gembok limit-uptime=1d name=62521 password=62521 \
    profile=10k
add comment=vc-590-04.06.26- name=38228 password=38228 profile=5k
add comment=vc-590-04.06.26- name=42428 password=42428 profile=5k
add comment=vc-590-04.06.26- name=64469 password=64469 profile=5k
add comment=vc-590-04.06.26- name=24987 password=24987 profile=5k
add comment=vc-697-04.06.26- name=2334876 password=2334876 profile=dhea-3k
add comment=vc-697-04.06.26- name=5422367 password=5422367 profile=dhea-3k
add comment=vc-697-04.06.26- name=5253939 password=5253939 profile=dhea-3k
add comment=vc-697-04.06.26- name=2434435 password=2434435 profile=dhea-3k
add comment=vc-697-04.06.26- name=7927546 password=7927546 profile=dhea-3k
add comment=vc-697-04.06.26- name=3887649 password=3887649 profile=dhea-3k
add comment=vc-697-04.06.26- name=4873927 password=4873927 profile=dhea-3k
add comment=vc-697-04.06.26- name=8664656 password=8664656 profile=dhea-3k
add comment=vc-697-04.06.26- name=6646898 password=6646898 profile=dhea-3k
add comment=vc-697-04.06.26- name=4849929 password=4849929 profile=dhea-3k
add comment=vc-16805-gembok limit-uptime=1d name=16805 password=16805 \
    profile=15k
add comment=vc-32824-gembok limit-uptime=1d name=32824 password=32824 \
    profile=3k
add comment=vc-public-voucher-VCR20260408094559KYYG name=503813 password=\
    503813 profile=3k
add comment=vc-12237-gembok limit-uptime=1d name=12237 password=12237 \
    profile=3k
add comment=vc-62891-gembok limit-uptime=1d name=62891 password=62891 \
    profile=client
add comment=vc-19854-gembok limit-uptime=1d name=19854 password=19854 \
    profile=50k
add comment=vc-67654-gembok limit-uptime=1d name=67654 password=67654 \
    profile=25k
add comment=vc-49048-gembok limit-uptime=1d name=49048 password=49048 \
    profile=client
add comment=vc-ali-09/04/26 name=83594 password=83594 profile=3k
add comment=vc-51495-gembok limit-uptime=1d name=51495 password=51495 \
    profile=3k
add comment=vc-39135-gembok limit-uptime=1d name=39135 password=39135 \
    profile=3k
add comment=vc-65160-gembok limit-uptime=1d name=65160 password=65160 \
    profile=3k
add comment=vc-71844-gembok limit-uptime=1d name=71844 password=71844 \
    profile=3k
add comment="parent:3k vc-wa-6281947215703-20260412043655" name=nyobain \
    password=123 profile=3k
add comment="parent:3k vc-tg-567858628-20260417133648" name=testerson \
    password=123 profile=3k
add comment="vc kamid 19/04/2026" name=kamid password=kamid profile=3k
add comment="Auto Telegram" limit-uptime=1h name=1742 password=1742 profile=\
    5k
add comment=vc-8242-3k limit-uptime=1d name=8242 password=8242 profile=3k
add comment=vc-8249-5k limit-uptime=2d name=8249 password=8249 profile=5k
add comment=vc-4416-dafa-3k limit-uptime=1d name=4416 password=4416 profile=\
    dafa-3k
add comment=vc-3408-Test-3000 limit-uptime=1d name=3408 password=3408
add comment=vc-7960-Test-3000 limit-uptime=1d name=7960 password=7960
add comment=vc-113-04.22.26- name=74989 password=74989 profile=5k
add comment=vc-113-04.22.26- name=57754 password=57754 profile=5k
add comment=vc-901-04.22.26- name=4625659 password=4625659 profile=3k
add comment=vc-901-04.22.26- name=2432545 password=2432545 profile=3k
add comment=vc-914-04.22.26- name=5947765 password=5947765 profile=dona-3k
add comment=vc-914-04.22.26- name=7945436 password=7945436 profile=dona-3k
add comment=vc-914-04.22.26- name=3792988 password=3792988 profile=dona-3k
add comment=vc-287-04.22.26- name=5795755 password=5795755 profile=\
    3k-plentong
add comment=vc-287-04.22.26- name=3744542 password=3744542 profile=\
    3k-plentong
add comment=vc-287-04.22.26- name=8689937 password=8689937 profile=\
    3k-plentong
add comment=vc-287-04.22.26- name=3276733 password=3276733 profile=\
    3k-plentong
add comment=vc-287-04.22.26- name=3263277 password=3263277 profile=\
    3k-plentong
add comment=vc-287-04.22.26- name=3675769 password=3675769 profile=\
    3k-plentong
add comment=vc-287-04.22.26- name=9822432 password=9822432 profile=\
    3k-plentong
add comment=vc-390342-5k limit-uptime=2d name=390342 password=390342 profile=\
    5k
add comment=vc-872738-5k limit-uptime=2d name=872738 password=872738 profile=\
    5k
add comment=vc-722215-5k limit-uptime=2d name=722215 password=722215 profile=\
    5k
add comment=vc-392490-5k limit-uptime=2d name=392490 password=392490 profile=\
    5k
add comment=vc-604133-5k limit-uptime=2d name=604133 password=604133 profile=\
    5k
add comment=vc-9215-3k limit-uptime=1d name=9215 password=9215 profile=3k
add comment=vc-4078-3k limit-uptime=1d name=4078 password=4078 profile=3k
add comment=vc-8106-3k limit-uptime=1d name=8106 password=8106 profile=3k
add comment=vc-260166-jajal3000 limit-uptime=1d name=260166 password=260166
add comment=vc-696702-jajal3000 limit-uptime=1d name=696702 password=696702
add comment=vc-958618-jajal3000 limit-uptime=1d name=958618 password=958618
add comment=vc-808613-jajal3000 limit-uptime=1d name=808613 password=808613
add comment=vc-867324-jajal3000 limit-uptime=1d name=867324 password=867324
add comment=vc-756627-3k limit-uptime=1d name=756627 password=756627 profile=\
    3k
add comment=vc-582739-3k limit-uptime=1d name=582739 password=582739 profile=\
    3k
add comment=vc-598296-3k limit-uptime=1d name=598296 password=598296 profile=\
    3k
add comment=vc-767545-3k limit-uptime=1d name=767545 password=767545 profile=\
    3k
add comment=vc-805195-3k limit-uptime=1d name=805195 password=805195 profile=\
    3k
add comment=vc-119052-5k limit-uptime=2d name=119052 password=119052 profile=\
    5k
add comment=vc-171438-5k limit-uptime=2d name=171438 password=171438 profile=\
    5k
add comment=vc-188612-5k limit-uptime=2d name=188612 password=188612 profile=\
    5k
add comment=vc-279497-5k limit-uptime=2d name=279497 password=279497 profile=\
    5k
add comment=vc-176888-5k limit-uptime=2d name=176888 password=176888 profile=\
    5k
add comment=vc-156547-3k limit-uptime=1d name=156547 password=156547 profile=\
    3k
add comment=vc-848017-3k limit-uptime=1d name=848017 password=848017 profile=\
    3k
add comment=vc-427535-3k limit-uptime=1d name=427535 password=427535 profile=\
    3k
add comment=vc-690517-3k limit-uptime=1d name=690517 password=690517 profile=\
    3k
add comment=vc-160124-3k limit-uptime=1d name=160124 password=160124 profile=\
    3k
add comment=vc-477221-3k limit-uptime=1d name=477221 password=477221 profile=\
    3k
add comment=vc-516725-3k limit-uptime=1d name=516725 password=516725 profile=\
    3k
add comment=vc-493545-3k limit-uptime=1d name=493545 password=493545 profile=\
    3k
add comment=vc-571885-3k limit-uptime=1d name=571885 password=571885 profile=\
    3k
add comment=vc-305561-3k limit-uptime=1d name=305561 password=305561 profile=\
    3k
add comment=vc-272704-3k limit-uptime=1d name=272704 password=272704 profile=\
    3k
add comment=vc-136032-3k limit-uptime=1d name=136032 password=136032 profile=\
    3k
add comment=vc-594009-3k limit-uptime=1d name=594009 password=594009 profile=\
    3k
add comment=vc-157198-3k limit-uptime=1d name=157198 password=157198 profile=\
    3k
add comment=vc-149074-3k limit-uptime=1d name=149074 password=149074 profile=\
    3k
add comment=vc-442115-3k limit-uptime=1d name=442115 password=442115 profile=\
    3k
add comment=vc-217382-3k limit-uptime=1d name=217382 password=217382 profile=\
    3k
add comment=vc-882361-3k limit-uptime=1d name=882361 password=882361 profile=\
    3k
add comment=vc-184410-3k limit-uptime=1d name=184410 password=184410 profile=\
    3k
add comment=vc-121625-3k limit-uptime=1d name=121625 password=121625 profile=\
    3k
add comment=vc-197003-3k limit-uptime=1d name=197003 password=197003 profile=\
    3k
add comment=vc-462784-3k limit-uptime=1d name=462784 password=462784 profile=\
    3k
add comment=vc-503188-3k limit-uptime=1d name=503188 password=503188 profile=\
    3k
add comment=vc-101789-3k limit-uptime=1d name=101789 password=101789 profile=\
    3k
add comment=vc-240201-3k limit-uptime=1d name=240201 password=240201 profile=\
    3k
add comment=vc-675491-3k limit-uptime=1d name=675491 password=675491 profile=\
    3k
add comment=vc-762498-3k limit-uptime=1d name=762498 password=762498 profile=\
    3k
add comment=vc-558629-3k limit-uptime=1d name=558629 password=558629 profile=\
    3k
add comment=vc-300033-3k limit-uptime=1d name=300033 password=300033 profile=\
    3k
add comment=vc-511672-3k limit-uptime=1d name=511672 password=511672 profile=\
    3k
add comment=vc-835012-3k limit-uptime=1d name=835012 password=835012 profile=\
    3k
add comment=vc-370433-3k limit-uptime=1d name=370433 password=370433 profile=\
    3k
add comment=vc-699153-3k limit-uptime=1d name=699153 password=699153 profile=\
    3k
add comment=vc-690200-3k limit-uptime=1d name=690200 password=690200 profile=\
    3k
add comment=vc-150861-3k limit-uptime=1d name=150861 password=150861 profile=\
    3k
add comment=vc-310951-3k limit-uptime=1d name=310951 password=310951 profile=\
    3k
add comment=vc-985129-3k limit-uptime=1d name=985129 password=985129 profile=\
    3k
add comment=vc-169472-3k limit-uptime=1d name=169472 password=169472 profile=\
    3k
add comment=vc-611925-3k limit-uptime=1d name=611925 password=611925 profile=\
    3k
add comment=vc-271178-3k limit-uptime=1d name=271178 password=271178 profile=\
    3k
add comment=vc-528151-3k limit-uptime=1d name=528151 password=528151 profile=\
    3k
add comment=vc-779633-3k limit-uptime=1d name=779633 password=779633 profile=\
    3k
add comment=vc-116318-3k limit-uptime=1d name=116318 password=116318 profile=\
    3k
add comment=vc-799713-3k limit-uptime=1d name=799713 password=799713 profile=\
    3k
add comment=vc-542748-3k limit-uptime=1d name=542748 password=542748 profile=\
    3k
add comment=vc-518539-3k limit-uptime=1d name=518539 password=518539 profile=\
    3k
add comment=vc-481928-3k limit-uptime=1d name=481928 password=481928 profile=\
    3k
add comment=vc-442931-3k limit-uptime=1d name=442931 password=442931 profile=\
    3k
add comment=vc-417590-3k limit-uptime=1d name=417590 password=417590 profile=\
    3k
add comment=vc-208298-3k limit-uptime=1d name=208298 password=208298 profile=\
    3k
add comment=vc-543565-3k limit-uptime=1d name=543565 password=543565 profile=\
    3k
add comment=vc-820139-3k limit-uptime=1d name=820139 password=820139 profile=\
    3k
add comment=vc-340308-3k limit-uptime=1d name=340308 password=340308 profile=\
    3k
add comment=vc-331413-3k limit-uptime=1d name=331413 password=331413 profile=\
    3k
add comment=vc-383011-3k limit-uptime=1d name=383011 password=383011 profile=\
    3k
add comment=vc-207088-3k limit-uptime=1d name=207088 password=207088 profile=\
    3k
add comment=vc-249583-3k limit-uptime=1d name=249583 password=249583 profile=\
    3k
add comment=vc-214285-3k limit-uptime=1d name=214285 password=214285 profile=\
    3k
add comment=vc-147664-3k limit-uptime=1d name=147664 password=147664 profile=\
    3k
add comment=vc-611138-3k limit-uptime=1d name=611138 password=611138 profile=\
    3k
add comment=vc-754125-3k limit-uptime=1d name=754125 password=754125 profile=\
    3k
add comment=vc-111725-3k limit-uptime=1d name=111725 password=111725 profile=\
    3k
add comment=vc-818053-3k limit-uptime=1d name=818053 password=818053 profile=\
    3k
add comment=vc-828951-3k limit-uptime=1d name=828951 password=828951 profile=\
    3k
add comment=vc-760613-3k limit-uptime=1d name=760613 password=760613 profile=\
    3k
add comment=vc-684464-3k limit-uptime=1d name=684464 password=684464 profile=\
    3k
add comment=vc-115088-3k limit-uptime=1d name=115088 password=115088 profile=\
    3k
add comment=vc-152681-3k limit-uptime=1d name=152681 password=152681 profile=\
    3k
add comment=vc-514300-3k limit-uptime=1d name=514300 password=514300 profile=\
    3k
add comment=vc-152678-3k limit-uptime=1d name=152678 password=152678 profile=\
    3k
add comment=vc-613329-3k limit-uptime=1d name=613329 password=613329 profile=\
    3k
add comment=vc-626971-3k limit-uptime=1d name=626971 password=626971 profile=\
    3k
add comment=vc-310921-3k limit-uptime=1d name=310921 password=310921 profile=\
    3k
add comment=vc-521197-3k limit-uptime=1d name=521197 password=521197 profile=\
    3k
add comment=vc-396733-3k limit-uptime=1d name=396733 password=396733 profile=\
    3k
add comment=vc-206473-3k limit-uptime=1d name=206473 password=206473 profile=\
    3k
add comment=vc-565106-3k limit-uptime=1d name=565106 password=565106 profile=\
    3k
add comment=ag-alijaya-507906-3k limit-uptime=1d name=507906 password=507906 \
    profile=3k
add comment=ag-alijaya-205831-3k limit-uptime=1d name=205831 password=205831 \
    profile=3k
add comment=ag-alijaya-122114-3k limit-uptime=1d name=122114 password=122114 \
    profile=3k
add comment=ag-alijaya-433294-3k limit-uptime=1d name=433294 password=433294 \
    profile=3k
add comment=pub-1-83FQFC-nyoba2000 limit-uptime=1d name=83FQFC password=\
    83FQFC
add comment=pub-2-68FA77-nyoba2000 limit-uptime=1d name=68FA77 password=\
    68FA77
add comment=pub-3-SMN8T2-nyoba2000 limit-uptime=1d name=SMN8T2 password=\
    SMN8T2
add comment=vc-479-04.27.26- name=8665396 password=8665396 profile=5k
add comment=vc-479-04.27.26- name=7575297 password=7575297 profile=5k
add comment="sep/19/2026 06:37:16" name=8593759 password=8593759 profile=10k
add comment=vc-929-04.27.26- name=8695546 password=8695546 profile=10k
add comment=vc-929-04.27.26- name=4247963 password=4247963 profile=10k
add comment=vc-929-04.27.26- name=7372838 password=7372838 profile=10k
add comment=vc-929-04.27.26- name=7783942 password=7783942 profile=10k
add comment=vc-929-04.27.26- name=9475228 password=9475228 profile=10k
add comment=vc-929-04.27.26- name=6935963 password=6935963 profile=10k
add comment=vc-929-04.27.26- name=4935558 password=4935558 profile=10k
add comment=vc-929-04.27.26- name=6252656 password=6252656 profile=10k
add comment=vc-929-04.27.26- name=4436364 password=4436364 profile=10k
add comment=vc-929-04.27.26- name=4885954 password=4885954 profile=10k
add comment=vc-929-04.27.26- name=9268728 password=9268728 profile=10k
add comment=vc-929-04.27.26- name=6887577 password=6887577 profile=10k
add comment=vc-929-04.27.26- name=6295294 password=6295294 profile=10k
add comment=vc-929-04.27.26- name=7764586 password=7764586 profile=10k
add comment=vc-929-04.27.26- name=9429946 password=9429946 profile=10k
add comment=vc-929-04.27.26- name=4895427 password=4895427 profile=10k
add comment=vc-929-04.27.26- name=6788233 password=6788233 profile=10k
add comment="sep/19/2026 17:21:33" name=4648272 password=4648272 profile=10k
add comment=vc-929-04.27.26- name=2422977 password=2422977 profile=10k
add comment=vc-929-04.27.26- name=5798332 password=5798332 profile=10k
add comment=vc-929-04.27.26- name=3432569 password=3432569 profile=10k
add comment=vc-929-04.27.26- name=7548677 password=7548677 profile=10k
add comment=vc-929-04.27.26- name=6892898 password=6892898 profile=10k
add comment=vc-929-04.27.26- name=7555938 password=7555938 profile=10k
add comment=vc-929-04.27.26- name=5297463 password=5297463 profile=10k
add comment=vc-929-04.27.26- name=9542796 password=9542796 profile=10k
add comment=vc-929-04.27.26- name=2959962 password=2959962 profile=10k
add comment=vc-929-04.27.26- name=3244827 password=3244827 profile=10k
add comment=vc-929-04.27.26- name=3466929 password=3466929 profile=10k
add comment=vc-929-04.27.26- name=7369965 password=7369965 profile=10k
add comment=vc-929-04.27.26- name=9736783 password=9736783 profile=10k
add comment=vc-929-04.27.26- name=6893978 password=6893978 profile=10k
add comment=vc-929-04.27.26- name=8478737 password=8478737 profile=10k
add comment=vc-929-04.27.26- name=3722459 password=3722459 profile=10k
add comment=vc-929-04.27.26- name=9234493 password=9234493 profile=10k
add comment=vc-929-04.27.26- name=2393337 password=2393337 profile=10k
add comment=vc-929-04.27.26- name=5243852 password=5243852 profile=10k
add comment=vc-929-04.27.26- name=3943752 password=3943752 profile=10k
add comment=vc-929-04.27.26- name=2536226 password=2536226 profile=10k
add comment=vc-929-04.27.26- name=8799654 password=8799654 profile=10k
add comment=vc-929-04.27.26- name=3427757 password=3427757 profile=10k
add comment=vc-929-04.27.26- name=3987692 password=3987692 profile=10k
add comment=vc-929-04.27.26- name=8964892 password=8964892 profile=10k
add comment=vc-929-04.27.26- name=7586836 password=7586836 profile=10k
add comment=vc-929-04.27.26- name=8745352 password=8745352 profile=10k
add comment=vc-929-04.27.26- name=4755869 password=4755869 profile=10k
add comment=vc-929-04.27.26- name=6226436 password=6226436 profile=10k
add comment=vc-929-04.27.26- name=6337287 password=6337287 profile=10k
add comment=vc-929-04.27.26- name=4473642 password=4473642 profile=10k
add comment=vc-929-04.27.26- name=3966936 password=3966936 profile=10k
add comment=vc-929-04.27.26- name=2784865 password=2784865 profile=10k
add comment=vc-929-04.27.26- name=9862796 password=9862796 profile=10k
add comment=vc-929-04.27.26- name=7456889 password=7456889 profile=10k
add comment=vc-929-04.27.26- name=3354378 password=3354378 profile=10k
add comment=vc-929-04.27.26- name=7746249 password=7746249 profile=10k
add comment=vc-929-04.27.26- name=6229836 password=6229836 profile=10k
add comment=vc-929-04.27.26- name=9745653 password=9745653 profile=10k
add comment=vc-929-04.27.26- name=4832463 password=4832463 profile=10k
add comment=vc-929-04.27.26- name=8928793 password=8928793 profile=10k
add comment=vc-929-04.27.26- name=2926746 password=2926746 profile=10k
add comment=vc-929-04.27.26- name=6854882 password=6854882 profile=10k
add comment=vc-929-04.27.26- name=6494472 password=6494472 profile=10k
add comment=vc-929-04.27.26- name=2969824 password=2969824 profile=10k
add comment=vc-929-04.27.26- name=4322623 password=4322623 profile=10k
add comment=vc-95870-3k limit-uptime=1d name=95870 password=95870 profile=3k
add comment=vc-74560-3k limit-uptime=1d name=74560 password=74560 profile=3k
add comment=vc-46473-3k limit-uptime=1d name=46473 password=46473 profile=3k
add comment=vc-11293-3k limit-uptime=1d name=11293 password=11293 profile=3k
add comment=vc-90550-3k limit-uptime=1d name=90550 password=90550 profile=3k
add comment=vc-59629-3k limit-uptime=1d name=59629 password=59629 profile=3k
add comment=vc-24525-3k limit-uptime=1d name=24525 password=24525 profile=3k
add comment=vc-77855-3k limit-uptime=1d name=77855 password=77855 profile=3k
add comment=vc-54822-3k limit-uptime=1d name=54822 password=54822 profile=3k
add comment=vc-98012-3k limit-uptime=1d name=98012 password=98012 profile=3k
add comment=vc-253191-5k limit-uptime=2d name=253191 password=253191 profile=\
    5k
add comment=vc-781016-5k limit-uptime=2d name=781016 password=781016 profile=\
    5k
add comment=vc-347886-5k limit-uptime=2d name=347886 password=347886 profile=\
    5k
add comment=vc-128241-5k limit-uptime=2d name=128241 password=128241 profile=\
    5k
add comment=vc-777502-5k limit-uptime=2d name=777502 password=777502 profile=\
    5k
add comment=vc-797835-5k limit-uptime=2d name=797835 password=797835 profile=\
    5k
add comment=vc-270848-5k limit-uptime=2d name=270848 password=270848 profile=\
    5k
add comment=vc-785066-5k limit-uptime=2d name=785066 password=785066 profile=\
    5k
add comment=vc-955034-5k limit-uptime=2d name=955034 password=955034 profile=\
    5k
add comment=vc-166911-5k limit-uptime=2d name=166911 password=166911 profile=\
    5k
add comment="vc rasna 29/04/2026" name=rasna password=rasna profile=client
add comment=vc-public-voucher-VCR20260505132546FC2A name=004313 password=\
    004313 profile=3k
add comment=vc-961-05.08.26- name=7955989 password=7955989 profile=5k
add comment=vc-623-05.08.26- name=3938725 password=3938725 profile=5k
add comment=vc-623-05.08.26- name=3367537 password=3367537 profile=5k
add comment=vc-623-05.08.26- name=7565657 password=7565657 profile=5k
add comment=vc-623-05.08.26- name=2362224 password=2362224 profile=5k
add comment=vc-623-05.08.26- name=5942469 password=5942469 profile=5k
add comment=vc-623-05.08.26- name=2488697 password=2488697 profile=5k
add comment=vc-623-05.08.26- name=6276286 password=6276286 profile=5k
add comment=vc-623-05.08.26- name=6487532 password=6487532 profile=5k
add comment=vc-623-05.08.26- name=2399983 password=2399983 profile=5k
add comment=vc-623-05.08.26- name=6455235 password=6455235 profile=5k
add comment=vc-623-05.08.26- name=8458247 password=8458247 profile=5k
add comment=vc-623-05.08.26- name=5588278 password=5588278 profile=5k
add comment=vc-623-05.08.26- name=3823832 password=3823832 profile=5k
add comment=vc-623-05.08.26- name=5585828 password=5585828 profile=5k
add comment=vc-623-05.08.26- name=5779389 password=5779389 profile=5k
add comment=vc-623-05.08.26- name=2532962 password=2532962 profile=5k
add comment=vc-623-05.08.26- name=6785326 password=6785326 profile=5k
add comment=vc-623-05.08.26- name=6449984 password=6449984 profile=5k
add comment=vc-6921-3k limit-uptime=1d name=6921 password=6921 profile=3k
add comment=vc-728-05.10.26- name=24857 password=24857 profile=3k
add comment=vc-728-05.10.26- name=82888 password=82888 profile=3k
add comment=vc-728-05.10.26- name=45674 password=45674 profile=3k
add comment=vc-728-05.10.26- name=78469 password=78469 profile=3k
add comment=vc-728-05.10.26- name=66776 password=66776 profile=3k
add comment=vc-728-05.10.26- name=47377 password=47377 profile=3k
add comment=vc-728-05.10.26- name=29334 password=29334 profile=3k
add comment=vc-728-05.10.26- name=28735 password=28735 profile=3k
add comment=vc-785-05.10.26- name=563576 password=563576 profile=3k
add comment=vc-785-05.10.26- name=937566 password=937566 profile=3k
add comment=vc-785-05.10.26- name=725936 password=725936 profile=3k
add comment=vc-785-05.10.26- name=994759 password=994759 profile=3k
add comment=vc-785-05.10.26- name=342937 password=342937 profile=3k
add comment=vc-785-05.10.26- name=368738 password=368738 profile=3k
add comment=vc-785-05.10.26- name=653792 password=653792 profile=3k
add comment=vc-785-05.10.26- name=997332 password=997332 profile=3k
add comment=vc-785-05.10.26- name=577384 password=577384 profile=3k
add comment=vc-785-05.10.26- name=546467 password=546467 profile=3k
add comment=vc-785-05.10.26- name=298354 password=298354 profile=3k
add comment=vc-785-05.10.26- name=294588 password=294588 profile=3k
add comment=vc-785-05.10.26- name=226744 password=226744 profile=3k
add comment=vc-785-05.10.26- name=873475 password=873475 profile=3k
add comment=vc-785-05.10.26- name=863496 password=863496 profile=3k
add comment=vc-785-05.10.26- name=387739 password=387739 profile=3k
add comment=vc-785-05.10.26- name=444553 password=444553 profile=3k
add comment=vc-785-05.10.26- name=336258 password=336258 profile=3k
add comment=vc-785-05.10.26- name=478635 password=478635 profile=3k
add comment=vc-785-05.10.26- name=688376 password=688376 profile=3k
add comment=vc-785-05.10.26- name=422548 password=422548 profile=3k
add comment=vc-785-05.10.26- name=352567 password=352567 profile=3k
add comment=pub-6-SK293H-3k limit-uptime=1d name=SK293H password=SK293H \
    profile=3k
add comment=ag-icha-460158-3k limit-uptime=1d name=460158 password=460158 \
    profile=3k
add comment=pub-1-GQG4PJ-50k limit-uptime=4w2d name=GQG4PJ password=GQG4PJ \
    profile=50k
add comment=pub-2-4ME9EH-3k limit-uptime=1d name=4ME9EH password=4ME9EH \
    profile=3k
add disabled=yes name=hotspottest password=hotspottest profile=2hp
add comment=pubv-23-660489-3k-plentong limit-uptime=1d name=660489 password=\
    660489 profile=3k-plentong
add comment=vc-online-30-678308-3k limit-uptime=1d name=678308 password=\
    678308 profile=3k
add comment=vc-online-31-211159-erik-3k limit-uptime=1d name=211159 password=\
    211159 profile=erik-3k
add comment=vc-online-32-920954-3k limit-uptime=1d name=920954 password=\
    920954 profile=3k
add comment=vc-online-33-537073-3k limit-uptime=1d name=537073 password=\
    537073 profile=3k
add comment=vc-online-35-582617-3k limit-uptime=1d name=582617 password=\
    582617 profile=3k
add comment=vc-online-36-785075-3k limit-uptime=1d name=785075 password=\
    785075 profile=3k
add comment=vc-online-40-276177-3k limit-uptime=1d name=276177 password=\
    276177 profile=3k
add comment=vc-online-42-986119-50k limit-uptime=4w2d name=986119 password=\
    986119 profile=50k
add comment=vc-online-44-694379-3k limit-uptime=1d name=694379 password=\
    694379 profile=3k
add comment=vc-online-46-418774-50k limit-uptime=4w2d name=418774 password=\
    418774 profile=50k
add comment=vc-online-5-323928-3k limit-uptime=1d name=323928 password=323928 \
    profile=3k
add comment=vc-430-05.27.26- name=872834 password=872834 profile=5k
add comment=vc-430-05.27.26- name=883868 password=883868 profile=5k
add comment=vc-online-3-633810-3k limit-uptime=1d name=633810 password=633810 \
    profile=3k
add comment=vc-601-06.01.26- name=72775 password=72775 profile=3k
add comment=vc-601-06.01.26- name=49335 password=49335 profile=3k
add comment=vc-601-06.01.26- name=48788 password=48788 profile=3k
add comment=vc-851-06.01.26- name=649958 password=649958 profile=dona-3k
add comment=vc-851-06.01.26- name=675754 password=675754 profile=dona-3k
add comment=vc-851-06.01.26- name=375622 password=375622 profile=dona-3k
add comment=vc-851-06.01.26- name=963572 password=963572 profile=dona-3k
add comment="sep/15/2026 06:06:07" name=294489 password=294489 profile=\
    dona-3k
add comment=vc-681-06.01.26- name=254263 password=254263 profile=dafa-3k
add comment=vc-430-06.05.26- name=4859 password=4859 profile=3k
add comment=vc-9074-3k limit-uptime=1d name=9074 password=9074 profile=3k
add comment=vc-221-06.08.26- name=5727894 password=5727894 profile=5k
add comment=vc-online-6-083004-3k limit-uptime=1d name=083004 password=083004 \
    profile=3k
add comment=ag-ali-521648-3k limit-uptime=1d name=521648 password=521648 \
    profile=3k
add comment=vc-online-8-188352-10k limit-uptime=5d name=188352 password=\
    188352 profile=10k
add comment=vc-973-06.18.26- name=6847873 password=6847873 profile=5k
add comment=vc-973-06.18.26- name=2977653 password=2977653 profile=5k
add comment=vc-977-06.18.26- name=88498 password=88498 profile=dhea-3k
add comment=vc-977-06.18.26- name=88748 password=88748 profile=dhea-3k
add comment=vc-977-06.18.26- name=78789 password=78789 profile=dhea-3k
add comment=vc-977-06.18.26- name=75959 password=75959 profile=dhea-3k
add comment=vc-977-06.18.26- name=94242 password=94242 profile=dhea-3k
add comment=vc-977-06.18.26- name=83374 password=83374 profile=dhea-3k
add comment=vc-977-06.18.26- name=37342 password=37342 profile=dhea-3k
add comment=vc-977-06.18.26- name=43953 password=43953 profile=dhea-3k
add comment=vc-977-06.18.26- name=56292 password=56292 profile=dhea-3k
add comment=vc-977-06.18.26- name=86928 password=86928 profile=dhea-3k
add comment=vc-977-06.18.26- name=99764 password=99764 profile=dhea-3k
add comment=vc-977-06.18.26- name=33886 password=33886 profile=dhea-3k
add comment=vc-977-06.18.26- name=77399 password=77399 profile=dhea-3k
add comment=vc-977-06.18.26- name=48679 password=48679 profile=dhea-3k
add comment=vc-977-06.18.26- name=54226 password=54226 profile=dhea-3k
add comment=vc-977-06.18.26- name=29867 password=29867 profile=dhea-3k
add comment=vc-977-06.18.26- name=82875 password=82875 profile=dhea-3k
add comment=vc-977-06.18.26- name=52424 password=52424 profile=dhea-3k
add comment=vc-977-06.18.26- name=49574 password=49574 profile=dhea-3k
add comment=vc-977-06.18.26- name=63367 password=63367 profile=dhea-3k
add comment=vc-977-06.18.26- name=34253 password=34253 profile=dhea-3k
add comment=vc-977-06.18.26- name=33864 password=33864 profile=dhea-3k
add comment=vc-977-06.18.26- name=86873 password=86873 profile=dhea-3k
add comment=vc-977-06.18.26- name=55789 password=55789 profile=dhea-3k
add comment=vc-977-06.18.26- name=76827 password=76827 profile=dhea-3k
add comment=vc-977-06.18.26- name=46488 password=46488 profile=dhea-3k
add comment=vc-977-06.18.26- name=55665 password=55665 profile=dhea-3k
add comment=vc-977-06.18.26- name=62393 password=62393 profile=dhea-3k
add comment=vc-977-06.18.26- name=69783 password=69783 profile=dhea-3k
add comment=vc-977-06.18.26- name=87275 password=87275 profile=dhea-3k
add comment=vc-977-06.18.26- name=57968 password=57968 profile=dhea-3k
add comment=vc-977-06.18.26- name=92928 password=92928 profile=dhea-3k
add comment=vc-977-06.18.26- name=37544 password=37544 profile=dhea-3k
add comment=vc-977-06.18.26- name=26675 password=26675 profile=dhea-3k
add comment=vc-879-06.18.26- name=egx367 password=egx367 profile=3k
add comment=vc-879-06.18.26- name=njv259 password=njv259 profile=3k
add comment=vc-879-06.18.26- name=mju866 password=mju866 profile=3k
add comment=vc-879-06.18.26- name=gbj437 password=gbj437 profile=3k
add comment=vc-879-06.18.26- name=cnd223 password=cnd223 profile=3k
add comment=vc-879-06.18.26- name=mah888 password=mah888 profile=3k
add comment=vc-879-06.18.26- name=gsm593 password=gsm593 profile=3k
add comment=vc-879-06.18.26- name=dat696 password=dat696 profile=3k
add comment=vc-879-06.18.26- name=rgs526 password=rgs526 profile=3k
add comment=vc-879-06.18.26- name=pje948 password=pje948 profile=3k
add comment=vc-879-06.18.26- name=gkc648 password=gkc648 profile=3k
add comment=vc-879-06.18.26- name=txy247 password=txy247 profile=3k
add comment=vc-879-06.18.26- name=ytt589 password=ytt589 profile=3k
add comment=vc-879-06.18.26- name=avp593 password=avp593 profile=3k
add comment=vc-879-06.18.26- name=scw527 password=scw527 profile=3k
add comment=vc-879-06.18.26- name=hxh265 password=hxh265 profile=3k
add comment=vc-879-06.18.26- name=gck458 password=gck458 profile=3k
add comment=vc-879-06.18.26- name=bmu733 password=bmu733 profile=3k
add comment=vc-879-06.18.26- name=vvy559 password=vvy559 profile=3k
add comment=vc-879-06.18.26- name=dhd228 password=dhd228 profile=3k
add comment=vc-879-06.18.26- name=yte533 password=yte533 profile=3k
add comment=vc-879-06.18.26- name=zsa823 password=zsa823 profile=3k
add comment=vc-879-06.18.26- name=vxs669 password=vxs669 profile=3k
add comment=vc-879-06.18.26- name=mir284 password=mir284 profile=3k
add comment=vc-879-06.18.26- name=cve854 password=cve854 profile=3k
add comment=vc-879-06.18.26- name=asp393 password=asp393 profile=3k
add comment=vc-879-06.18.26- name=anf479 password=anf479 profile=3k
add comment=vc-879-06.18.26- name=nhb532 password=nhb532 profile=3k
add comment=vc-879-06.18.26- name=dps947 password=dps947 profile=3k
add comment=vc-879-06.18.26- name=kst237 password=kst237 profile=3k
add comment=vc-879-06.18.26- name=ray832 password=ray832 profile=3k
add comment=vc-879-06.18.26- name=rks444 password=rks444 profile=3k
add comment=vc-879-06.18.26- name=ehy934 password=ehy934 profile=3k
add comment=vc-879-06.18.26- name=kyr788 password=kyr788 profile=3k
add comment=vc-879-06.18.26- name=zpa537 password=zpa537 profile=3k
add comment=vc-879-06.18.26- name=yyt275 password=yyt275 profile=3k
add comment=vc-879-06.18.26- name=pgd235 password=pgd235 profile=3k
add comment=vc-879-06.18.26- name=iup338 password=iup338 profile=3k
add comment=vc-879-06.18.26- name=ems392 password=ems392 profile=3k
add comment=vc-879-06.18.26- name=tck955 password=tck955 profile=3k
add comment=vc-879-06.18.26- name=mtp676 password=mtp676 profile=3k
add comment=vc-879-06.18.26- name=ihx962 password=ihx962 profile=3k
add comment=vc-879-06.18.26- name=rzf694 password=rzf694 profile=3k
add comment=vc-879-06.18.26- name=fdc288 password=fdc288 profile=3k
add comment=vc-879-06.18.26- name=fwn887 password=fwn887 profile=3k
add comment=vc-879-06.18.26- name=uyt236 password=uyt236 profile=3k
add comment=vc-879-06.18.26- name=mhx629 password=mhx629 profile=3k
add comment=vc-879-06.18.26- name=viy997 password=viy997 profile=3k
add comment=vc-879-06.18.26- name=ayf882 password=ayf882 profile=3k
add comment=vc-879-06.18.26- name=uvi238 password=uvi238 profile=3k
add comment=vc-879-06.18.26- name=aty788 password=aty788 profile=3k
add comment=vc-879-06.18.26- name=nze644 password=nze644 profile=3k
add comment=vc-879-06.18.26- name=cfy223 password=cfy223 profile=3k
add comment=vc-879-06.18.26- name=reb929 password=reb929 profile=3k
add comment=vc-879-06.18.26- name=kmp346 password=kmp346 profile=3k
add comment=vc-879-06.18.26- name=vec329 password=vec329 profile=3k
add comment=vc-879-06.18.26- name=uaw772 password=uaw772 profile=3k
add comment=vc-879-06.18.26- name=pha993 password=pha993 profile=3k
add comment=vc-879-06.18.26- name=cvc293 password=cvc293 profile=3k
add comment=vc-879-06.18.26- name=wiz349 password=wiz349 profile=3k
add comment=vc-879-06.18.26- name=ekg922 password=ekg922 profile=3k
add comment=vc-879-06.18.26- name=ynp628 password=ynp628 profile=3k
add comment=vc-879-06.18.26- name=ezu882 password=ezu882 profile=3k
add comment=vc-879-06.18.26- name=wsa854 password=wsa854 profile=3k
add comment=vc-879-06.18.26- name=txk344 password=txk344 profile=3k
add comment=vc-879-06.18.26- name=xzy863 password=xzy863 profile=3k
add comment=vc-879-06.18.26- name=yfu545 password=yfu545 profile=3k
add comment=vc-879-06.18.26- name=bhm486 password=bhm486 profile=3k
add comment=vc-879-06.18.26- name=nnp583 password=nnp583 profile=3k
add comment=vc-879-06.18.26- name=tzi994 password=tzi994 profile=3k
add comment=vc-879-06.18.26- name=rwi565 password=rwi565 profile=3k
add comment=vc-879-06.18.26- name=vss858 password=vss858 profile=3k
add comment=vc-879-06.18.26- name=xsz379 password=xsz379 profile=3k
add comment=vc-879-06.18.26- name=sub537 password=sub537 profile=3k
add comment=vc-879-06.18.26- name=maw295 password=maw295 profile=3k
add comment=vc-879-06.18.26- name=gyu774 password=gyu774 profile=3k
add comment=vc-879-06.18.26- name=bkx648 password=bkx648 profile=3k
add comment=vc-879-06.18.26- name=ani485 password=ani485 profile=3k
add comment=vc-879-06.18.26- name=uak467 password=uak467 profile=3k
add comment=vc-879-06.18.26- name=uha385 password=uha385 profile=3k
add comment=vc-879-06.18.26- name=gfm889 password=gfm889 profile=3k
add comment=vc-879-06.18.26- name=ypj989 password=ypj989 profile=3k
add comment=vc-879-06.18.26- name=udk674 password=udk674 profile=3k
add comment=vc-879-06.18.26- name=kct523 password=kct523 profile=3k
add comment=vc-879-06.18.26- name=vfd457 password=vfd457 profile=3k
add comment=vc-879-06.18.26- name=tdn563 password=tdn563 profile=3k
add comment=vc-879-06.18.26- name=rpa377 password=rpa377 profile=3k
add comment=vc-879-06.18.26- name=snc872 password=snc872 profile=3k
add comment=vc-879-06.18.26- name=xsa264 password=xsa264 profile=3k
add comment=vc-879-06.18.26- name=rmz357 password=rmz357 profile=3k
add comment=vc-879-06.18.26- name=tpm472 password=tpm472 profile=3k
add comment=vc-879-06.18.26- name=pxj693 password=pxj693 profile=3k
add comment=vc-879-06.18.26- name=uwi649 password=uwi649 profile=3k
add comment=vc-879-06.18.26- name=yxz555 password=yxz555 profile=3k
add comment=vc-879-06.18.26- name=fkb326 password=fkb326 profile=3k
add comment=vc-879-06.18.26- name=nix928 password=nix928 profile=3k
add comment=vc-879-06.18.26- name=tzk929 password=tzk929 profile=3k
add comment=vc-879-06.18.26- name=wnu599 password=wnu599 profile=3k
add comment=vc-879-06.18.26- name=jjz296 password=jjz296 profile=3k
add comment=vc-879-06.18.26- name=tfv243 password=tfv243 profile=3k
add comment=vc-879-06.18.26- name=zgn596 password=zgn596 profile=3k
add comment=vc-879-06.18.26- name=ptr435 password=ptr435 profile=3k
add comment=vc-879-06.18.26- name=nsn474 password=nsn474 profile=3k
add comment=vc-879-06.18.26- name=juj397 password=juj397 profile=3k
add comment=vc-879-06.18.26- name=ucx439 password=ucx439 profile=3k
add comment=vc-879-06.18.26- name=msu559 password=msu559 profile=3k
add comment=vc-879-06.18.26- name=wnz959 password=wnz959 profile=3k
add comment=vc-879-06.18.26- name=vey835 password=vey835 profile=3k
add comment=vc-879-06.18.26- name=ipt935 password=ipt935 profile=3k
add comment=vc-879-06.18.26- name=urm998 password=urm998 profile=3k
add comment=vc-879-06.18.26- name=nfn559 password=nfn559 profile=3k
add comment=vc-879-06.18.26- name=eur937 password=eur937 profile=3k
add comment=vc-879-06.18.26- name=abg534 password=abg534 profile=3k
add comment=vc-879-06.18.26- name=rxz495 password=rxz495 profile=3k
add comment=vc-879-06.18.26- name=zbj923 password=zbj923 profile=3k
add comment=vc-879-06.18.26- name=wuu957 password=wuu957 profile=3k
add comment=vc-879-06.18.26- name=auw947 password=auw947 profile=3k
add comment=vc-879-06.18.26- name=irn679 password=irn679 profile=3k
add comment=vc-879-06.18.26- name=hez754 password=hez754 profile=3k
add comment=vc-879-06.18.26- name=aip297 password=aip297 profile=3k
add comment=vc-575-06.18.26- name=58299 password=58299 profile=3k
add comment=vc-575-06.18.26- name=28769 password=28769 profile=3k
add comment=vc-575-06.18.26- name=44565 password=44565 profile=3k
add comment=vc-575-06.18.26- name=49367 password=49367 profile=3k
add comment=vc-575-06.18.26- name=68775 password=68775 profile=3k
add comment=vc-575-06.18.26- name=33856 password=33856 profile=3k
add comment=vc-575-06.18.26- name=96492 password=96492 profile=3k
add comment=vc-575-06.18.26- name=42562 password=42562 profile=3k
add comment=vc-575-06.18.26- name=57275 password=57275 profile=3k
add comment=vc-575-06.18.26- name=89798 password=89798 profile=3k
add comment=vc-575-06.18.26- name=32543 password=32543 profile=3k
add comment=vc-575-06.18.26- name=95852 password=95852 profile=3k
add comment=vc-575-06.18.26- name=93599 password=93599 profile=3k
add comment=vc-575-06.18.26- name=54498 password=54498 profile=3k
add comment=vc-575-06.18.26- name=94442 password=94442 profile=3k
add comment=vc-575-06.18.26- name=27764 password=27764 profile=3k
add comment=vc-575-06.18.26- name=95874 password=95874 profile=3k
add comment=vc-575-06.18.26- name=92274 password=92274 profile=3k
add comment=vc-575-06.18.26- name=32892 password=32892 profile=3k
add comment=vc-575-06.18.26- name=79394 password=79394 profile=3k
add comment=vc-575-06.18.26- name=98523 password=98523 profile=3k
add comment=vc-online-16-796387-3k limit-uptime=1d name=796387 password=\
    796387 profile=3k
add name=wadi password=wadi profile=erik-5k
add comment=vc-455-06.28.26- name=4655938 password=4655938 profile=5k
add comment=vc-455-06.28.26- name=2459872 password=2459872 profile=5k
add comment=vc-455-06.28.26- name=9293254 password=9293254 profile=5k
add comment=vc-722-06.28.26- name=878626 password=878626 profile=3k
add comment=vc-722-06.28.26- name=357653 password=357653 profile=3k
add comment=vc-722-06.28.26- name=637688 password=637688 profile=3k
add comment=vc-273-07.05.26- name=6969889 password=6969889 profile=5k
add comment=vc-273-07.05.26- name=6823643 password=6823643 profile=5k
add comment=vc-273-07.05.26- name=9828575 password=9828575 profile=5k
add comment=vc-273-07.05.26- name=3923635 password=3923635 profile=5k
add comment=vc-273-07.05.26- name=6674529 password=6674529 profile=5k
add comment=vc-273-07.05.26- name=4535329 password=4535329 profile=5k
add comment=vc-273-07.05.26- name=2997632 password=2997632 profile=5k
add comment=vc-273-07.05.26- name=6847687 password=6847687 profile=5k
add comment=vc-273-07.05.26- name=4497386 password=4497386 profile=5k
add comment=vc-273-07.05.26- name=5753754 password=5753754 profile=5k
add comment=vc-273-07.05.26- name=4835633 password=4835633 profile=5k
add comment=vc-273-07.05.26- name=6985766 password=6985766 profile=5k
add comment=vc-273-07.05.26- name=5494498 password=5494498 profile=5k
add comment=vc-273-07.05.26- name=6239778 password=6239778 profile=5k
add comment=vc-273-07.05.26- name=2269793 password=2269793 profile=5k
add comment=vc-273-07.05.26- name=4738466 password=4738466 profile=5k
add comment=vc-273-07.05.26- name=9222552 password=9222552 profile=5k
add comment=vc-273-07.05.26- name=9464886 password=9464886 profile=5k
add comment=vc-915-07.05.26- name=6379453 password=6379453 profile=5k
add comment=vc-915-07.05.26- name=2289773 password=2289773 profile=5k
add comment=vc-915-07.05.26- name=7867479 password=7867479 profile=5k
add comment=vc-915-07.05.26- name=2889278 password=2889278 profile=5k
add comment=vc-915-07.05.26- name=3377558 password=3377558 profile=5k
add comment="sep/15/2026 15:52:09" name=3355923 password=3355923 profile=5k
add comment=vc-915-07.05.26- name=7867399 password=7867399 profile=5k
add comment=vc-915-07.05.26- name=9627725 password=9627725 profile=5k
add comment=vc-967-07.05.26- name=69897 password=69897 profile=dafa-3k
add comment=vc-967-07.05.26- name=66566 password=66566 profile=dafa-3k
add comment=vc-967-07.05.26- name=33446 password=33446 profile=dafa-3k
add comment=vc-967-07.05.26- name=64755 password=64755 profile=dafa-3k
add comment=vc-967-07.05.26- name=75575 password=75575 profile=dafa-3k
add comment=vc-967-07.05.26- name=26539 password=26539 profile=dafa-3k
add comment=vc-967-07.05.26- name=68862 password=68862 profile=dafa-3k
add comment=vc-967-07.05.26- name=27364 password=27364 profile=dafa-3k
add comment=vc-967-07.05.26- name=42726 password=42726 profile=dafa-3k
add comment=vc-967-07.05.26- name=24756 password=24756 profile=dafa-3k
add comment=vc-967-07.05.26- name=55886 password=55886 profile=dafa-3k
add comment=vc-967-07.05.26- name=24978 password=24978 profile=dafa-3k
add comment=vc-967-07.05.26- name=56995 password=56995 profile=dafa-3k
add comment=vc-967-07.05.26- name=76258 password=76258 profile=dafa-3k
add comment=vc-967-07.05.26- name=27777 password=27777 profile=dafa-3k
add comment=vc-967-07.05.26- name=37257 password=37257 profile=dafa-3k
add comment=vc-967-07.05.26- name=83682 password=83682 profile=dafa-3k
add comment=vc-967-07.05.26- name=66652 password=66652 profile=dafa-3k
add comment=vc-967-07.05.26- name=92954 password=92954 profile=dafa-3k
add comment=vc-967-07.05.26- name=89596 password=89596 profile=dafa-3k
add comment=vc-967-07.05.26- name=23682 password=23682 profile=dafa-3k
add comment=vc-967-07.05.26- name=47476 password=47476 profile=dafa-3k
add comment=vc-967-07.05.26- name=93264 password=93264 profile=dafa-3k
add comment=vc-967-07.05.26- name=64797 password=64797 profile=dafa-3k
add comment=vc-967-07.05.26- name=52275 password=52275 profile=dafa-3k
add comment=vc-967-07.05.26- name=49496 password=49496 profile=dafa-3k
add comment=vc-967-07.05.26- name=83538 password=83538 profile=dafa-3k
add comment=vc-967-07.05.26- name=37884 password=37884 profile=dafa-3k
add comment=vc-967-07.05.26- name=67264 password=67264 profile=dafa-3k
add comment=vc-967-07.05.26- name=68969 password=68969 profile=dafa-3k
add comment=vc-967-07.05.26- name=62874 password=62874 profile=dafa-3k
add comment=vc-967-07.05.26- name=77423 password=77423 profile=dafa-3k
add comment=vc-967-07.05.26- name=43224 password=43224 profile=dafa-3k
add comment=vc-967-07.05.26- name=79529 password=79529 profile=dafa-3k
add comment=vc-967-07.05.26- name=84272 password=84272 profile=dafa-3k
add comment=vc-967-07.05.26- name=69753 password=69753 profile=dafa-3k
add comment=vc-967-07.05.26- name=58224 password=58224 profile=dafa-3k
add comment=vc-967-07.05.26- name=26835 password=26835 profile=dafa-3k
add comment=vc-967-07.05.26- name=47643 password=47643 profile=dafa-3k
add comment=vc-967-07.05.26- name=49775 password=49775 profile=dafa-3k
add comment=vc-967-07.05.26- name=65623 password=65623 profile=dafa-3k
add comment=vc-967-07.05.26- name=43333 password=43333 profile=dafa-3k
add comment=vc-967-07.05.26- name=37295 password=37295 profile=dafa-3k
add comment=vc-967-07.05.26- name=23333 password=23333 profile=dafa-3k
add comment=vc-967-07.05.26- name=39874 password=39874 profile=dafa-3k
add comment=vc-967-07.05.26- name=42597 password=42597 profile=dafa-3k
add comment="sep/15/2026 19:59:47" name=55742 password=55742 profile=dafa-3k
add comment=vc-967-07.05.26- name=72574 password=72574 profile=dafa-3k
add comment=vc-967-07.05.26- name=97946 password=97946 profile=dafa-3k
add comment=vc-967-07.05.26- name=92289 password=92289 profile=dafa-3k
add comment=vc-967-07.05.26- name=69986 password=69986 profile=dafa-3k
add comment=vc-967-07.05.26- name=52663 password=52663 profile=dafa-3k
add comment=vc-967-07.05.26- name=79845 password=79845 profile=dafa-3k
add comment=vc-967-07.05.26- name=83793 password=83793 profile=dafa-3k
add comment=vc-967-07.05.26- name=78438 password=78438 profile=dafa-3k
add comment=vc-967-07.05.26- name=65334 password=65334 profile=dafa-3k
add comment=vc-967-07.05.26- name=26393 password=26393 profile=dafa-3k
add comment=vc-293-07.05.26- name=455533 password=455533 profile=3k
add comment=vc-293-07.05.26- name=345657 password=345657 profile=3k
add comment=vc-293-07.05.26- name=386546 password=386546 profile=3k
add comment=vc-293-07.05.26- name=289594 password=289594 profile=3k
add comment=vc-293-07.05.26- name=979937 password=979937 profile=3k
add comment="vc anggun1 12/07/2026" name=anggun1 password=anggun1 profile=\
    client
add comment="vc anggun2 12/07/2026" name=anggun2 password=anggun2 profile=\
    client
add comment=ag-ali-533100-3k limit-uptime=1d name=533100 password=533100 \
    profile=3k
add comment=ag-ali-635428-5k limit-uptime=2d name=635428 password=635428 \
    profile=5k
add comment=vc-143-07.19.26- name=6887498 password=6887498 profile=5k
add comment=vc-821-07.19.26- name=46575 password=46575 profile=3k-plentong
add comment=vc-821-07.19.26- name=45424 password=45424 profile=3k-plentong
add comment=vc-821-07.19.26- name=77943 password=77943 profile=3k-plentong
add comment=vc-821-07.19.26- name=87942 password=87942 profile=3k-plentong
add comment=vc-821-07.19.26- name=23764 password=23764 profile=3k-plentong
add comment=vc-821-07.19.26- name=57589 password=57589 profile=3k-plentong
add comment=vc-821-07.19.26- name=55572 password=55572 profile=3k-plentong
add comment=vc-821-07.19.26- name=34237 password=34237 profile=3k-plentong
add comment=vc-821-07.19.26- name=59656 password=59656 profile=3k-plentong
add comment=vc-821-07.19.26- name=84382 password=84382 profile=3k-plentong
add comment=vc-821-07.19.26- name=89893 password=89893 profile=3k-plentong
add comment=vc-821-07.19.26- name=33725 password=33725 profile=3k-plentong
add comment=vc-821-07.19.26- name=89636 password=89636 profile=3k-plentong
add comment=vc-821-07.19.26- name=79428 password=79428 profile=3k-plentong
add comment=vc-821-07.19.26- name=38245 password=38245 profile=3k-plentong
add comment=vc-821-07.19.26- name=92339 password=92339 profile=3k-plentong
add comment=vc-821-07.19.26- name=92559 password=92559 profile=3k-plentong
add comment=vc-821-07.19.26- name=65987 password=65987 profile=3k-plentong
add comment=vc-821-07.19.26- name=95233 password=95233 profile=3k-plentong
add comment=vc-821-07.19.26- name=94733 password=94733 profile=3k-plentong
add comment=vc-821-07.19.26- name=72767 password=72767 profile=3k-plentong
add comment=vc-821-07.19.26- name=79655 password=79655 profile=3k-plentong
add comment=vc-821-07.19.26- name=88735 password=88735 profile=3k-plentong
add comment=vc-821-07.19.26- name=37653 password=37653 profile=3k-plentong
add comment=vc-821-07.19.26- name=94767 password=94767 profile=3k-plentong
add comment=vc-821-07.19.26- name=32689 password=32689 profile=3k-plentong
add comment=vc-821-07.19.26- name=56777 password=56777 profile=3k-plentong
add comment=vc-821-07.19.26- name=27242 password=27242 profile=3k-plentong
add comment=vc-821-07.19.26- name=58975 password=58975 profile=3k-plentong
add comment=vc-821-07.19.26- name=76687 password=76687 profile=3k-plentong
add comment=vc-821-07.19.26- name=96523 password=96523 profile=3k-plentong
add comment=vc-821-07.19.26- name=69245 password=69245 profile=3k-plentong
add comment=vc-821-07.19.26- name=46472 password=46472 profile=3k-plentong
add comment=vc-821-07.19.26- name=22287 password=22287 profile=3k-plentong
add comment=vc-821-07.19.26- name=65646 password=65646 profile=3k-plentong
add comment=vc-821-07.19.26- name=99683 password=99683 profile=3k-plentong
add comment=vc-821-07.19.26- name=68377 password=68377 profile=3k-plentong
add comment=vc-821-07.19.26- name=94676 password=94676 profile=3k-plentong
add comment=vc-821-07.19.26- name=93636 password=93636 profile=3k-plentong
add comment=vc-821-07.19.26- name=63349 password=63349 profile=3k-plentong
add comment=vc-821-07.19.26- name=78993 password=78993 profile=3k-plentong
add comment=vc-821-07.19.26- name=82424 password=82424 profile=3k-plentong
add comment=vc-821-07.19.26- name=52223 password=52223 profile=3k-plentong
add comment=vc-821-07.19.26- name=75454 password=75454 profile=3k-plentong
add comment=vc-821-07.19.26- name=87842 password=87842 profile=3k-plentong
add comment="sep/15/2026 11:55:37" name=28793 password=28793 profile=\
    3k-plentong
add comment=vc-821-07.19.26- name=94228 password=94228 profile=3k-plentong
add comment=vc-821-07.19.26- name=82469 password=82469 profile=3k-plentong
add comment=vc-877-07.19.26- name=745333 password=745333 profile=dhea-3k
add comment=vc-877-07.19.26- name=396482 password=396482 profile=dhea-3k
add comment=vc-877-07.19.26- name=544326 password=544326 profile=dhea-3k
add comment=vc-877-07.19.26- name=334357 password=334357 profile=dhea-3k
add comment=vc-877-07.19.26- name=867745 password=867745 profile=dhea-3k
add comment=vc-877-07.19.26- name=852629 password=852629 profile=dhea-3k
add comment=vc-877-07.19.26- name=966356 password=966356 profile=dhea-3k
add comment=vc-877-07.19.26- name=459524 password=459524 profile=dhea-3k
add comment=vc-877-07.19.26- name=246949 password=246949 profile=dhea-3k
add comment=vc-877-07.19.26- name=798838 password=798838 profile=dhea-3k
add comment=vc-877-07.19.26- name=557628 password=557628 profile=dhea-3k
add comment=vc-877-07.19.26- name=772249 password=772249 profile=dhea-3k
add comment=vc-877-07.19.26- name=839556 password=839556 profile=dhea-3k
add comment=vc-877-07.19.26- name=544858 password=544858 profile=dhea-3k
add comment=vc-877-07.19.26- name=749984 password=749984 profile=dhea-3k
add comment=vc-877-07.19.26- name=628689 password=628689 profile=dhea-3k
add comment=vc-877-07.19.26- name=488975 password=488975 profile=dhea-3k
add comment=vc-877-07.19.26- name=359652 password=359652 profile=dhea-3k
add comment=vc-877-07.19.26- name=636564 password=636564 profile=dhea-3k
add comment=vc-877-07.19.26- name=224853 password=224853 profile=dhea-3k
add comment=vc-877-07.19.26- name=449358 password=449358 profile=dhea-3k
add comment=vc-877-07.19.26- name=683593 password=683593 profile=dhea-3k
add comment=vc-877-07.19.26- name=942772 password=942772 profile=dhea-3k
add comment=vc-877-07.19.26- name=296342 password=296342 profile=dhea-3k
add comment=vc-877-07.19.26- name=933624 password=933624 profile=dhea-3k
add comment=vc-877-07.19.26- name=575383 password=575383 profile=dhea-3k
add comment=vc-877-07.19.26- name=267393 password=267393 profile=dhea-3k
add comment=vc-877-07.19.26- name=777794 password=777794 profile=dhea-3k
add comment=vc-877-07.19.26- name=784943 password=784943 profile=dhea-3k
add comment=vc-877-07.19.26- name=688663 password=688663 profile=dhea-3k
add comment=vc-877-07.19.26- name=387648 password=387648 profile=dhea-3k
add comment=vc-877-07.19.26- name=289459 password=289459 profile=dhea-3k
add comment=vc-877-07.19.26- name=535829 password=535829 profile=dhea-3k
add comment=vc-877-07.19.26- name=947482 password=947482 profile=dhea-3k
add comment=vc-877-07.19.26- name=985566 password=985566 profile=dhea-3k
add comment=vc-877-07.19.26- name=225542 password=225542 profile=dhea-3k
add comment=vc-877-07.19.26- name=272235 password=272235 profile=dhea-3k
add comment="sep/15/2026 15:13:23" name=756452 password=756452 profile=\
    dhea-3k
add comment=vc-877-07.19.26- name=874866 password=874866 profile=dhea-3k
add comment=vc-877-07.19.26- name=757376 password=757376 profile=dhea-3k
add comment=vc-877-07.19.26- name=845792 password=845792 profile=dhea-3k
add comment=vc-877-07.19.26- name=225752 password=225752 profile=dhea-3k
add comment=vc-877-07.19.26- name=999775 password=999775 profile=dhea-3k
add comment=vc-877-07.19.26- name=689337 password=689337 profile=dhea-3k
add comment=vc-877-07.19.26- name=539976 password=539976 profile=dhea-3k
add comment=vc-877-07.19.26- name=663326 password=663326 profile=dhea-3k
add comment=vc-877-07.19.26- name=844962 password=844962 profile=dhea-3k
add comment=vc-877-07.19.26- name=526994 password=526994 profile=dhea-3k
add comment="sep/15/2026 20:08:01" name=895879 password=895879 profile=\
    dhea-3k
add comment=vc-877-07.19.26- name=273694 password=273694 profile=dhea-3k
add comment=vc-877-07.19.26- name=943467 password=943467 profile=dhea-3k
add comment=vc-877-07.19.26- name=432934 password=432934 profile=dhea-3k
add comment=vc-877-07.19.26- name=985643 password=985643 profile=dhea-3k
add comment=vc-877-07.19.26- name=837423 password=837423 profile=dhea-3k
add comment=vc-877-07.19.26- name=736829 password=736829 profile=dhea-3k
add comment=vc-877-07.19.26- name=779942 password=779942 profile=dhea-3k
add comment=vc-877-07.19.26- name=366443 password=366443 profile=dhea-3k
add comment=vc-877-07.19.26- name=892933 password=892933 profile=dhea-3k
add comment=vc-877-07.19.26- name=459662 password=459662 profile=dhea-3k
add comment=vc-877-07.19.26- name=837968 password=837968 profile=dhea-3k
add comment=vc-346-07.19.26- name=82595 password=82595 profile=3k
add comment=vc-346-07.19.26- name=77356 password=77356 profile=3k
add comment=vc-346-07.19.26- name=86383 password=86383 profile=3k
add comment=vc-346-07.19.26- name=89328 password=89328 profile=3k
add comment=vc-346-07.19.26- name=29752 password=29752 profile=3k
add comment="vc testermaning 19/07/2026" name=testermaning password=\
    testermaning profile=3k
add comment="vc rasito 19/07/2026" name=rasito password=rasito profile=client
add comment=vc-online-21-731433-3k limit-uptime=1d name=731433 password=\
    731433 profile=3k
add comment="vc jualan 19/07/2026" name=jualan password=jualan profile=3k
add comment="vc testing 20/07/2026" name=testing password=testing profile=5k
add comment="vc kolek 20/07/2026" name=kolek password=kolek profile=3k
add comment=vc-online-22-169656-3k limit-uptime=1d name=169656 password=\
    169656 profile=3k
add comment="vc tolong 20/07/2026" name=tolong password=tolong profile=3k
add comment="vc congok 21/07/2026" name=congok password=congok profile=client
add comment=vc-online-28-849397-3k limit-uptime=1d name=849397 password=\
    849397 profile=3k
add comment="vc erul5 02/08/2026" name=erul5 password=erul5 profile=client
add name=testinghotspot password=testinghotspot profile=2hp
add comment=vc-768-08.05.26- name=9252269 password=9252269 profile=5k
add comment=vc-768-08.05.26- name=6794573 password=6794573 profile=5k
add comment=vc-768-08.05.26- name=2774923 password=2774923 profile=5k
add comment=vc-768-08.05.26- name=4733656 password=4733656 profile=5k
add comment=vc-768-08.05.26- name=8796326 password=8796326 profile=5k
add comment=vc-768-08.05.26- name=2573748 password=2573748 profile=5k
add comment=vc-768-08.05.26- name=5332336 password=5332336 profile=5k
add comment=vc-768-08.05.26- name=4773224 password=4773224 profile=5k
add comment=vc-768-08.05.26- name=6285469 password=6285469 profile=5k
add comment=vc-768-08.05.26- name=4346226 password=4346226 profile=5k
add comment=vc-768-08.05.26- name=7597258 password=7597258 profile=5k
add comment=vc-768-08.05.26- name=2362429 password=2362429 profile=5k
add comment=vc-768-08.05.26- name=8378659 password=8378659 profile=5k
add comment=vc-768-08.05.26- name=4726384 password=4726384 profile=5k
add comment=vc-768-08.05.26- name=5496886 password=5496886 profile=5k
add comment=vc-768-08.05.26- name=4272467 password=4272467 profile=5k
add comment=vc-768-08.05.26- name=8765347 password=8765347 profile=5k
add comment=vc-768-08.05.26- name=9257249 password=9257249 profile=5k
add comment=vc-768-08.05.26- name=9593672 password=9593672 profile=5k
add comment=vc-768-08.05.26- name=6232552 password=6232552 profile=5k
add comment=vc-768-08.05.26- name=7847968 password=7847968 profile=5k
add comment=vc-768-08.05.26- name=6943926 password=6943926 profile=5k
add comment=vc-768-08.05.26- name=6743748 password=6743748 profile=5k
add comment=vc-768-08.05.26- name=5367425 password=5367425 profile=5k
add comment=vc-768-08.05.26- name=7762696 password=7762696 profile=5k
add comment=vc-768-08.05.26- name=4999755 password=4999755 profile=5k
add comment=vc-768-08.05.26- name=2388984 password=2388984 profile=5k
add comment=vc-768-08.05.26- name=2453334 password=2453334 profile=5k
add comment=vc-768-08.05.26- name=6622257 password=6622257 profile=5k
add comment=vc-768-08.05.26- name=7678762 password=7678762 profile=5k
add comment=vc-768-08.05.26- name=8954282 password=8954282 profile=5k
add comment=vc-768-08.05.26- name=6842857 password=6842857 profile=5k
add comment=vc-768-08.05.26- name=4877853 password=4877853 profile=5k
add comment=vc-768-08.05.26- name=2529637 password=2529637 profile=5k
add comment=vc-768-08.05.26- name=9969244 password=9969244 profile=5k
add comment=vc-768-08.05.26- name=8483798 password=8483798 profile=5k
add comment=vc-768-08.05.26- name=2534586 password=2534586 profile=5k
add comment=vc-768-08.05.26- name=2288258 password=2288258 profile=5k
add comment=vc-768-08.05.26- name=2522845 password=2522845 profile=5k
add comment=vc-768-08.05.26- name=3249579 password=3249579 profile=5k
add comment=vc-768-08.05.26- name=6652686 password=6652686 profile=5k
add comment=vc-768-08.05.26- name=3558454 password=3558454 profile=5k
add comment=vc-768-08.05.26- name=3376935 password=3376935 profile=5k
add comment=vc-768-08.05.26- name=6739666 password=6739666 profile=5k
add comment=vc-768-08.05.26- name=5556686 password=5556686 profile=5k
add comment=vc-768-08.05.26- name=8767598 password=8767598 profile=5k
add comment=vc-768-08.05.26- name=6223768 password=6223768 profile=5k
add comment=vc-768-08.05.26- name=5599437 password=5599437 profile=5k
add comment=vc-768-08.05.26- name=7237362 password=7237362 profile=5k
add comment=vc-768-08.05.26- name=4474372 password=4474372 profile=5k
add comment=vc-768-08.05.26- name=9243425 password=9243425 profile=5k
add comment=vc-768-08.05.26- name=7539245 password=7539245 profile=5k
add comment=vc-768-08.05.26- name=4527997 password=4527997 profile=5k
add comment=vc-768-08.05.26- name=6972483 password=6972483 profile=5k
add comment=vc-768-08.05.26- name=3782447 password=3782447 profile=5k
add comment="sep/16/2026 19:45:23" name=5835935 password=5835935 profile=5k
add comment="sep/16/2026 18:20:35" name=3863968 password=3863968 profile=5k
add comment=vc-768-08.05.26- name=6227758 password=6227758 profile=5k
add comment=vc-768-08.05.26- name=6727784 password=6727784 profile=5k
add comment=vc-768-08.05.26- name=2487772 password=2487772 profile=5k
add comment=vc-768-08.05.26- name=7535435 password=7535435 profile=5k
add comment=vc-768-08.05.26- name=3873974 password=3873974 profile=5k
add comment=vc-768-08.05.26- name=4224754 password=4224754 profile=5k
add comment=vc-768-08.05.26- name=7274449 password=7274449 profile=5k
add comment=vc-768-08.05.26- name=7344452 password=7344452 profile=5k
add comment=vc-768-08.05.26- name=9797247 password=9797247 profile=5k
add comment=vc-768-08.05.26- name=6359274 password=6359274 profile=5k
add comment=vc-768-08.05.26- name=2434963 password=2434963 profile=5k
add comment=vc-768-08.05.26- name=3554563 password=3554563 profile=5k
add comment=vc-768-08.05.26- name=8852883 password=8852883 profile=5k
add comment=vc-768-08.05.26- name=2293448 password=2293448 profile=5k
add comment=vc-768-08.05.26- name=6874634 password=6874634 profile=5k
add comment=vc-768-08.05.26- name=9959272 password=9959272 profile=5k
add comment=vc-768-08.05.26- name=2248437 password=2248437 profile=5k
add comment=vc-768-08.05.26- name=4964389 password=4964389 profile=5k
add comment=vc-768-08.05.26- name=4277239 password=4277239 profile=5k
add comment=vc-768-08.05.26- name=8832338 password=8832338 profile=5k
add comment=vc-768-08.05.26- name=2459466 password=2459466 profile=5k
add comment=vc-768-08.05.26- name=4888266 password=4888266 profile=5k
add comment=vc-768-08.05.26- name=5957538 password=5957538 profile=5k
add comment=vc-768-08.05.26- name=7566753 password=7566753 profile=5k
add comment=vc-768-08.05.26- name=3355658 password=3355658 profile=5k
add comment=vc-768-08.05.26- name=6625279 password=6625279 profile=5k
add comment=vc-768-08.05.26- name=8824285 password=8824285 profile=5k
add comment=vc-768-08.05.26- name=8896222 password=8896222 profile=5k
add comment=vc-768-08.05.26- name=3272876 password=3272876 profile=5k
add comment=vc-768-08.05.26- name=7292525 password=7292525 profile=5k
add comment=vc-768-08.05.26- name=9464584 password=9464584 profile=5k
add comment=vc-768-08.05.26- name=7755434 password=7755434 profile=5k
add comment=vc-768-08.05.26- name=8278892 password=8278892 profile=5k
add comment=vc-768-08.05.26- name=3233225 password=3233225 profile=5k
add comment=vc-768-08.05.26- name=2654469 password=2654469 profile=5k
add comment=vc-768-08.05.26- name=3449626 password=3449626 profile=5k
add comment=vc-768-08.05.26- name=8658999 password=8658999 profile=5k
add comment=vc-768-08.05.26- name=8355854 password=8355854 profile=5k
add comment=vc-768-08.05.26- name=5972979 password=5972979 profile=5k
add comment=vc-768-08.05.26- name=8945277 password=8945277 profile=5k
add comment=vc-768-08.05.26- name=3884434 password=3884434 profile=5k
add comment=vc-768-08.05.26- name=7374426 password=7374426 profile=5k
add comment=vc-768-08.05.26- name=6639329 password=6639329 profile=5k
add comment=vc-768-08.05.26- name=9572827 password=9572827 profile=5k
add comment=vc-768-08.05.26- name=8453254 password=8453254 profile=5k
add comment=vc-768-08.05.26- name=8986767 password=8986767 profile=5k
add comment=vc-768-08.05.26- name=5265427 password=5265427 profile=5k
add comment=vc-768-08.05.26- name=7287525 password=7287525 profile=5k
add comment=vc-768-08.05.26- name=5966429 password=5966429 profile=5k
add comment=vc-768-08.05.26- name=4697782 password=4697782 profile=5k
add comment=vc-768-08.05.26- name=8599759 password=8599759 profile=5k
add comment=vc-768-08.05.26- name=9797457 password=9797457 profile=5k
add comment=vc-768-08.05.26- name=9684246 password=9684246 profile=5k
add comment=vc-768-08.05.26- name=7797355 password=7797355 profile=5k
add comment=vc-768-08.05.26- name=2293642 password=2293642 profile=5k
add comment=vc-768-08.05.26- name=5324924 password=5324924 profile=5k
add comment=vc-768-08.05.26- name=7539843 password=7539843 profile=5k
add comment=vc-768-08.05.26- name=7978276 password=7978276 profile=5k
add comment=vc-768-08.05.26- name=6834245 password=6834245 profile=5k
add comment=vc-768-08.05.26- name=6568372 password=6568372 profile=5k
add comment=vc-768-08.05.26- name=3868668 password=3868668 profile=5k
add comment=vc-768-08.05.26- name=2636426 password=2636426 profile=5k
add comment=vc-768-08.05.26- name=5427438 password=5427438 profile=5k
add comment=vc-768-08.05.26- name=6742799 password=6742799 profile=5k
add comment=vc-768-08.05.26- name=5893789 password=5893789 profile=5k
add comment=vc-768-08.05.26- name=9744453 password=9744453 profile=5k
add comment=vc-768-08.05.26- name=6993937 password=6993937 profile=5k
add comment=vc-768-08.05.26- name=4722632 password=4722632 profile=5k
add comment=vc-768-08.05.26- name=5439895 password=5439895 profile=5k
add comment=vc-768-08.05.26- name=3847334 password=3847334 profile=5k
add comment="vc pas 06/08/2026" name=pas password=pas profile=client
add comment=vc-179400-3k limit-uptime=1d name=179400 password=179400 profile=\
    3k
add comment=vc-942425-3k limit-uptime=1d name=942425 password=942425 profile=\
    3k
add comment=vc-613476-3k limit-uptime=1d name=613476 password=613476 profile=\
    3k
add comment=vc-770819-3k limit-uptime=1d name=770819 password=770819 profile=\
    3k
add comment=vc-368647-3k limit-uptime=1d name=368647 password=368647 profile=\
    3k
add comment=vc-646745-3k limit-uptime=1d name=646745 password=646745 profile=\
    3k
add comment=vc-734430-3k limit-uptime=1d name=734430 password=734430 profile=\
    3k
add comment=vc-593820-3k limit-uptime=1d name=593820 password=593820 profile=\
    3k
add comment=vc-167062-3k limit-uptime=1d name=167062 password=167062 profile=\
    3k
add comment=vc-853696-3k limit-uptime=1d name=853696 password=853696 profile=\
    3k
add comment=vc-393627-3k limit-uptime=1d name=393627 password=393627 profile=\
    3k
add comment=vc-457727-3k limit-uptime=1d name=457727 password=457727 profile=\
    3k
add comment=vc-834660-3k limit-uptime=1d name=834660 password=834660 profile=\
    3k
add comment=vc-375858-3k limit-uptime=1d name=375858 password=375858 profile=\
    3k
add comment=vc-643975-3k limit-uptime=1d name=643975 password=643975 profile=\
    3k
add comment=vc-970274-3k limit-uptime=1d name=970274 password=970274 profile=\
    3k
add comment=vc-910861-3k limit-uptime=1d name=910861 password=910861 profile=\
    3k
add comment=vc-154929-3k limit-uptime=1d name=154929 password=154929 profile=\
    3k
add comment=vc-464515-3k limit-uptime=1d name=464515 password=464515 profile=\
    3k
add comment=vc-112278-3k limit-uptime=1d name=112278 password=112278 profile=\
    3k
add comment=vc-216774-3k limit-uptime=1d name=216774 password=216774 profile=\
    3k
add comment=vc-694953-3k limit-uptime=1d name=694953 password=694953 profile=\
    3k
add comment=vc-354590-3k limit-uptime=1d name=354590 password=354590 profile=\
    3k
add comment=vc-192290-3k limit-uptime=1d name=192290 password=192290 profile=\
    3k
add comment=vc-444288-3k limit-uptime=1d name=444288 password=444288 profile=\
    3k
add comment=vc-151751-3k limit-uptime=1d name=151751 password=151751 profile=\
    3k
add comment=vc-853557-3k limit-uptime=1d name=853557 password=853557 profile=\
    3k
add comment=vc-189618-3k limit-uptime=1d name=189618 password=189618 profile=\
    3k
add comment=vc-686001-3k limit-uptime=1d name=686001 password=686001 profile=\
    3k
add comment=vc-330665-3k limit-uptime=1d name=330665 password=330665 profile=\
    3k
add comment=vc-260285-3k limit-uptime=1d name=260285 password=260285 profile=\
    3k
add comment=vc-785673-3k limit-uptime=1d name=785673 password=785673 profile=\
    3k
add comment=vc-693627-3k limit-uptime=1d name=693627 password=693627 profile=\
    3k
add comment=vc-189813-3k limit-uptime=1d name=189813 password=189813 profile=\
    3k
add comment=vc-725323-3k limit-uptime=1d name=725323 password=725323 profile=\
    3k
add comment=vc-643191-3k limit-uptime=1d name=643191 password=643191 profile=\
    3k
add comment=vc-415680-3k limit-uptime=1d name=415680 password=415680 profile=\
    3k
add comment=vc-847582-3k limit-uptime=1d name=847582 password=847582 profile=\
    3k
add comment=vc-396370-3k limit-uptime=1d name=396370 password=396370 profile=\
    3k
add comment=vc-315222-3k limit-uptime=1d name=315222 password=315222 profile=\
    3k
add comment=vc-742505-3k limit-uptime=1d name=742505 password=742505 profile=\
    3k
add comment=vc-833788-3k limit-uptime=1d name=833788 password=833788 profile=\
    3k
add comment=vc-896667-3k limit-uptime=1d name=896667 password=896667 profile=\
    3k
add comment=vc-541847-3k limit-uptime=1d name=541847 password=541847 profile=\
    3k
add comment=vc-983201-3k limit-uptime=1d name=983201 password=983201 profile=\
    3k
add comment=vc-820221-3k limit-uptime=1d name=820221 password=820221 profile=\
    3k
add comment=vc-397214-3k limit-uptime=1d name=397214 password=397214 profile=\
    3k
add comment=vc-716486-3k limit-uptime=1d name=716486 password=716486 profile=\
    3k
add comment=vc-887997-3k limit-uptime=1d name=887997 password=887997 profile=\
    3k
add comment=vc-512607-3k limit-uptime=1d name=512607 password=512607 profile=\
    3k
add comment=vc-753-08.08.26- name=746456 password=746456 profile=dona-3k
add comment=vc-753-08.08.26- name=232825 password=232825 profile=dona-3k
add comment=vc-753-08.08.26- name=768435 password=768435 profile=dona-3k
add comment=vc-753-08.08.26- name=599557 password=599557 profile=dona-3k
add comment=vc-753-08.08.26- name=278925 password=278925 profile=dona-3k
add comment=vc-753-08.08.26- name=428926 password=428926 profile=dona-3k
add comment=vc-753-08.08.26- name=284749 password=284749 profile=dona-3k
add comment=vc-753-08.08.26- name=773457 password=773457 profile=dona-3k
add comment=vc-753-08.08.26- name=935822 password=935822 profile=dona-3k
add comment=vc-753-08.08.26- name=542958 password=542958 profile=dona-3k
add comment=vc-753-08.08.26- name=772353 password=772353 profile=dona-3k
add comment=vc-753-08.08.26- name=633358 password=633358 profile=dona-3k
add comment=vc-753-08.08.26- name=929272 password=929272 profile=dona-3k
add comment=vc-753-08.08.26- name=333662 password=333662 profile=dona-3k
add comment=vc-753-08.08.26- name=457238 password=457238 profile=dona-3k
add comment=vc-753-08.08.26- name=635629 password=635629 profile=dona-3k
add comment=vc-753-08.08.26- name=597325 password=597325 profile=dona-3k
add comment=vc-753-08.08.26- name=793297 password=793297 profile=dona-3k
add comment=vc-753-08.08.26- name=953453 password=953453 profile=dona-3k
add comment=vc-753-08.08.26- name=235967 password=235967 profile=dona-3k
add comment=vc-753-08.08.26- name=424674 password=424674 profile=dona-3k
add comment=vc-753-08.08.26- name=598776 password=598776 profile=dona-3k
add comment=vc-753-08.08.26- name=694938 password=694938 profile=dona-3k
add comment=vc-753-08.08.26- name=868596 password=868596 profile=dona-3k
add comment=vc-753-08.08.26- name=223889 password=223889 profile=dona-3k
add comment=vc-753-08.08.26- name=523958 password=523958 profile=dona-3k
add comment=vc-753-08.08.26- name=997326 password=997326 profile=dona-3k
add comment=vc-753-08.08.26- name=872844 password=872844 profile=dona-3k
add comment=vc-753-08.08.26- name=978337 password=978337 profile=dona-3k
add comment=vc-753-08.08.26- name=892826 password=892826 profile=dona-3k
add comment=vc-753-08.08.26- name=979343 password=979343 profile=dona-3k
add comment=vc-753-08.08.26- name=746589 password=746589 profile=dona-3k
add comment=vc-753-08.08.26- name=738995 password=738995 profile=dona-3k
add comment="sep/15/2026 10:30:13" name=996585 password=996585 profile=\
    dona-3k
add comment=vc-753-08.08.26- name=474423 password=474423 profile=dona-3k
add comment=vc-753-08.08.26- name=339896 password=339896 profile=dona-3k
add comment=vc-753-08.08.26- name=363734 password=363734 profile=dona-3k
add comment=vc-753-08.08.26- name=637494 password=637494 profile=dona-3k
add comment=vc-753-08.08.26- name=526954 password=526954 profile=dona-3k
add comment=vc-753-08.08.26- name=499473 password=499473 profile=dona-3k
add comment=vc-753-08.08.26- name=672734 password=672734 profile=dona-3k
add comment=vc-753-08.08.26- name=552635 password=552635 profile=dona-3k
add comment=vc-753-08.08.26- name=278379 password=278379 profile=dona-3k
add comment=vc-753-08.08.26- name=482879 password=482879 profile=dona-3k
add comment=vc-753-08.08.26- name=466789 password=466789 profile=dona-3k
add comment=vc-753-08.08.26- name=685828 password=685828 profile=dona-3k
add comment=vc-753-08.08.26- name=487833 password=487833 profile=dona-3k
add comment=vc-753-08.08.26- name=537593 password=537593 profile=dona-3k
add comment=vc-753-08.08.26- name=273244 password=273244 profile=dona-3k
add comment=vc-753-08.08.26- name=544658 password=544658 profile=dona-3k
add comment=vc-753-08.08.26- name=565657 password=565657 profile=dona-3k
add comment=vc-753-08.08.26- name=693743 password=693743 profile=dona-3k
add comment=vc-753-08.08.26- name=644723 password=644723 profile=dona-3k
add comment=vc-753-08.08.26- name=735557 password=735557 profile=dona-3k
add comment=vc-753-08.08.26- name=865756 password=865756 profile=dona-3k
add comment=vc-753-08.08.26- name=222434 password=222434 profile=dona-3k
add comment=vc-753-08.08.26- name=327479 password=327479 profile=dona-3k
add comment=vc-753-08.08.26- name=594246 password=594246 profile=dona-3k
add comment=vc-753-08.08.26- name=568326 password=568326 profile=dona-3k
add comment=vc-753-08.08.26- name=454748 password=454748 profile=dona-3k
add comment=vc-753-08.08.26- name=422794 password=422794 profile=dona-3k
add comment=vc-753-08.08.26- name=593588 password=593588 profile=dona-3k
add comment=vc-753-08.08.26- name=982639 password=982639 profile=dona-3k
add comment=vc-753-08.08.26- name=274938 password=274938 profile=dona-3k
add comment=vc-753-08.08.26- name=878846 password=878846 profile=dona-3k
add comment=vc-753-08.08.26- name=567793 password=567793 profile=dona-3k
add comment=vc-753-08.08.26- name=845566 password=845566 profile=dona-3k
add comment=vc-753-08.08.26- name=667682 password=667682 profile=dona-3k
add comment=vc-753-08.08.26- name=862488 password=862488 profile=dona-3k
add comment=vc-753-08.08.26- name=788627 password=788627 profile=dona-3k
add comment=vc-753-08.08.26- name=694338 password=694338 profile=dona-3k
add comment=vc-753-08.08.26- name=779756 password=779756 profile=dona-3k
add comment=vc-753-08.08.26- name=495865 password=495865 profile=dona-3k
add comment=vc-753-08.08.26- name=863469 password=863469 profile=dona-3k
add comment=vc-753-08.08.26- name=365568 password=365568 profile=dona-3k
add comment=vc-753-08.08.26- name=925239 password=925239 profile=dona-3k
add comment=vc-753-08.08.26- name=347833 password=347833 profile=dona-3k
add comment=vc-753-08.08.26- name=853229 password=853229 profile=dona-3k
add comment=vc-753-08.08.26- name=252242 password=252242 profile=dona-3k
add comment=vc-753-08.08.26- name=423535 password=423535 profile=dona-3k
add comment=vc-753-08.08.26- name=999929 password=999929 profile=dona-3k
add comment=vc-753-08.08.26- name=382368 password=382368 profile=dona-3k
add comment=vc-753-08.08.26- name=645947 password=645947 profile=dona-3k
add comment=vc-753-08.08.26- name=676455 password=676455 profile=dona-3k
add comment=vc-753-08.08.26- name=648367 password=648367 profile=dona-3k
add comment=vc-753-08.08.26- name=946258 password=946258 profile=dona-3k
add comment=vc-753-08.08.26- name=866384 password=866384 profile=dona-3k
add comment=vc-753-08.08.26- name=887449 password=887449 profile=dona-3k
add comment=vc-753-08.08.26- name=762657 password=762657 profile=dona-3k
add comment=vc-753-08.08.26- name=782373 password=782373 profile=dona-3k
add comment=vc-753-08.08.26- name=458247 password=458247 profile=dona-3k
add comment=vc-753-08.08.26- name=665588 password=665588 profile=dona-3k
add comment=vc-753-08.08.26- name=556973 password=556973 profile=dona-3k
add comment=vc-753-08.08.26- name=247449 password=247449 profile=dona-3k
add comment=vc-753-08.08.26- name=233226 password=233226 profile=dona-3k
add comment=vc-753-08.08.26- name=842555 password=842555 profile=dona-3k
add comment=vc-753-08.08.26- name=575277 password=575277 profile=dona-3k
add comment=vc-81230-10k limit-uptime=5d name=81230 password=81230 profile=\
    10k
add comment="vc anjani 10/08/2026" name=anjani password=anjani profile=client
add comment=vc-776-08.12.26- name=57497 password=57497 profile=3k
add comment=vc-776-08.12.26- name=96369 password=96369 profile=3k
add comment=vc-776-08.12.26- name=35294 password=35294 profile=3k
add comment=vc-776-08.12.26- name=94956 password=94956 profile=3k
add comment=vc-776-08.12.26- name=67449 password=67449 profile=3k
add comment=vc-776-08.12.26- name=93652 password=93652 profile=3k
add comment=vc-776-08.12.26- name=68892 password=68892 profile=3k
add comment=vc-776-08.12.26- name=63827 password=63827 profile=3k
add comment=vc-776-08.12.26- name=25558 password=25558 profile=3k
add comment=vc-776-08.12.26- name=59735 password=59735 profile=3k
add comment=vc-776-08.12.26- name=64954 password=64954 profile=3k
add comment=vc-776-08.12.26- name=53476 password=53476 profile=3k
add comment=vc-776-08.12.26- name=72429 password=72429 profile=3k
add comment=vc-776-08.12.26- name=78796 password=78796 profile=3k
add comment=vc-776-08.12.26- name=83596 password=83596 profile=3k
add comment=vc-776-08.12.26- name=34866 password=34866 profile=3k
add comment=vc-776-08.12.26- name=59958 password=59958 profile=3k
add comment=vc-776-08.12.26- name=34869 password=34869 profile=3k
add comment=vc-776-08.12.26- name=56569 password=56569 profile=3k
add comment=vc-776-08.12.26- name=89577 password=89577 profile=3k
add comment=vc-776-08.12.26- name=25822 password=25822 profile=3k
add comment=vc-776-08.12.26- name=79784 password=79784 profile=3k
add comment=vc-776-08.12.26- name=63599 password=63599 profile=3k
add comment=vc-776-08.12.26- name=32585 password=32585 profile=3k
add comment=vc-776-08.12.26- name=36468 password=36468 profile=3k
add comment=vc-776-08.12.26- name=72578 password=72578 profile=3k
add comment=vc-776-08.12.26- name=48794 password=48794 profile=3k
add comment=vc-776-08.12.26- name=69625 password=69625 profile=3k
add comment=vc-776-08.12.26- name=64493 password=64493 profile=3k
add comment=vc-776-08.12.26- name=66735 password=66735 profile=3k
add comment=vc-776-08.12.26- name=25453 password=25453 profile=3k
add comment=vc-776-08.12.26- name=85363 password=85363 profile=3k
add comment=vc-776-08.12.26- name=96352 password=96352 profile=3k
add comment=vc-776-08.12.26- name=22922 password=22922 profile=3k
add comment=vc-776-08.12.26- name=35257 password=35257 profile=3k
add comment=vc-776-08.12.26- name=77882 password=77882 profile=3k
add comment=vc-776-08.12.26- name=88982 password=88982 profile=3k
add comment=vc-776-08.12.26- name=28399 password=28399 profile=3k
add comment=vc-776-08.12.26- name=36552 password=36552 profile=3k
add comment=vc-776-08.12.26- name=39939 password=39939 profile=3k
add comment=vc-776-08.12.26- name=45287 password=45287 profile=3k
add comment=vc-776-08.12.26- name=24426 password=24426 profile=3k
add comment=vc-776-08.12.26- name=63728 password=63728 profile=3k
add comment=vc-776-08.12.26- name=39894 password=39894 profile=3k
add comment=vc-776-08.12.26- name=87782 password=87782 profile=3k
add comment=vc-776-08.12.26- name=68534 password=68534 profile=3k
add comment=vc-776-08.12.26- name=53332 password=53332 profile=3k
add comment=vc-776-08.12.26- name=49396 password=49396 profile=3k
add comment=vc-776-08.12.26- name=27275 password=27275 profile=3k
add comment=vc-776-08.12.26- name=32694 password=32694 profile=3k
add comment=vc-776-08.12.26- name=46475 password=46475 profile=3k
add comment=vc-776-08.12.26- name=45757 password=45757 profile=3k
add comment=vc-776-08.12.26- name=63333 password=63333 profile=3k
add comment=vc-776-08.12.26- name=57752 password=57752 profile=3k
add comment=vc-776-08.12.26- name=82648 password=82648 profile=3k
add comment=vc-776-08.12.26- name=73693 password=73693 profile=3k
add comment=vc-776-08.12.26- name=89867 password=89867 profile=3k
add comment=vc-776-08.12.26- name=57862 password=57862 profile=3k
add comment=vc-776-08.12.26- name=98923 password=98923 profile=3k
add comment=vc-776-08.12.26- name=88526 password=88526 profile=3k
add comment=vc-776-08.12.26- name=22296 password=22296 profile=3k
add comment=vc-776-08.12.26- name=56598 password=56598 profile=3k
add comment=vc-776-08.12.26- name=79252 password=79252 profile=3k
add comment=vc-776-08.12.26- name=45952 password=45952 profile=3k
add comment=vc-776-08.12.26- name=83832 password=83832 profile=3k
add comment=vc-776-08.12.26- name=87722 password=87722 profile=3k
add comment=vc-776-08.12.26- name=28353 password=28353 profile=3k
add comment=vc-776-08.12.26- name=95569 password=95569 profile=3k
add comment=vc-776-08.12.26- name=96639 password=96639 profile=3k
add comment=vc-776-08.12.26- name=54373 password=54373 profile=3k
add comment=vc-776-08.12.26- name=59455 password=59455 profile=3k
add comment=vc-776-08.12.26- name=85852 password=85852 profile=3k
add comment=vc-776-08.12.26- name=77796 password=77796 profile=3k
add comment=vc-776-08.12.26- name=82222 password=82222 profile=3k
add comment=vc-776-08.12.26- name=47974 password=47974 profile=3k
add comment=vc-776-08.12.26- name=84734 password=84734 profile=3k
add comment=vc-776-08.12.26- name=65757 password=65757 profile=3k
add comment=vc-776-08.12.26- name=73448 password=73448 profile=3k
add comment=vc-776-08.12.26- name=99556 password=99556 profile=3k
add comment=vc-776-08.12.26- name=26438 password=26438 profile=3k
add comment=vc-776-08.12.26- name=54889 password=54889 profile=3k
add comment=vc-776-08.12.26- name=33867 password=33867 profile=3k
add comment=vc-776-08.12.26- name=87668 password=87668 profile=3k
add comment=vc-776-08.12.26- name=48636 password=48636 profile=3k
add comment=vc-776-08.12.26- name=48252 password=48252 profile=3k
add comment=vc-776-08.12.26- name=25397 password=25397 profile=3k
add comment=vc-776-08.12.26- name=24853 password=24853 profile=3k
add comment=vc-776-08.12.26- name=44493 password=44493 profile=3k
add comment=vc-776-08.12.26- name=94668 password=94668 profile=3k
add comment=vc-776-08.12.26- name=93949 password=93949 profile=3k
add comment=vc-776-08.12.26- name=27727 password=27727 profile=3k
add comment=vc-776-08.12.26- name=29634 password=29634 profile=3k
add comment=vc-776-08.12.26- name=55945 password=55945 profile=3k
add comment="sep/16/2026 19:53:03" name=gesex6 password=gesex6 profile=2hp
add comment="vc inan 20/08/2026" name=inan password=inan profile=client
add comment=vc-5913-3k limit-uptime=1d name=5913 password=5913 profile=3k
add comment="sep/21/2026 17:15:13" name=sopiyah4 password=sopiyah4 profile=\
    50k
add comment="sep/21/2026 17:28:52" name=cahyo6 password=cahyo6 profile=2hp
add name=mik password=mik profile=3k
add comment=vc-25/08/2026-MikroTikManager name=miktest password=12345 \
    profile=3k
add comment=vc-25/08/2026-MikroTikManager name=nyobabar password=1234545 \
    profile=5k
add comment=vc-26/08/2026-MikroTikManager name=jajale password=wewek profile=\
    10k
add comment=vc-26/08/2026-MikroTikManager name=gagags password=gaggss \
    profile=15k
add comment="sep/26/2026 21:24:08" name=yudi5 password=yudi5 profile=2hp
add comment=vc-121-08.28.26- name=75982 password=75982 profile=3k
add comment=vc-121-08.28.26- name=32939 password=32939 profile=3k
add comment=vc-121-08.28.26- name=67984 password=67984 profile=3k
add comment=vc-121-08.28.26- name=23346 password=23346 profile=3k
add comment=vc-121-08.28.26- name=92775 password=92775 profile=3k
add comment=vc-121-08.28.26- name=38342 password=38342 profile=3k
add comment=vc-121-08.28.26- name=38775 password=38775 profile=3k
add comment=vc-121-08.28.26- name=24473 password=24473 profile=3k
add comment=vc-121-08.28.26- name=65399 password=65399 profile=3k
add comment=vc-121-08.28.26- name=38988 password=38988 profile=3k
add comment=vc-121-08.28.26- name=22749 password=22749 profile=3k
add comment=vc-121-08.28.26- name=66984 password=66984 profile=3k
add comment=vc-121-08.28.26- name=22763 password=22763 profile=3k
add comment=vc-121-08.28.26- name=86835 password=86835 profile=3k
add comment=vc-121-08.28.26- name=34559 password=34559 profile=3k
add comment=vc-121-08.28.26- name=69239 password=69239 profile=3k
add comment=vc-121-08.28.26- name=25257 password=25257 profile=3k
add comment=vc-121-08.28.26- name=53825 password=53825 profile=3k
add comment=vc-121-08.28.26- name=47249 password=47249 profile=3k
add comment=vc-121-08.28.26- name=32276 password=32276 profile=3k
add comment=vc-121-08.28.26- name=48524 password=48524 profile=3k
add comment=vc-121-08.28.26- name=72228 password=72228 profile=3k
add comment=vc-121-08.28.26- name=76232 password=76232 profile=3k
add comment=vc-121-08.28.26- name=85542 password=85542 profile=3k
add comment=vc-121-08.28.26- name=27792 password=27792 profile=3k
add comment=vc-121-08.28.26- name=73652 password=73652 profile=3k
add comment=vc-121-08.28.26- name=27249 password=27249 profile=3k
add comment=vc-121-08.28.26- name=58899 password=58899 profile=3k
add comment=vc-121-08.28.26- name=88543 password=88543 profile=3k
add comment=vc-121-08.28.26- name=59978 password=59978 profile=3k
add comment=vc-121-08.28.26- name=85482 password=85482 profile=3k
add comment=vc-121-08.28.26- name=65282 password=65282 profile=3k
add comment=vc-121-08.28.26- name=67533 password=67533 profile=3k
add comment=vc-121-08.28.26- name=32765 password=32765 profile=3k
add comment=vc-121-08.28.26- name=65656 password=65656 profile=3k
add comment=vc-121-08.28.26- name=46687 password=46687 profile=3k
add comment=vc-121-08.28.26- name=76625 password=76625 profile=3k
add comment=vc-121-08.28.26- name=78852 password=78852 profile=3k
add comment=vc-121-08.28.26- name=73797 password=73797 profile=3k
add comment=vc-121-08.28.26- name=98678 password=98678 profile=3k
add comment=vc-121-08.28.26- name=27773 password=27773 profile=3k
add comment=vc-121-08.28.26- name=57972 password=57972 profile=3k
add comment=vc-121-08.28.26- name=62682 password=62682 profile=3k
add comment=vc-121-08.28.26- name=76389 password=76389 profile=3k
add comment=vc-121-08.28.26- name=68485 password=68485 profile=3k
add comment=vc-121-08.28.26- name=57337 password=57337 profile=3k
add comment=vc-121-08.28.26- name=96546 password=96546 profile=3k
add comment=vc-121-08.28.26- name=56743 password=56743 profile=3k
add comment=vc-121-08.28.26- name=66783 password=66783 profile=3k
add comment=vc-121-08.28.26- name=83327 password=83327 profile=3k
add comment=vc-121-08.28.26- name=66935 password=66935 profile=3k
add comment=vc-121-08.28.26- name=52755 password=52755 profile=3k
add comment=vc-121-08.28.26- name=28626 password=28626 profile=3k
add comment=vc-121-08.28.26- name=84924 password=84924 profile=3k
add comment=vc-121-08.28.26- name=55364 password=55364 profile=3k
add comment=vc-121-08.28.26- name=25664 password=25664 profile=3k
add comment=vc-121-08.28.26- name=23323 password=23323 profile=3k
add comment=vc-121-08.28.26- name=32367 password=32367 profile=3k
add comment=vc-121-08.28.26- name=37482 password=37482 profile=3k
add comment=vc-121-08.28.26- name=95878 password=95878 profile=3k
add comment=vc-121-08.28.26- name=37683 password=37683 profile=3k
add comment=vc-121-08.28.26- name=95666 password=95666 profile=3k
add comment=vc-121-08.28.26- name=35434 password=35434 profile=3k
add comment=vc-121-08.28.26- name=34642 password=34642 profile=3k
add comment=vc-121-08.28.26- name=44292 password=44292 profile=3k
add comment=vc-121-08.28.26- name=84872 password=84872 profile=3k
add comment=vc-121-08.28.26- name=99886 password=99886 profile=3k
add comment=vc-121-08.28.26- name=92658 password=92658 profile=3k
add comment=vc-121-08.28.26- name=55527 password=55527 profile=3k
add comment=vc-121-08.28.26- name=94483 password=94483 profile=3k
add comment=vc-121-08.28.26- name=93249 password=93249 profile=3k
add comment=vc-121-08.28.26- name=72653 password=72653 profile=3k
add comment=vc-121-08.28.26- name=53293 password=53293 profile=3k
add comment=vc-121-08.28.26- name=32379 password=32379 profile=3k
add comment=vc-121-08.28.26- name=69347 password=69347 profile=3k
add comment=vc-121-08.28.26- name=85738 password=85738 profile=3k
add comment=vc-121-08.28.26- name=74833 password=74833 profile=3k
add comment=vc-121-08.28.26- name=79978 password=79978 profile=3k
add comment=vc-121-08.28.26- name=67757 password=67757 profile=3k
add comment=vc-121-08.28.26- name=55734 password=55734 profile=3k
add comment=vc-121-08.28.26- name=32869 password=32869 profile=3k
add comment=vc-121-08.28.26- name=66486 password=66486 profile=3k
add comment=vc-121-08.28.26- name=85475 password=85475 profile=3k
add comment=vc-121-08.28.26- name=27626 password=27626 profile=3k
add comment=vc-121-08.28.26- name=57273 password=57273 profile=3k
add comment=vc-121-08.28.26- name=84268 password=84268 profile=3k
add comment=vc-121-08.28.26- name=63525 password=63525 profile=3k
add comment=vc-121-08.28.26- name=34626 password=34626 profile=3k
add comment=vc-121-08.28.26- name=53372 password=53372 profile=3k
add comment=vc-121-08.28.26- name=89784 password=89784 profile=3k
add comment=vc-121-08.28.26- name=47466 password=47466 profile=3k
add comment=vc-121-08.28.26- name=42383 password=42383 profile=3k
add comment=vc-121-08.28.26- name=53722 password=53722 profile=3k
add comment=vc-121-08.28.26- name=77738 password=77738 profile=3k
add comment=vc-121-08.28.26- name=95534 password=95534 profile=3k
add comment=vc-768-08.28.26- name=874443 password=874443 profile=5k
add comment=vc-768-08.28.26- name=785779 password=785779 profile=5k
add comment=vc-768-08.28.26- name=426899 password=426899 profile=5k
add comment=vc-768-08.28.26- name=497598 password=497598 profile=5k
add comment=vc-768-08.28.26- name=495778 password=495778 profile=5k
add comment=vc-768-08.28.26- name=966542 password=966542 profile=5k
add comment=vc-768-08.28.26- name=464844 password=464844 profile=5k
add comment=vc-768-08.28.26- name=239456 password=239456 profile=5k
add comment=vc-768-08.28.26- name=482944 password=482944 profile=5k
add comment=vc-768-08.28.26- name=348554 password=348554 profile=5k
add comment=vc-768-08.28.26- name=878768 password=878768 profile=5k
add comment=vc-768-08.28.26- name=399484 password=399484 profile=5k
add comment=vc-768-08.28.26- name=586857 password=586857 profile=5k
add comment=vc-768-08.28.26- name=595235 password=595235 profile=5k
add comment="sep/16/2026 18:39:15" name=435734 password=435734 profile=5k
add comment=vc-768-08.28.26- name=686786 password=686786 profile=5k
add comment="sep/15/2026 06:56:22" name=542476 password=542476 profile=5k
add comment=vc-768-08.28.26- name=826576 password=826576 profile=5k
add comment=vc-768-08.28.26- name=337794 password=337794 profile=5k
add comment=vc-768-08.28.26- name=423488 password=423488 profile=5k
add comment=vc-768-08.28.26- name=269634 password=269634 profile=5k
add comment=vc-768-08.28.26- name=956795 password=956795 profile=5k
add comment=vc-768-08.28.26- name=572448 password=572448 profile=5k
add comment=vc-768-08.28.26- name=643728 password=643728 profile=5k
add comment=vc-768-08.28.26- name=945758 password=945758 profile=5k
add comment=vc-768-08.28.26- name=555726 password=555726 profile=5k
add comment=vc-768-08.28.26- name=434943 password=434943 profile=5k
add comment="sep/15/2026 18:13:29" name=693342 password=693342 profile=5k
add comment=vc-768-08.28.26- name=564842 password=564842 profile=5k
add comment=vc-768-08.28.26- name=756928 password=756928 profile=5k
add comment=vc-768-08.28.26- name=354396 password=354396 profile=5k
add comment=vc-768-08.28.26- name=372543 password=372543 profile=5k
add comment=vc-768-08.28.26- name=468963 password=468963 profile=5k
add comment=vc-768-08.28.26- name=363527 password=363527 profile=5k
add comment=vc-768-08.28.26- name=827382 password=827382 profile=5k
add comment=vc-768-08.28.26- name=453726 password=453726 profile=5k
add comment=vc-768-08.28.26- name=395486 password=395486 profile=5k
add comment=vc-768-08.28.26- name=942665 password=942665 profile=5k
add comment=vc-768-08.28.26- name=342488 password=342488 profile=5k
add comment=vc-768-08.28.26- name=935659 password=935659 profile=5k
add comment=vc-768-08.28.26- name=687232 password=687232 profile=5k
add comment=vc-768-08.28.26- name=523373 password=523373 profile=5k
add comment=vc-768-08.28.26- name=478794 password=478794 profile=5k
add comment=vc-768-08.28.26- name=387276 password=387276 profile=5k
add comment=vc-768-08.28.26- name=596369 password=596369 profile=5k
add comment=vc-768-08.28.26- name=483765 password=483765 profile=5k
add comment=vc-768-08.28.26- name=336953 password=336953 profile=5k
add comment=vc-768-08.28.26- name=748576 password=748576 profile=5k
add comment="sep/15/2026 19:16:39" name=242938 password=242938 profile=5k
add comment=vc-768-08.28.26- name=889237 password=889237 profile=5k
add comment="sep/15/2026 07:52:16" name=272426 password=272426 profile=5k
add comment=vc-768-08.28.26- name=292555 password=292555 profile=5k
add comment=vc-768-08.28.26- name=597355 password=597355 profile=5k
add comment=vc-768-08.28.26- name=954665 password=954665 profile=5k
add comment=vc-768-08.28.26- name=878796 password=878796 profile=5k
add comment=vc-768-08.28.26- name=669459 password=669459 profile=5k
add comment=vc-768-08.28.26- name=523486 password=523486 profile=5k
add comment=vc-768-08.28.26- name=565698 password=565698 profile=5k
add comment=vc-768-08.28.26- name=446564 password=446564 profile=5k
add comment=vc-768-08.28.26- name=364683 password=364683 profile=5k
add comment=vc-768-08.28.26- name=769625 password=769625 profile=5k
add comment=vc-768-08.28.26- name=357225 password=357225 profile=5k
add comment="sep/15/2026 09:01:14" name=963527 password=963527 profile=5k
add comment=vc-768-08.28.26- name=922682 password=922682 profile=5k
add comment="sep/15/2026 18:55:03" name=899352 password=899352 profile=5k
add comment=vc-768-08.28.26- name=677882 password=677882 profile=5k
add comment=vc-768-08.28.26- name=898242 password=898242 profile=5k
add comment=vc-768-08.28.26- name=846228 password=846228 profile=5k
add comment=vc-768-08.28.26- name=228498 password=228498 profile=5k
add comment=vc-768-08.28.26- name=365522 password=365522 profile=5k
add comment=vc-768-08.28.26- name=939786 password=939786 profile=5k
add comment=vc-6192-3k limit-uptime=1d name=6192 password=6192 profile=3k
add name=jayabaya password=jayabaya profile=dewek
add comment="vc tester55 02/09/2026" name=tester55 password=tester55 profile=\
    3k
add comment=ag-agent-327910-50k limit-uptime=4w2d name=327910 password=327910 \
    profile=50k
add comment=ag-agent-19857-15k limit-uptime=1w name=19857 password=19857 \
    profile=15k
add comment=vc-02/09/2026-MikroTikManager name=testeretere password=1233455 \
    profile=3k
add comment=vc-02/09/2026-MikroTikManager name=8442 password=8442 profile=3k
add comment=vc-02/09/2026-MikroTikManager name=4523 password=4523 profile=3k
add comment=vc-487-09.05.26- name=34794 password=34794 profile=3k
add comment=vc-487-09.05.26- name=55376 password=55376 profile=3k
add comment=vc-487-09.05.26- name=67529 password=67529 profile=3k
add comment=vc-487-09.05.26- name=73589 password=73589 profile=3k
add comment=vc-487-09.05.26- name=33845 password=33845 profile=3k
add comment=vc-487-09.05.26- name=74732 password=74732 profile=3k
add comment=vc-487-09.05.26- name=69382 password=69382 profile=3k
add comment=vc-487-09.05.26- name=88365 password=88365 profile=3k
add comment=vc-487-09.05.26- name=86334 password=86334 profile=3k
add comment="sep/15/2026 18:17:52" name=36758 password=36758 profile=3k
add comment=vc-487-09.05.26- name=32444 password=32444 profile=3k
add comment=vc-487-09.05.26- name=75689 password=75689 profile=3k
add comment=vc-487-09.05.26- name=96256 password=96256 profile=3k
add comment=vc-487-09.05.26- name=25866 password=25866 profile=3k
add comment=vc-487-09.05.26- name=24999 password=24999 profile=3k
add comment=vc-487-09.05.26- name=99748 password=99748 profile=3k
add comment=vc-487-09.05.26- name=35333 password=35333 profile=3k
add comment=vc-487-09.05.26- name=24855 password=24855 profile=3k
add comment=vc-487-09.05.26- name=83677 password=83677 profile=3k
add comment=vc-487-09.05.26- name=36379 password=36379 profile=3k
add comment=vc-487-09.05.26- name=75896 password=75896 profile=3k
add comment=vc-487-09.05.26- name=33242 password=33242 profile=3k
add comment=vc-487-09.05.26- name=92398 password=92398 profile=3k
add comment=vc-487-09.05.26- name=74998 password=74998 profile=3k
add comment=vc-487-09.05.26- name=38626 password=38626 profile=3k
add comment=vc-487-09.05.26- name=84464 password=84464 profile=3k
add comment=vc-487-09.05.26- name=68793 password=68793 profile=3k
add comment=vc-487-09.05.26- name=58696 password=58696 profile=3k
add comment=vc-487-09.05.26- name=39778 password=39778 profile=3k
add comment=vc-487-09.05.26- name=45223 password=45223 profile=3k
add comment=vc-487-09.05.26- name=25546 password=25546 profile=3k
add comment=vc-487-09.05.26- name=55697 password=55697 profile=3k
add comment=vc-487-09.05.26- name=84447 password=84447 profile=3k
add comment=vc-487-09.05.26- name=58835 password=58835 profile=3k
add comment=vc-487-09.05.26- name=25388 password=25388 profile=3k
add comment=vc-487-09.05.26- name=89479 password=89479 profile=3k
add comment=vc-487-09.05.26- name=49892 password=49892 profile=3k
add comment=vc-487-09.05.26- name=47852 password=47852 profile=3k
add comment=vc-487-09.05.26- name=64245 password=64245 profile=3k
add comment=vc-487-09.05.26- name=82642 password=82642 profile=3k
add comment=vc-487-09.05.26- name=33362 password=33362 profile=3k
add comment=vc-487-09.05.26- name=27573 password=27573 profile=3k
add comment=vc-487-09.05.26- name=87954 password=87954 profile=3k
add comment=vc-487-09.05.26- name=73558 password=73558 profile=3k
add comment=vc-487-09.05.26- name=83843 password=83843 profile=3k
add comment=vc-487-09.05.26- name=43859 password=43859 profile=3k
add comment=vc-487-09.05.26- name=99737 password=99737 profile=3k
add comment=vc-487-09.05.26- name=94942 password=94942 profile=3k
add comment=vc-487-09.05.26- name=76627 password=76627 profile=3k
add comment=vc-487-09.05.26- name=75452 password=75452 profile=3k
add comment=vc-487-09.05.26- name=37326 password=37326 profile=3k
add comment=vc-487-09.05.26- name=94924 password=94924 profile=3k
add comment=vc-487-09.05.26- name=79338 password=79338 profile=3k
add comment=vc-487-09.05.26- name=66535 password=66535 profile=3k
add comment=vc-487-09.05.26- name=36339 password=36339 profile=3k
add comment=vc-487-09.05.26- name=58722 password=58722 profile=3k
add comment=vc-487-09.05.26- name=73872 password=73872 profile=3k
add comment=vc-487-09.05.26- name=59323 password=59323 profile=3k
add comment=vc-487-09.05.26- name=72923 password=72923 profile=3k
add comment=vc-487-09.05.26- name=23457 password=23457 profile=3k
add comment=vc-487-09.05.26- name=55423 password=55423 profile=3k
add comment=vc-487-09.05.26- name=75672 password=75672 profile=3k
add comment=vc-487-09.05.26- name=72442 password=72442 profile=3k
add comment=vc-487-09.05.26- name=72884 password=72884 profile=3k
add comment=vc-487-09.05.26- name=44267 password=44267 profile=3k
add comment=vc-487-09.05.26- name=85463 password=85463 profile=3k
add comment=vc-487-09.05.26- name=32753 password=32753 profile=3k
add comment=vc-487-09.05.26- name=44566 password=44566 profile=3k
add comment=vc-487-09.05.26- name=98442 password=98442 profile=3k
add comment=vc-487-09.05.26- name=68588 password=68588 profile=3k
add comment=vc-487-09.05.26- name=82887 password=82887 profile=3k
add comment=vc-487-09.05.26- name=77267 password=77267 profile=3k
add comment=vc-487-09.05.26- name=88559 password=88559 profile=3k
add comment=vc-487-09.05.26- name=57699 password=57699 profile=3k
add comment=vc-487-09.05.26- name=53888 password=53888 profile=3k
add comment=vc-487-09.05.26- name=99393 password=99393 profile=3k
add comment=vc-487-09.05.26- name=49298 password=49298 profile=3k
add comment=vc-487-09.05.26- name=77788 password=77788 profile=3k
add comment=vc-487-09.05.26- name=78865 password=78865 profile=3k
add comment=vc-487-09.05.26- name=53264 password=53264 profile=3k
add comment=vc-487-09.05.26- name=77546 password=77546 profile=3k
add comment=vc-487-09.05.26- name=67653 password=67653 profile=3k
add comment=vc-487-09.05.26- name=33379 password=33379 profile=3k
add comment=vc-487-09.05.26- name=44387 password=44387 profile=3k
add comment=vc-487-09.05.26- name=49936 password=49936 profile=3k
add comment=vc-487-09.05.26- name=63482 password=63482 profile=3k
add comment=vc-487-09.05.26- name=97328 password=97328 profile=3k
add comment=vc-487-09.05.26- name=45428 password=45428 profile=3k
add comment=vc-487-09.05.26- name=79226 password=79226 profile=3k
add comment=vc-487-09.05.26- name=87377 password=87377 profile=3k
add comment=vc-487-09.05.26- name=44598 password=44598 profile=3k
add comment=vc-487-09.05.26- name=68569 password=68569 profile=3k
add comment=vc-487-09.05.26- name=84389 password=84389 profile=3k
add comment=vc-487-09.05.26- name=82924 password=82924 profile=3k
add comment=vc-487-09.05.26- name=87733 password=87733 profile=3k
add comment=vc-487-09.05.26- name=92449 password=92449 profile=3k
add comment=vc-487-09.05.26- name=95848 password=95848 profile=3k
add comment=vc-487-09.05.26- name=66965 password=66965 profile=3k
add comment=vc-487-09.05.26- name=77434 password=77434 profile=3k
add comment=vc-487-09.05.26- name=64778 password=64778 profile=3k
add comment=vc-487-09.05.26- name=92236 password=92236 profile=3k
add comment=vc-487-09.05.26- name=64862 password=64862 profile=3k
add comment=vc-487-09.05.26- name=59456 password=59456 profile=3k
add comment=vc-487-09.05.26- name=53467 password=53467 profile=3k
add comment=vc-487-09.05.26- name=56749 password=56749 profile=3k
add comment=vc-487-09.05.26- name=96268 password=96268 profile=3k
add comment=vc-487-09.05.26- name=46256 password=46256 profile=3k
add comment=vc-487-09.05.26- name=59246 password=59246 profile=3k
add comment=vc-487-09.05.26- name=27865 password=27865 profile=3k
add comment=vc-487-09.05.26- name=34386 password=34386 profile=3k
add comment=vc-487-09.05.26- name=28495 password=28495 profile=3k
add comment=vc-487-09.05.26- name=23725 password=23725 profile=3k
add comment=vc-487-09.05.26- name=57359 password=57359 profile=3k
add comment=vc-487-09.05.26- name=49789 password=49789 profile=3k
add comment=vc-487-09.05.26- name=79829 password=79829 profile=3k
add comment=vc-487-09.05.26- name=79995 password=79995 profile=3k
add comment=vc-487-09.05.26- name=53829 password=53829 profile=3k
add comment=vc-487-09.05.26- name=84499 password=84499 profile=3k
add comment=vc-487-09.05.26- name=95389 password=95389 profile=3k
add comment=vc-487-09.05.26- name=92695 password=92695 profile=3k
add comment=vc-487-09.05.26- name=58583 password=58583 profile=3k
add comment=vc-487-09.05.26- name=88462 password=88462 profile=3k
add comment=vc-487-09.05.26- name=94955 password=94955 profile=3k
add comment=vc-487-09.05.26- name=57657 password=57657 profile=3k
add comment=vc-487-09.05.26- name=32394 password=32394 profile=3k
add comment=vc-487-09.05.26- name=85535 password=85535 profile=3k
add comment=vc-487-09.05.26- name=53965 password=53965 profile=3k
add comment=vc-487-09.05.26- name=54789 password=54789 profile=3k
add comment=vc-487-09.05.26- name=76236 password=76236 profile=3k
add comment=vc-487-09.05.26- name=49666 password=49666 profile=3k
add comment=vc-487-09.05.26- name=93956 password=93956 profile=3k
add comment=vc-487-09.05.26- name=74267 password=74267 profile=3k
add comment=vc-487-09.05.26- name=42885 password=42885 profile=3k
add comment=vc-487-09.05.26- name=63939 password=63939 profile=3k
add comment=vc-487-09.05.26- name=92223 password=92223 profile=3k
add comment=vc-487-09.05.26- name=44276 password=44276 profile=3k
add comment=vc-487-09.05.26- name=39385 password=39385 profile=3k
add comment=vc-487-09.05.26- name=49693 password=49693 profile=3k
add comment=vc-487-09.05.26- name=34225 password=34225 profile=3k
add comment=vc-487-09.05.26- name=64722 password=64722 profile=3k
add comment=vc-487-09.05.26- name=88429 password=88429 profile=3k
add comment=vc-487-09.05.26- name=56385 password=56385 profile=3k
add comment=vc-487-09.05.26- name=95865 password=95865 profile=3k
add comment=vc-487-09.05.26- name=67854 password=67854 profile=3k
add comment=vc-487-09.05.26- name=22742 password=22742 profile=3k
add comment=vc-487-09.05.26- name=94287 password=94287 profile=3k
add comment=vc-487-09.05.26- name=97447 password=97447 profile=3k
add comment=vc-487-09.05.26- name=43566 password=43566 profile=3k
add comment=vc-487-09.05.26- name=52829 password=52829 profile=3k
add comment=vc-487-09.05.26- name=56264 password=56264 profile=3k
add comment=vc-487-09.05.26- name=73494 password=73494 profile=3k
add comment=vc-487-09.05.26- name=94775 password=94775 profile=3k
add comment=vc-487-09.05.26- name=48574 password=48574 profile=3k
add comment=vc-487-09.05.26- name=26599 password=26599 profile=3k
add comment=vc-487-09.05.26- name=63865 password=63865 profile=3k
add comment=vc-487-09.05.26- name=46672 password=46672 profile=3k
add comment=vc-487-09.05.26- name=99329 password=99329 profile=3k
add comment=vc-487-09.05.26- name=49945 password=49945 profile=3k
add comment=vc-487-09.05.26- name=88225 password=88225 profile=3k
add comment=vc-487-09.05.26- name=52482 password=52482 profile=3k
add comment=vc-487-09.05.26- name=35252 password=35252 profile=3k
add comment=vc-487-09.05.26- name=94673 password=94673 profile=3k
add comment=vc-487-09.05.26- name=82746 password=82746 profile=3k
add comment=vc-487-09.05.26- name=24887 password=24887 profile=3k
add comment=vc-487-09.05.26- name=43796 password=43796 profile=3k
add comment=vc-487-09.05.26- name=52273 password=52273 profile=3k
add comment=vc-487-09.05.26- name=75234 password=75234 profile=3k
add comment=vc-487-09.05.26- name=44726 password=44726 profile=3k
add comment=vc-487-09.05.26- name=78657 password=78657 profile=3k
add comment=vc-487-09.05.26- name=88975 password=88975 profile=3k
add comment=vc-487-09.05.26- name=96738 password=96738 profile=3k
add comment=vc-487-09.05.26- name=84524 password=84524 profile=3k
add comment=vc-487-09.05.26- name=32748 password=32748 profile=3k
add comment=vc-487-09.05.26- name=55778 password=55778 profile=3k
add comment=vc-487-09.05.26- name=93372 password=93372 profile=3k
add comment=vc-487-09.05.26- name=46326 password=46326 profile=3k
add comment=vc-487-09.05.26- name=84749 password=84749 profile=3k
add comment=vc-487-09.05.26- name=95224 password=95224 profile=3k
add comment=vc-487-09.05.26- name=27225 password=27225 profile=3k
add comment=vc-487-09.05.26- name=75874 password=75874 profile=3k
add comment=vc-487-09.05.26- name=82238 password=82238 profile=3k
add comment=vc-487-09.05.26- name=42365 password=42365 profile=3k
add comment=vc-487-09.05.26- name=42988 password=42988 profile=3k
add comment=vc-487-09.05.26- name=94347 password=94347 profile=3k
add comment=vc-487-09.05.26- name=43254 password=43254 profile=3k
add comment=vc-487-09.05.26- name=68672 password=68672 profile=3k
add comment="sep/15/2026 13:57:33" name=38997 password=38997 profile=3k
add comment=vc-487-09.05.26- name=56663 password=56663 profile=3k
add comment=vc-487-09.05.26- name=85944 password=85944 profile=3k
add comment=vc-487-09.05.26- name=92492 password=92492 profile=3k
add comment=vc-487-09.05.26- name=43295 password=43295 profile=3k
add comment=vc-487-09.05.26- name=54472 password=54472 profile=3k
add comment=vc-487-09.05.26- name=23348 password=23348 profile=3k
add comment=vc-487-09.05.26- name=68339 password=68339 profile=3k
add comment=vc-487-09.05.26- name=66384 password=66384 profile=3k
add comment=vc-487-09.05.26- name=89928 password=89928 profile=3k
add comment=vc-487-09.05.26- name=95632 password=95632 profile=3k
add comment=vc-487-09.05.26- name=72333 password=72333 profile=3k
add comment=vc-487-09.05.26- name=64575 password=64575 profile=3k
add comment=vc-487-09.05.26- name=96388 password=96388 profile=3k
add comment=vc-487-09.05.26- name=53439 password=53439 profile=3k
add comment=vc-487-09.05.26- name=25772 password=25772 profile=3k
add comment=vc-487-09.05.26- name=26524 password=26524 profile=3k
add comment=vc-487-09.05.26- name=88622 password=88622 profile=3k
add comment=vc-487-09.05.26- name=66973 password=66973 profile=3k
add comment=vc-487-09.05.26- name=54739 password=54739 profile=3k
add comment=vc-487-09.05.26- name=93685 password=93685 profile=3k
add comment=vc-487-09.05.26- name=86738 password=86738 profile=3k
add comment=vc-487-09.05.26- name=22367 password=22367 profile=3k
add comment=vc-487-09.05.26- name=93275 password=93275 profile=3k
add comment=vc-487-09.05.26- name=27695 password=27695 profile=3k
add comment=vc-487-09.05.26- name=64842 password=64842 profile=3k
add comment=vc-487-09.05.26- name=85354 password=85354 profile=3k
add comment=vc-487-09.05.26- name=97379 password=97379 profile=3k
add comment=vc-487-09.05.26- name=49965 password=49965 profile=3k
add comment=vc-487-09.05.26- name=53635 password=53635 profile=3k
add comment=vc-487-09.05.26- name=22675 password=22675 profile=3k
add comment=vc-487-09.05.26- name=65692 password=65692 profile=3k
add comment=vc-487-09.05.26- name=89894 password=89894 profile=3k
add comment=vc-487-09.05.26- name=53988 password=53988 profile=3k
add comment=vc-487-09.05.26- name=42574 password=42574 profile=3k
add comment=vc-487-09.05.26- name=64976 password=64976 profile=3k
add comment=vc-487-09.05.26- name=42974 password=42974 profile=3k
add comment=vc-487-09.05.26- name=77682 password=77682 profile=3k
add comment=vc-487-09.05.26- name=92878 password=92878 profile=3k
add comment=vc-487-09.05.26- name=96839 password=96839 profile=3k
add comment=vc-487-09.05.26- name=43485 password=43485 profile=3k
add comment=vc-487-09.05.26- name=86786 password=86786 profile=3k
add comment="vc 5 06/09/2026" name=5 password=5 profile=5k
add comment="vc 3 06/09/2026" name=3 password=3 profile=3k
add comment="vc 6 07/09/2026" name=6 password=6 profile=3k
add comment="vc 65 07/09/2026" name=65 password=65 profile=5k
add comment=vc-admin-12.09.26 limit-uptime=1d name=592540 password=592540 \
    profile=3k
add comment=vc-admin-12.09.26 limit-uptime=1d name=383132 password=383132 \
    profile=3k
add comment=vc-admin-12.09.26 limit-uptime=1d name=653713 password=653713 \
    profile=3k
/ip hotspot walled-garden
add dst-port=7777
add comment="place hotspot rules here" disabled=yes
add dst-host=app.alijaya.com/customer/voucher
add comment=expire-rule dst-host=isolir.alijaya.net
add comment=expire-rule dst-host=isolir.alijaya.net
add dst-host=intergram.xyz
add dst-host=app.alijaya.com
/ip hotspot walled-garden ip
add action=accept comment="Mikhmon QR Code Scanner" disabled=no dst-host=\
    laksa19.github.io
add action=accept comment=Integram disabled=no !dst-address !dst-address-list \
    dst-host=intergram.xyz !dst-port !protocol !src-address !src-address-list
add action=accept comment="Mikhmon QR Code Scanner" disabled=no dst-host=\
    laksa19.github.io
add action=accept comment=telegram disabled=no !dst-address !dst-address-list \
    dst-host=api.telegram.org !dst-port !protocol !src-address \
    !src-address-list
add action=accept comment="Live chat telegram" disabled=no dst-host=\
    intergram.xyz
add action=accept comment="Api Telegram Contact Form" disabled=no dst-host=\
    api.telegram.org
add action=accept comment="Mikhmon QR Code Scanner" disabled=no dst-host=\
    laksa19.github.io
add action=accept comment=expire-rule disabled=no dst-port=7777 protocol=tcp
add action=accept comment=expire-rule disabled=no dst-host=isolir.alijaya.net
add action=accept comment=expire-rule disabled=no dst-host=isolir.alijaya.net
add action=accept comment=Mikpos disabled=no dst-host=mikpos.space
add action=accept comment=Mikpos disabled=no dst-host=tripay.co.id
/ip proxy
set cache-administrator=BEATCOM max-cache-size=none port=7777
/ip proxy access
add comment="Isolir Bybeatcom" disabled=yes dst-port=7777 src-address=\
    192.168.10.0/24
add action=deny comment="Isolir Bybeatcom" disabled=yes dst-host=\
    !wifiku.web.id dst-port=80 redirect-to=wifiku.web.id/#/isolir/2867 \
    src-address=192.168.10.0/24
add action=deny disabled=yes
add action=deny comment=expire-rule redirect-to=\
    isolir.alijaya.net/blokir/index.html

/routing table
add disabled=no fib name=isolir
/ip route
add comment="DEFAULT ISP GATEWAY" distance=1 dst-address=0.0.0.0/0 gateway=103.175.238.125 routing-table=main
add comment="ISOLIR BLACKHOLE ROUTE" distance=1 dst-address=0.0.0.0/0 type=blackhole routing-table=isolir
/ip route rule
add src-address=192.168.205.0/24 table=isolir
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api port=8711
set api-ssl disabled=yes
/ppp aaa
set interim-update=1m use-radius=yes
/ppp secret
add name=andi password=andi profile=BRONZE service=pppoe
add comment="ACTIVE - Package changed" name=atam password=atam profile=SILVER \
    service=pppoe
add name=bunga password=bunga profile=BRONZE service=pppoe
add name=codet password=codet profile=BRONZE service=pppoe
add name=dadang@genjong password=dadang@genjong profile=BRONZE service=pppoe
add comment="ACTIVE - Package changed" local-address=192.168.10.1 name=darim \
    password=darim profile=SILVER remote-address=192.168.10.5 service=pppoe
add name=erul password=erul profile=2MB service=pppoe
add name=eva password=eva profile="2M upto 3M" service=pppoe
add name=fajar password=fajar profile=BRONZE service=pppoe
add name=kincling password=kincling profile=BRONZE service=pppoe
add name=maktub password=maktub profile=BRONZE service=pppoe
add name=mardi password=mardi profile=BRONZE service=pppoe
add comment="ACTIVE - Package changed" name=murba password=murba profile=\
    SILVER service=pppoe
add name=nadiva password=nadiva profile=BRONZE service=pppoe
add name=nalda@rawagunda2 password=nalda@rawagunda2 profile=SILVER service=\
    pppoe
add name=nana password=nana profile=BRONZE service=pppoe
add name=nurudin password=3600 profile=BRONZE service=pppoe
add comment="ACTIVE - tempo" name=rasta password=rasta profile=silver \
    service=pppoe
add comment="ACTIVE - Package changed" name=wendy@tanjungpura password=\
    wendy@tanjungpura profile=BRONZE service=pppoe
add name=runaeni password=runaeni profile="2M upto 3M" service=pppoe
add name=salsa password=salsa profile=3m service=pppoe
add name=aqiel password=aqiel profile=BRONZE service=pppoe
add name=seka password=seka profile=BRONZE service=pppoe
add name=toax password=toax profile=BRONZE service=pppoe
add name=warsana password=warsana profile=BRONZE service=pppoe
add name=wiwin@seblak password=wiwin@seblak profile=BRONZE service=pppoe
add name=yogi password=yogi profile=BRONZE service=pppoe
add name=talita password=talita profile=bronze service=pppoe
add name=elvano1 password=elvano1 profile=BRONZE service=pppoe
add name=wendy@genjong password=wendy@genjong profile=5m service=pppoe
add name=indah@tanjungpura password=indah@tanjungpura profile=BRONZE service=\
    pppoe
add name=dhea_tile@rawagunda password=dhea_tile@rawagunda profile=\
    "2M upto 3M" service=pppoe
add name=antony@ps password=antony@ps profile=5MB service=pppoe
add name=suminih@rawagunda password=suminih@rawagunda profile="2M upto 3M" \
    service=pppoe
add name=karmanda password=karmanda profile=BRONZE service=pppoe
add name=Endra@genjong1 password=Endra@genjong1 profile="2M upto 3M" service=\
    pppoe
add name=durniyah@pegagan password=durniyah@pegagan profile=BRONZE service=\
    pppoe
add name=tarci password=tarci profile=bronze service=pppoe
add comment="ACTIVE - Package changed" name=waidah@pegagan password=\
    waidah@pegagan profile=SILVER service=pppoe
add name=sang password=sang profile=BRONZE service=pppoe
add name=sarna@pegagan password=sarna@pegagan profile=BRONZE service=pppoe
add name=icha password=icha profile=bronze service=pppoe
add name=nina@kesin password=nina@kesin profile=BEATISOLIR service=pppoe
add comment="ACTIVE - Package changed" name=karban password=karban profile=\
    SILVER service=pppoe
add name=kasmuri password=kasmuri profile=BRONZE service=pppoe
add name=eryanto@pegagan password=eryanto@pegagan profile=BRONZE service=\
    pppoe
add name=kendo@tanjungpura password=kendo@tanjungpura profile=BRONZE service=\
    pppoe
add name=yuni@rawagunda password=yuni@rawagunda profile=BRONZE service=pppoe
add name=hany@tarsiti password=hany@tarsiti profile=BRONZE service=pppoe
add name=murdani password=murdani profile=BRONZE service=pppoe
add name=pandi@tanjungpura password=pandi@tanjungpura profile=BRONZE service=\
    pppoe
add name=tariman password=tariman profile=BRONZE service=pppoe
add name=soleh@pegagan password=soleh@pegagan profile=BRONZE service=pppoe
add local-address=192.168.10.1 name=darim@lor password=darim@lor profile=\
    BRONZE remote-address=192.168.10.4 service=pppoe
add name=jami@sut password=jami@sut profile=bronze service=pppoe
add name=eva@pegagan password=eva@pegagan profile=BRONZE service=pppoe
add name=coyih password=coyih profile=BRONZE service=pppoe
add name=sudini@pegagan password=sudini@pegagan profile=BRONZE service=pppoe
add name=RT-KARONI password=RT-KARONI profile=bronze service=pppoe
add local-address=192.168.10.1 name=memble@ password=memble@ profile=BRONZE \
    remote-address=192.168.10.9 service=pppoe
add local-address=192.168.10.1 name=memble2 password=memble2 profile=\
    "2M upto 3M" remote-address=192.168.10.11 service=pppoe
add name=iman@ password=iman@ profile=BRONZE service=pppoe
add name=yusuf password=yusuf profile=BRONZE service=pppoe
add name=surminih@pegagan password=surminih@pegagan profile=BRONZE service=\
    pppoe
add name=kurnati password=kurnati profile=BRONZE service=pppoe
add name=setiyadi@genjong password=setiyadi@genjong profile=3MB service=pppoe
add name=sutara@pegagan password=sutara@pegagan profile=BRONZE service=pppoe
add name=opang@tanjungpura password=opang@tanjungpura profile=5Mb service=\
    pppoe
add name=mastobari@ password=mastobari@ profile=3MB service=pppoe
add name=walong@asep password=walong@asep profile="2M upto 3M" service=pppoe
add name=nuriyah password=nuriyah profile="2M upto 3M" service=pppoe
add name=astri@pegagan password=astri@pegagan profile=BRONZE service=pppoe
add name=mangasep@janggar password=mangasep@janggar profile=BRONZE service=\
    pppoe
add name=luwih@ password=luwih@ profile=BRONZE service=pppoe
add local-address=192.168.10.1 name=nalda@pegagan password=nalda@pegagan \
    profile="2M upto 3M" remote-address=192.168.10.3 service=pppoe
add name=elis@rawagunda password=elis@rawagunda profile=BRONZE service=pppoe
add name=sanyo password=sanyo profile=3m service=pppoe
add name=raeni password=raeni profile=BRONZE service=pppoe
add name=uung@pegagan password=uung@pegagan profile=BRONZE service=pppoe
add name=wakeng password=wakeng profile=isolir service=pppoe
add name=sandi@rajan password=sandi@rajan profile=BRONZE service=pppoe
add local-address=192.168.10.1 name=anwar@janggar password=anwar@janggar \
    profile=BRONZE remote-address=192.168.10.12 service=pppoe
add name=umikulsum@janggar password=umikulsum@janggar profile=BRONZE service=\
    pppoe
add name=rom@lah password=rom@lah profile=bronze service=pppoe
add name=gadel password=gadel profile=BRONZE service=pppoe
add name=karsih password=karsih profile=BRONZE service=pppoe
add name=abibah password=abibah profile=2m service=pppoe
add name=warungyuni@laut password=warungyuni@laut profile=5MB service=pppoe
add name=SDNUG1 password=SDNUG1 profile=5MB service=pppoe
add name=brohim password=brohim profile=BRONZE service=pppoe
add name=lisan@banteng password=lisan@banteng profile=BRONZE service=pppoe
add name=leha password=leha profile=BRONZE service=pppoe
add name=tibil password=tibil profile=BRONZE service=pppoe
add name=winata password=winata profile="2M upto 3M" service=pppoe
add name=winata@laut password=winata@laut profile="2M upto 3M" service=pppoe
add name=gunawan password=gunawan profile=BRONZE service=pppoe
add name=sarwan password=sarwan profile=BRONZE service=pppoe
add name=suliwa password=suliwa profile=BRONZE service=pppoe
add name=novita password=novita profile="2M upto 3M" service=pppoe
add name=aang2 password=aang2 profile=BEATISOLIR service=pppoe
add name=gemblung password=gemblung profile=BRONZE service=pppoe
add name=linah@ujungmulya password=linah@ujungmulya profile=BRONZE service=\
    pppoe
add name=dasta password=dasta profile=BRONZE service=pppoe
add name=nani password=nani profile=BRONZE service=pppoe
add name=toyinah password=toyinah profile=BRONZE service=pppoe
add name=lussy password=lussy profile=isolir service=pppoe
add name=junanto@rawagunda password=junanto@rawagunda profile=3m service=\
    pppoe
add comment="ACTIVE - Restore layanan (manual WA)" name=santo password=santo \
    profile=BRONZE service=pppoe
add name=handoko password=handoko profile=bronze service=pppoe
add name=nesa password=nesa profile=blokir service=pppoe
add name=dedy@sarkim password=dedy@sarkim profile=2m service=pppoe
add name=khofik@janggar password=khofik@janggar profile=4m service=pppoe
add name=muktar@ompong password=muktar@ompong profile=BRONZE service=pppoe
add name=kus password=kus profile=5MB service=pppoe
add name=h.juroh password=h.juroh profile=BRONZE service=pppoe
add name=Tarci@lor password=Tarci@lor profile=BRONZE service=pppoe
add name=windah password=windah profile=3MB service=pppoe
add name=kandar password=kandar profile=2m service=pppoe
add name=yudi password=yudi profile=isolir service=pppoe
add name=dedi@aira password=dedi@aira profile=3m service=pppoe
add name=toko@sayur password=toko@sayur profile=BRONZE service=pppoe
add name=aldo password=aldo profile=BRONZE service=pppoe
add name=eka password=eka profile=BRONZE service=pppoe
add name=turidah password=turidah profile=BRONZE service=pppoe
add comment="ACTIVE - Package changed" name=pabudi@genjong password=\
    pabudi@genjong profile=10M service=pppoe
add name=kama@ password=kama@ profile=BRONZE service=pppoe
add name=adiiman password=adiiman profile=3m service=pppoe
add comment="ACTIVE - Package changed" name=server@yayan password=\
    server@yayan profile=5MB service=pppoe
add comment="SUSPENDED - Telat bayar" name=test password=test profile=ISOLIR \
    service=pppoe
add name=yohan@rawagunda password=yohan@rawagunda profile=BRONZE service=\
    pppoe
add name=opang@pegagan password=opang@pegagan profile=SILVER service=pppoe
add name=durta password=durta profile=3m service=pppoe
add name=newok password=newok profile=3MB service=pppoe
add name=sarjo password=sarjo profile=3MB service=pppoe
add comment="ACTIVE - Package changed" name=adineasep password=adineasep \
    profile=BRONZE service=pppoe
add name=juanda password=juanda profile=3m service=pppoe
add name=indra@plentong password=indra@plentong profile=bronze service=pppoe
add name=dayuni password=dayuni profile=bronze service=pppoe
add name=darmini password=darmini profile=BRONZE service=pppoe
add name=waran password=waran profile=BRONZE service=pppoe
add name=Zea password=Zea profile=5m service=pppoe
add name=cecep password=cecep profile=1MB service=pppoe
add name=wardi password=wardi profile=1m service=pppoe
add name=yuyun password=yuyun profile=bronze service=pppoe
add name=wiranto password=wiranto profile=3m service=pppoe
add name=tinih_toko password=tinih_toko profile=5MB service=pppoe
add name=rudi_ password=rudi_ profile=BRONZE service=pppoe
add name=yudi@rawagunda password=yudi@rawagunda profile=3m service=pppoe
add name=alfa password=alfa profile=3m service=pppoe
add local-address=192.168.10.1 name=tino password=tino profile=3m \
    remote-address=192.168.10.8 service=pppoe
add name=fitri@sukinih password=fitri@sukinih profile=BRONZE service=pppoe
add name=kevin password=kevin profile=bronze service=pppoe
add name=sosis@janggar password=sosis@janggar profile=blokir service=pppoe
add name=juniah password=juniah profile=BEATISOLIR service=pppoe
add name=mail password=mail profile=BRONZE service=pppoe
add name=codet2 password=codet2 profile=2MB service=pppoe
add name=denggol password=denggol profile=5m service=pppoe
add name=server2 password=server2 profile="2M upto 3M" service=pppoe
add name=oland password=oland profile=BEATISOLIR service=pppoe
add name=denggol2 password=denggol2 profile=SILVER service=pppoe
add name=robet password=robet profile=5m service=pppoe
add name=warsinah password=warsinah profile=bronze service=pppoe
add name=damar password=damar profile=bronze service=pppoe
add name=sobirin password=sobirin profile=BRONZE service=pppoe
add name=indri@ujungmulya password=indri@ujungmulya profile=3m service=pppoe
add local-address=192.168.10.1 name=kanol@tjp password=kanol@tjp profile=\
    ISOLIR remote-address=192.168.10.13 service=pppoe
add name=fhergunawan@genjong password=fhergunawan@genjong profile=isolir \
    service=pppoe
add name=robert@warunglaut password=robert@warunglaut profile=3m service=\
    pppoe
add name=kasdi@rawagunda password=kasdi@rawagunda profile=SILVER service=\
    pppoe
add name=rasta@empang password=rasta@empang profile="2M upto 3M" service=\
    pppoe
add name=denihamdani@pegagan password=denihamdani@pegagan profile=BEATISOLIR \
    service=pppoe
add name=server@naela password=server@naela profile=2m service=pppoe
add name=sofyan@genjong password=sofyan@genjong profile=4m service=pppoe
add name=rangdu password=rangdu profile=bronze service=pppoe
add name=anitarsiti@ password=anitarsiti@ profile=3m service=pppoe
add name=nalda password=nalda profile=3m service=pppoe
add name=gina@genjong password=gina@genjong profile=3m service=pppoe
add name=kedai_hd@pegagan password=kedai_hd@pegagan profile=4m service=pppoe
add name=jarwo@ujungmulya password=jarwo@ujungmulya profile=bronze service=\
    pppoe
add name=kanu password=kanu profile=bronze service=pppoe
add name=diva password=diva profile=3m service=pppoe
add name=agus password=agus profile=isolir service=pppoe
add name=ajri password=ajri profile=bronze service=pppoe
add name=aang password=aang profile=BRONZE service=pppoe
add name=server@ilik password=server@ilik profile=1MB service=pppoe
add name=serveroki password=serveroki profile=1MB service=pppoe
add name=server_umi password=server_umi profile=1MB service=pppoe
add name=server@arep password=server@arep profile=10M service=pppoe
add name=ooh password=ooh profile=blokir service=pppoe
add name=tinih password=tinih profile=5MB service=pppoe
add name=darsono password=darsono profile=bronze service=pppoe
add name=koriyah password=koriyah profile=ISOLIR service=pppoe
add name=ejun password=ejun profile=bronze service=pppoe
add name=sumi password=sumi profile=blokir service=pppoe
add name=nyamung password=nyamung profile=bronze service=pppoe
add name=erni password=erni profile=bronze service=pppoe
add name=server password=server profile=10M service=pppoe
add name=ujungmulya password=ujungmulya profile=3m service=pppoe
add name=karbani password=karbani profile=3m service=pppoe
add name=intan@ujungmulya password=intan@ujungmulya profile=blokir service=\
    pppoe
add name=ety@pegagan password=ety@pegagan profile=blokir service=pppoe
/radius
add address=192.168.8.8 disabled=yes secret=secret123 service=ppp timeout=3s
add address=192.168.8.5 disabled=yes secret=secret123 service=ppp timeout=3s
add address=192.168.8.8 comment=RTRW-Billing-RADIUS disabled=yes secret=\
    secret123 service=ppp timeout=3s
/radius incoming
set accept=yes
/snmp
set enabled=yes
/system clock
set time-zone-autodetect=no
/system clock manual
set time-zone=+07:00
/system identity
set name=ALIJAYA-NET
/system logging
add action=disk prefix=-> topics=hotspot,info,debug
add topics=radius
add topics=radius,debug
/system ntp client
set enabled=yes servers=103.104.28.105,176.235.250.150
/system scheduler
add interval=4w2d name=gesex69 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/12/2026 start-time=09:46:23
add comment="Monitor Profile 3k" interval=2m57s name=3k on-event=":local datei\
    nt do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\"\
    ,\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \$d\
    \_4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:loc\
    al monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1);\
    :if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$year\
    \$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\")]\
    ;}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes [ \
    :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /sy\
    stem clock get date ]; :local time [ /system clock get time ]; :local toda\
    y [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach i \
    in [ /ip hotspot user find where profile=\"3k\" ] do={ :local comment [ /i\
    p hotspot user get \$i comment]; :local name [ /ip hotspot user get \$i na\
    me]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\
    \" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comment]\
    \_; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$exp\
    t < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd = \
    \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /\
    ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:37:35
add comment="Monitor Profile 5k" interval=2m12s name=5k on-event=":local datei\
    nt do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\"\
    ,\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \$d\
    \_4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:loc\
    al monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1);\
    :if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$year\
    \$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\")]\
    ;}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes [ \
    :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /sy\
    stem clock get date ]; :local time [ /system clock get time ]; :local toda\
    y [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach i \
    in [ /ip hotspot user find where profile=\"5k\" ] do={ :local comment [ /i\
    p hotspot user get \$i comment]; :local name [ /ip hotspot user get \$i na\
    me]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\
    \" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comment]\
    \_; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$exp\
    t < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd = \
    \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /\
    ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:38:37
add comment="Monitor Profile 10k" interval=2m21s name=10k on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"10k\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:55:58
add comment="Monitor Profile 15k" interval=2m13s name=15k on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"15k\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=04:31:48
add comment="Monitor Profile 25k" interval=2m42s name=25k on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"25k\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:34:30
add comment="Monitor Profile 50k" interval=2m39s name=50k on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"50k\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:54:53
add comment="Monitor Profile diskon" interval=2m58s name=diskon on-event=":loc\
    al dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\"\
    ,\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :\
    pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11\
    \_];:local monthint ([ :find \$montharray \$month]);:local month (\$monthi\
    nt + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\
    \"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$\
    days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local mi\
    nutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local da\
    te [ /system clock get date ]; :local time [ /system clock get time ]; :lo\
    cal today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :fo\
    reach i in [ /ip hotspot user find where profile=\"diskon\" ] do={ :local \
    comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot use\
    r get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comme\
    nt 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d\
    =\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today\
    \_and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or \
    (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \
    \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=02:10:39
add comment="Monitor Profile erik-3k" interval=2m29s name=erik-3k on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"erik-3k\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=02:44:38
add comment="Monitor Profile erik-5k" interval=2m57s name=erik-5k on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"erik-5k\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:22:23
add comment="Monitor Profile erik-10k" interval=2m21s name=erik-10k on-event="\
    :local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"m\
    ay\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days\
    \_[ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d\
    \_7 11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$m\
    onthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:to\
    num (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mo\
    nth\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :loc\
    al minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loc\
    al date [ /system clock get date ]; :local time [ /system clock get time ]\
    ; :local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"erik-10k\" ] do={ \
    :local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hots\
    pot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:37:42
add comment="Monitor Profile umi-3k" interval=2m25s name=umi-3k on-event=":loc\
    al dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\"\
    ,\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :\
    pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11\
    \_];:local monthint ([ :find \$montharray \$month]);:local month (\$monthi\
    nt + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\
    \"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$\
    days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local mi\
    nutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local da\
    te [ /system clock get date ]; :local time [ /system clock get time ]; :lo\
    cal today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :fo\
    reach i in [ /ip hotspot user find where profile=\"umi-3k\" ] do={ :local \
    comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot use\
    r get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comme\
    nt 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d\
    =\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today\
    \_and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or \
    (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \
    \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=02:57:19
add comment="Monitor Profile dhea-3k" interval=2m51s name=dhea-3k on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"dhea-3k\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:23:52
add comment="Monitor Profile codet-3k" interval=2m51s name=codet-3k on-event="\
    :local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"m\
    ay\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days\
    \_[ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d\
    \_7 11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$m\
    onthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:to\
    num (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mo\
    nth\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :loc\
    al minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loc\
    al date [ /system clock get date ]; :local time [ /system clock get time ]\
    ; :local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"codet-3k\" ] do={ \
    :local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hots\
    pot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=02:53:15
add comment="Monitor Profile 2hp" interval=2m57s name=2hp on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"2hp\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:38:55
add comment="Monitor Profile 4hp" interval=2m22s name=4hp on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"4hp\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:46:47
add comment="Monitor Profile dafa-3k" interval=2m27s name=dafa-3k on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"dafa-3k\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:20:39
add comment="Monitor Profile dona-3k" interval=2m25s name=dona-3k on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"dona-3k\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=02:25:55
add comment="Monitor Profile v15" interval=2m48s name=v15 on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"v15\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=04:55:42
add comment="Monitor Profile v25" interval=2m49s name=v25 on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"v25\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:27:24
add comment="Monitor Profile v50" interval=2m58s name=v50 on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"v50\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=05:33:50
add comment="Monitor Profile v3-umi" interval=2m29s name=v3-umi on-event=":loc\
    al dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\"\
    ,\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :\
    pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11\
    \_];:local monthint ([ :find \$montharray \$month]);:local month (\$monthi\
    nt + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\
    \"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$\
    days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local mi\
    nutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local da\
    te [ /system clock get date ]; :local time [ /system clock get time ]; :lo\
    cal today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :fo\
    reach i in [ /ip hotspot user find where profile=\"v3-umi\" ] do={ :local \
    comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot use\
    r get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comme\
    nt 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d\
    =\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today\
    \_and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or \
    (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \
    \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:40:43
add comment="Monitor Profile v3" interval=2m43s name=v3 on-event=":local datei\
    nt do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\"\
    ,\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \$d\
    \_4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:loc\
    al monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1);\
    :if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$year\
    \$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\")]\
    ;}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes [ \
    :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /sy\
    stem clock get date ]; :local time [ /system clock get time ]; :local toda\
    y [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach i \
    in [ /ip hotspot user find where profile=\"v3\" ] do={ :local comment [ /i\
    p hotspot user get \$i comment]; :local name [ /ip hotspot user get \$i na\
    me]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\
    \" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comment]\
    \_; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$exp\
    t < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd = \
    \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /\
    ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=02:40:52
add comment="Monitor Profile 3k-plentong" interval=2m55s name=3k-plentong \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ]; :local time [ /system clock\
    \_get time ]; :local today [\$dateint d=\$date] ; :local curtime [\$timein\
    t t=\$time] ; :foreach i in [ /ip hotspot user find where profile=\"3k-ple\
    ntong\" ] do={ :local comment [ /ip hotspot user get \$i comment]; :local \
    name [ /ip hotspot user get \$i name]; :local gettime [:pic \$comment 12 2\
    0]; :if ([:pic \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:l\
    ocal expd [\$dateint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; \
    :if ((\$expd < \$today and \$expt < \$curtime) or (\$expd < \$today and \$\
    expt > \$curtime) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip\
    \_hotspot user remove \$i ]; [ /ip hotspot active remove [find where user=\
    \$name] ];}}}" policy=\
    reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:51:49
add comment="Monitor Profile rasta-3k" interval=2m43s name=rasta-3k on-event="\
    :local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"m\
    ay\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days\
    \_[ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d\
    \_7 11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$m\
    onthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:to\
    num (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mo\
    nth\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :loc\
    al minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loc\
    al date [ /system clock get date ]; :local time [ /system clock get time ]\
    ; :local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"rasta-3k\" ] do={ \
    :local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hots\
    pot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=03:14:34
add comment="Monitor Profile ipit-3k" interval=2m13s name=ipit-3k on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"ipit-3k\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=reboot,read,write,test,password,sniff,sensitive,romon start-date=\
    jan/23/2026 start-time=01:47:30
add interval=1d name=Jadwal_Backup_Telegram on-event=BackupRSC_Telegram \
    policy=read,write,policy,test start-date=feb/26/2026 start-time=23:59:00
add interval=1d name=Jadwal_Backup on-event=AutoEmailRSC policy=\
    read,write,policy,test start-date=feb/26/2026 start-time=23:59:00
add comment="PSaaS L2TP self-heal" interval=2m name=psaas-l2tp-heal on-event="\
    :if ([/interface l2tp-client get [find name=psaas-l2tp] running]=false) do\
    ={/interface l2tp-client disable psaas-l2tp; :delay 3s; /interface l2tp-cl\
    ient enable psaas-l2tp}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=may/31/2026 start-time=10:04:17
add interval=4w2d name=denihamdani@pegagan on-event="/ppp secret set profile=B\
    EATISOLIR [find name=denihamdani@pegagan]\r\
    \n/ppp active remove [find name=denihamdani@pegagan]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/16/2026 start-time=19:53:48
add interval=4w2d name=alan@pentud on-event="/ppp secret set profile=BEATISOLI\
    R [find name=alan@pentud]\r\
    \n/ppp active remove [find name=alan@pentud]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/18/2026 start-time=12:46:22
add interval=4w2d name=kevin on-event="/ppp secret set profile=BEATISOLIR [fin\
    d name=kevin]\r\
    \n/ppp active remove [find name=kevin]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/18/2026 start-time=18:55:21
add interval=4w2d name=erni on-event="/ppp secret set profile=BEATISOLIR [find\
    \_name=erni]\r\
    \n/ppp active remove [find name=erni]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/19/2026 start-time=10:10:05
add interval=4w2d name=tarci on-event="/ppp secret set profile=BEATISOLIR [fin\
    d name=tarci]\r\
    \n/ppp active remove [find name=tarci]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/19/2026 start-time=23:22:07
add interval=4w2d name=icha on-event="/ppp secret set profile=BEATISOLIR [find\
    \_name=icha]\r\
    \n/ppp active remove [find name=icha]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/20/2026 start-time=19:23:16
add interval=4w2d name=rangdu on-event="/ppp secret set profile=BEATISOLIR [fi\
    nd name=rangdu]\r\
    \n/ppp active remove [find name=rangdu]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/24/2026 start-time=21:36:16
add interval=4w2d name=RT-KARONI on-event="/ppp secret set profile=BEATISOLIR \
    [find name=RT-KARONI]\r\
    \n/ppp active remove [find name=RT-KARONI]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/26/2026 start-time=07:39:47
add interval=4w2d name=andi on-event="/ppp secret set profile=BEATISOLIR [find\
    \_name=andi]\r\
    \n/ppp active remove [find name=andi]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/26/2026 start-time=11:23:54
add interval=4w2d name=indra@plentong on-event="/ppp secret set profile=BEATIS\
    OLIR [find name=indra@plentong]\r\
    \n/ppp active remove [find name=indra@plentong]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/26/2026 start-time=16:10:52
add interval=4w2d name=rom@lah on-event="/ppp secret set profile=BEATISOLIR [f\
    ind name=rom@lah]\r\
    \n/ppp active remove [find name=rom@lah]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/27/2026 start-time=09:51:37
add interval=4w2d name=rasta on-event="/ppp secret set profile=BEATISOLIR [fin\
    d name=rasta]\r\
    \n/ppp active remove [find name=rasta]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/28/2026 start-time=10:32:59
add interval=4w2d name=lisan@banteng on-event="/ppp secret set profile=BEATISO\
    LIR [find name=lisan@banteng]\r\
    \n/ppp active remove [find name=lisan@banteng]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/28/2026 start-time=16:22:30
add interval=4w2d name=handoko on-event="/ppp secret set profile=BEATISOLIR [f\
    ind name=handoko]\r\
    \n/ppp active remove [find name=handoko]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/29/2026 start-time=11:15:49
add interval=4w2d name=sutara@pegagan on-event="/ppp secret set profile=BEATIS\
    OLIR [find name=sutara@pegagan]\r\
    \n/ppp active remove [find name=sutara@pegagan]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/29/2026 start-time=12:54:59
add interval=4w2d name=brohim on-event="/ppp secret set profile=BEATISOLIR [fi\
    nd name=brohim]\r\
    \n/ppp active remove [find name=brohim]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/31/2026 start-time=19:27:49
add interval=4w2d name=eka on-event="/ppp secret set profile=BEATISOLIR [find \
    name=eka]\r\
    \n/ppp active remove [find name=eka]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/31/2026 start-time=19:30:48
add interval=4w2d name=jarwo@ujungmulya on-event="/ppp secret set profile=BEAT\
    ISOLIR [find name=jarwo@ujungmulya]\r\
    \n/ppp active remove [find name=jarwo@ujungmulya]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/02/2026 start-time=14:03:56
add interval=4w2d name=kanu on-event="/ppp secret set profile=BEATISOLIR [find\
    \_name=kanu]\r\
    \n/ppp active remove [find name=kanu]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/03/2026 start-time=19:07:32
add interval=4w2d name=ejun on-event="/ppp secret set profile=BEATISOLIR [find\
    \_name=ejun]\r\
    \n/ppp active remove [find name=ejun]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/05/2026 start-time=19:36:29
add interval=4w2d name=warsinah on-event="/ppp secret set profile=BEATISOLIR [\
    find name=warsinah]\r\
    \n/ppp active remove [find name=warsinah]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/06/2026 start-time=10:23:29
add interval=4w2d name=yuyun on-event="/ppp secret set profile=BEATISOLIR [fin\
    d name=yuyun]\r\
    \n/ppp active remove [find name=yuyun]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/06/2026 start-time=14:31:47
add interval=4w2d name=darsono on-event="/ppp secret set profile=BEATISOLIR [f\
    ind name=darsono]\r\
    \n/ppp active remove [find name=darsono]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/07/2026 start-time=14:04:28
add interval=4w2d name=talita on-event="/ppp secret set profile=BEATISOLIR [fi\
    nd name=talita]\r\
    \n/ppp active remove [find name=talita]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/07/2026 start-time=14:12:30
add interval=4w2d name=dayuni on-event="/ppp secret set profile=BEATISOLIR [fi\
    nd name=dayuni]\r\
    \n/ppp active remove [find name=dayuni]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/07/2026 start-time=17:49:50
add interval=4w2d name=jami@sut on-event="/ppp secret set profile=BEATISOLIR [\
    find name=jami@sut]\r\
    \n/ppp active remove [find name=jami@sut]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/08/2026 start-time=19:49:14
add interval=4w2d name=nyamung on-event="/ppp secret set profile=BEATISOLIR [f\
    ind name=nyamung]\r\
    \n/ppp active remove [find name=nyamung]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/11/2026 start-time=04:13:53
add interval=4w2d name=damar on-event="/ppp secret set profile=BEATISOLIR [fin\
    d name=damar]\r\
    \n/ppp active remove [find name=damar]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/11/2026 start-time=07:25:30
add interval=4w2d name=ajri on-event="/ppp secret set profile=BEATISOLIR [find\
    \_name=ajri]\r\
    \n/ppp active remove [find name=ajri]\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/12/2026 start-time=14:33:55
add interval=1d name=693238 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/14/2026 start-time=12:43:36
/system script
add comment=-|-Jan-|-,-|-Feb-|-,-|-Mar-|-,-|-Apr-|-,-|-May-|-,-|-Jun-|- \
    dont-require-permissions=no name=RekapPendapatan owner=alijaya policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    0,0,0,0,0,0
add comment="Report Pendapatan" dont-require-permissions=no name=\
    ReportPendapatan owner=alijaya policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=0
add comment="Reset Report Pendapatan" dont-require-permissions=no name=\
    ResetReportPendapatan owner=alijaya policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    if ([/system clock get date]~\"/01/\") do={:local tgl [/system clock get d\
    ate];:local bl [:pick \$tgl 0 3];if (\$bl = \"jan\") do={:set \$bl \"Dec\"\
    ;:local pend [/system script get ReportPendapatan source];:local pendBul [\
    /system script get RekapPendapatan source];:local nmBul [/system script ge\
    t RekapPendapatan comment];:local toPB (\"\$pendBul\" .\",\". \"\$pend\");\
    :local toPBc (\"\$nmBul\" .\",-|-\". \"\$bl\".\"-|-\");[/system script set\
    \_comment=\"\$toPBc\" RekapPendapatan];[/system script set source=\"\$toPB\
    \" RekapPendapatan];[/system script set source=\"0\" ReportPendapatan];[/s\
    ystem sch re ResetReportPendapatan];[/undo];[/system scr re ResetReportPen\
    dapatan];[/undo]} else={if (\$bl = \"feb\") do={:set \$bl \"Jan\";:local p\
    end [/system script get ReportPendapatan source];[/system script set comme\
    nt=\"-|-Jan-|-\" RekapPendapatan];[/system script set source=\"\$pend\" Re\
    kapPendapatan];[/system script set source=\"0\" ReportPendapatan];[/system\
    \_sch re ResetReportPendapatan];[/undo];[/system scr re ResetReportPendapa\
    tan];[/undo]} else={if (\$bl = \"mar\") do={:set \$bl \"Feb\";:local pend \
    [/system script get ReportPendapatan source];:local pendBul [/system scrip\
    t get RekapPendapatan source];:local nmBul [/system script get RekapPendap\
    atan comment];:local toPB (\"\$pendBul\" .\",\". \"\$pend\");:local toPBc \
    (\"\$nmBul\" .\",-|-\". \"\$bl\".\"-|-\");[/system script set comment=\"\$\
    toPBc\" RekapPendapatan];[/system script set source=\"\$toPB\" RekapPendap\
    atan];[/system script set source=\"0\" ReportPendapatan];[/system sch re R\
    esetReportPendapatan];[/undo];[/system scr re ResetReportPendapatan];[/und\
    o]} else={if (\$bl = \"apr\") do={:set \$bl \"Mar\";:local pend [/system s\
    cript get ReportPendapatan source];:local pendBul [/system script get Reka\
    pPendapatan source];:local nmBul [/system script get RekapPendapatan comme\
    nt];:local toPB (\"\$pendBul\" .\",\". \"\$pend\");:local toPBc (\"\$nmBul\
    \" .\",-|-\". \"\$bl\".\"-|-\");[/system script set comment=\"\$toPBc\" Re\
    kapPendapatan];[/system script set source=\"\$toPB\" RekapPendapatan];[/sy\
    stem script set source=\"0\" ReportPendapatan];[/system sch re ResetReport\
    Pendapatan];[/undo];[/system scr re ResetReportPendapatan];[/undo]} else={\
    if (\$bl = \"may\") do={:set \$bl \"Apr\";:local pend [/system script get \
    ReportPendapatan source];:local pendBul [/system script get RekapPendapata\
    n source];:local nmBul [/system script get RekapPendapatan comment];:local\
    \_toPB (\"\$pendBul\" .\",\". \"\$pend\");:local toPBc (\"\$nmBul\" .\",-|\
    -\". \"\$bl\".\"-|-\");[/system script set comment=\"\$toPBc\" RekapPendap\
    atan];[/system script set source=\"\$toPB\" RekapPendapatan];[/system scri\
    pt set source=\"0\" ReportPendapatan];[/system sch re ResetReportPendapata\
    n];[/undo];[/system scr re ResetReportPendapatan];[/undo]} else={if (\$bl \
    = \"jun\") do={:set \$bl \"May\";:local pend [/system script get ReportPen\
    dapatan source];:local pendBul [/system script get RekapPendapatan source]\
    ;:local nmBul [/system script get RekapPendapatan comment];:local toPB (\"\
    \$pendBul\" .\",\". \"\$pend\");:local toPBc (\"\$nmBul\" .\",-|-\". \"\$b\
    l\".\"-|-\");[/system script set comment=\"\$toPBc\" RekapPendapatan];[/sy\
    stem script set source=\"\$toPB\" RekapPendapatan];[/system script set sou\
    rce=\"0\" ReportPendapatan];[/system sch re ResetReportPendapatan];[/undo]\
    ;[/system scr re ResetReportPendapatan];[/undo]} else={if (\$bl = \"jul\")\
    \_do={:set \$bl \"Jun\";:local pend [/system script get ReportPendapatan s\
    ource];:local pendBul [/system script get RekapPendapatan source];:local n\
    mBul [/system script get RekapPendapatan comment];:local toPB (\"\$pendBul\
    \" .\",\". \"\$pend\");:local toPBc (\"\$nmBul\" .\",-|-\". \"\$bl\".\"-|-\
    \");[/system script set comment=\"\$toPBc\" RekapPendapatan];[/system scri\
    pt set source=\"\$toPB\" RekapPendapatan];[/system script set source=\"0\"\
    \_ReportPendapatan];[/system sch re ResetReportPendapatan];[/undo];[/syste\
    m scr re ResetReportPendapatan];[/undo]} else={if (\$bl = \"aug\") do={:se\
    t \$bl \"Jul\";:local pend [/system script get ReportPendapatan source];:l\
    ocal pendBul [/system script get RekapPendapatan source];:local nmBul [/sy\
    stem script get RekapPendapatan comment];:local toPB (\"\$pendBul\" .\",\"\
    . \"\$pend\");:local toPBc (\"\$nmBul\" .\",-|-\". \"\$bl\".\"-|-\");[/sys\
    tem script set comment=\"\$toPBc\" RekapPendapatan];[/system script set so\
    urce=\"\$toPB\" RekapPendapatan];[/system script set source=\"0\" ReportPe\
    ndapatan];[/system sch re ResetReportPendapatan];[/undo];[/system scr re R\
    esetReportPendapatan];[/undo]} else={if (\$bl = \"sep\") do={:set \$bl \"A\
    ug\";:local pend [/system script get ReportPendapatan source];:local pendB\
    ul [/system script get RekapPendapatan source];:local nmBul [/system scrip\
    t get RekapPendapatan comment];:local toPB (\"\$pendBul\" .\",\". \"\$pend\
    \");:local toPBc (\"\$nmBul\" .\",-|-\". \"\$bl\".\"-|-\");[/system script\
    \_set comment=\"\$toPBc\" RekapPendapatan];[/system script set source=\"\$\
    toPB\" RekapPendapatan];[/system script set source=\"0\" ReportPendapatan]\
    ;[/system sch re ResetReportPendapatan];[/undo];[/system scr re ResetRepor\
    tPendapatan];[/undo]} else={if (\$bl = \"Oct\") do={:set \$bl \"Sep\";:loc\
    al pend [/system script get ReportPendapatan source];:local pendBul [/syst\
    em script get RekapPendapatan source];:local nmBul [/system script get Rek\
    apPendapatan comment];:local toPB (\"\$pendBul\" .\",\". \"\$pend\");:loca\
    l toPBc (\"\$nmBul\" .\",-|-\". \"\$bl\".\"-|-\");[/system script set comm\
    ent=\"\$toPBc\" RekapPendapatan];[/system script set source=\"\$toPB\" Rek\
    apPendapatan];[/system script set source=\"0\" ReportPendapatan];[/system \
    sch re ResetReportPendapatan];[/undo];[/system scr re ResetReportPendapata\
    n];[/undo]} else={if (\$bl = \"nov\") do={:set \$bl \"Oct\";:local pend [/\
    system script get ReportPendapatan source];:local pendBul [/system script \
    get RekapPendapatan source];:local nmBul [/system script get RekapPendapat\
    an comment];:local toPB (\"\$pendBul\" .\",\". \"\$pend\");:local toPBc (\
    \"\$nmBul\" .\",-|-\". \"\$bl\".\"-|-\");[/system script set comment=\"\$t\
    oPBc\" RekapPendapatan];[/system script set source=\"\$toPB\" RekapPendapa\
    tan];[/system script set source=\"0\" ReportPendapatan];[/system sch re Re\
    setReportPendapatan];[/undo];[/system scr re ResetReportPendapatan];[/undo\
    ]} else={if (\$bl = \"dec\") do={:set \$bl \"Nov\";:local pend [/system sc\
    ript get ReportPendapatan source];:local pendBul [/system script get Rekap\
    Pendapatan source];:local nmBul [/system script get RekapPendapatan commen\
    t];:local toPB (\"\$pendBul\" .\",\". \"\$pend\");:local toPBc (\"\$nmBul\
    \" .\",-|-\". \"\$bl\".\"-|-\");[/system script set comment=\"\$toPBc\" Re\
    kapPendapatan];[/system script set source=\"\$toPB\" RekapPendapatan];[/sy\
    stem script set source=\"0\" ReportPendapatan];[/system sch re ResetReport\
    Pendapatan];[/undo];[/system scr re ResetReportPendapatan];[/undo]}}}}}}}}\
    }}}}}"
add dont-require-permissions=no name=test2 owner=alijayanet policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local date [ /system clock get date ];\r\
    \n:local varDay [:pick \$date 4 6];\r\
    \n:local user value=[/ppp secret find];\r\
    \n:local pesan \"\\E2\\9C\\85 Pelanggan ALIJAYA NET %0A\r\
    \nKoneksi Internet Anda kami PUTUS SEMENTARA%0A Mohon Segera MELUNASI tagi\
    han internet anda, Jika TAGIHAN sudah LUNAS  mohon segera Hubungi kami%0AT\
    erima Kasih\";\r\
    \n:foreach users in=\$user do={\r\
    \n:local comment [/ppp secret get \$users value-name=comment];\r\
    \n:local u [/ppp secret get \$users value-name=name];\r\
    \n:local tgl [:pick \$comment 4 6];\r\
    \n:local wa [:pick \$comment 12 25];\r\
    \n:if (\$varDay = \$tgl) do={ \r\
    \n/ppp secret set profile=ISOLIR  [find name=\$u];\r\
    \n/ppp active remove [find name=\$u];\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"number=\$wa&message=\$pesan\" url=\
    \"http://103.235.74.203:8000/send-message\" keep-result=no;\r\
    \n:log warning \"Pesan terkirim ke \$wa\";\r\
    \n}\r\
    \n};\r\
    \n:log warning \"Pesan berhasil terkirim semua\";"
add dont-require-permissions=no name=test7 owner=alijaya policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    put (\",remc,2000,1d,3000,,Disable,\"); {\r\
    \n:local date [ /system clock get date ];\r\
    \n:local year [ :pick \$date 7 11 ];\r\
    \n:local month [ :pick \$date 0 3 ];\r\
    \n:local comment [ /ip hotspot user get [/ip hotspot user find where name=\
    \"\$user\"] comment]; \r\
    \n:local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"\
    up\" or \$comment = \"\") do={ /sys sch add name=\"\$user\" disable=no sta\
    rt-date=\$date interval=\"1d\"; :delay 2s; \r\
    \n:local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-r\
    un]; \r\
    \n:local getxp [len \$exp]; :if (\$getxp = 15) do={ \r\
    \n:local d [:pic \$exp 0 6]; \r\
    \n:local t [:pic \$exp 7 16]; \r\
    \n:local s (\"/\"); \r\
    \n:local exp (\"\$d\$s\$year \$t\"); /ip hotspot user set comment=\$exp [f\
    ind where name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set \
    comment=\"\$date \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15\
    ) do={ /ip hotspot user set comment=\$exp [find where name=\"\$user\"];}; \
    /sys sch remove [find where name=\"\$user\"]; \r\
    \n:local mac \$\"mac-address\"; \r\
    \n:local time [/system clock get time ]; /system script add name=\"\$date-\
    |-\$time-|-\$user-|-2000-|-\$address-|-\$mac-|-1d-|-WA-3k-|-\$comment\" ow\
    ner=\"\$month\$year\" source=\$date comment=mikhmon;\r\
    \n:local URL \"https://onemonbot.com/api/notif\";\
    \n\r\
    \n:local TOKEN \"mIeXCD6dHrY\";\
    \n\r\
    \n:local mac \$\"mac-address\";\
    \n:set mac [:ip dhcp-server lease get [:ip dhcp-server lease find mac-addr\
    ess=\"\$mac\"] host];\
    \n\r\
    \n:local nama \"\$user\";\
    \n\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\
    \n\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\
    \n\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\
    \n\r\
    \n:local datetime \"\$[/system clock get date] \$[/system clock get time]\
    \";\r\
    \n\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\
    \n\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n\
    \n:local totq [((\$limit)/1048576)];\r\
    \n\
    \n:local useraktif [/ip hotspot active print count-only];\
    \n\r\
    \n/tool fetch url=\"\$URL\\\?token=\$TOKEN&vcr=\$user&msg====>>INFO LOGIN<\
    <==%0D%0A-+Kode+Voucher+:+\$nama%0D%0A-+IP+Address+:+\$ips%0D%0A-+Mac+Addr\
    ess+:+\$mac%0D%0A-+Menggunakan+:+\$host%0D%0A-+Metode+Login+:+\$lby%0D%0A-\
    +Kuota+:+\$totq+Mb%0D%0A-+Expired+Voucher+:+\$exp%0D%0A-+Waktu+Login+:+\$d\
    atetime%0D%0A-+Paket+:+\$profile%0D%0A-+User+Online+:+\$useraktif+user\";]\
    "
add comment="gatwey SMK" dont-require-permissions=no name=b1 owner=\
    alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=cj4XJjtCml31Ui2UK2E9U7fJzinaXt\
    &sender=6287820851413&number=120363312024876321@g.us&message=\\E2\\9C\\85 \
    *TERHUBUNG KEMBALI* url=\"https://wa.alijaya.net/send-message\" keep-resul\
    t=no;}}"
add dont-require-permissions=no name=b2 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=XwqSV5zVqZM9x48jqFiC7SPKwu2TVz\
    &sender=6287820851413&number=6281947215703&message========================\
    ===== *Monitor%10Voucher%10Hotspot* %0A===========================%0AKode \
    Voucher : *\$user*%0AMAC-Address  : \$mac%0A===========================%0A\
    *Detail-Aktivasi:*%0ATanggal : \$date%0APukul : \$time%0A=================\
    ==========%0A*Masa Aktif* : \$exp%0A===========================%0AUser Akt\
    if : \$useraktif&parse_mode=markdown\" url=\"https://wa.alijaya.net/send-m\
    essage\" keep-result=no\r\
    \n"
add dont-require-permissions=no name=b3 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=djAhG3WaiHeBvMBVxxO0EX2kXhMbqB\
    &sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\85 \
    *TERHUBUNG KEMBALI*url=\"https://app1.alijayajuraganpulsa.com/send-message\
    \" keep-result=no"
add dont-require-permissions=no name="a pendapatan1" owner=alijayanet policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"number=081947215703&message===========\
    ================== *Monitor%10Voucher%10Hotspot* %0A======================\
    =====%0AKode Voucher : *\$user*%0AMAC-Address  : \$mac%0A=================\
    ==========%0A*Detail-Aktivasi:*%0ATanggal : \$date%0APukul : \$time%0A====\
    =======================%0A*Pendapatan* Rp. : \$Pendapatan%0A==============\
    =============%0AUser Aktif : \$useraktif&parse_mode=markdown\" url=\"http:\
    //103.235.74.203:8000/send-message\" keep-result=no]}}\r\
    \n"
add dont-require-permissions=no name=c1 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"number=087820851413&message===========\
    ================== *Monitor%10Voucher%10Hotspot* %0A======================\
    =====%0AKode Voucher : \$user%0AMAC-Address  : \$mac%0A===================\
    ========%0A*Detail-Aktivasi:*%0ATanggal : \$date%0APukul : \$time%0A======\
    =====================%0A*Masa Aktif* : \$exp%0A===========================\
    %0A*Jenis Hp* : \$dvc%0A===========================%0AUser Aktif : \$usera\
    ktif&parse_mode=markdown\" url=\"http://alijaya.cloud:8000/send-message\" \
    keep-result=no]}}\r\
    \n"
add dont-require-permissions=no name=aaa owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"session=060111&to=6281947215703&text=T\
    est Kirim Trafik Monitor\" url=\"http://192.168.8.89:5001/send-message\" k\
    eep-result=no;"
add dont-require-permissions=no name=SL087820851413 owner=alijaya policy=\
    read,write source=087820851413/ALIJAYA
add dont-require-permissions=no name=aa owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"phone=120363304516616348&message=\\E2\
    \\9C\\85 PPPoE LOGIN%0A\$datetime%0AUser: *\$user*%0AIP Client: \$ips%0ACa\
    ller ID: \$caller%0AUptime: \$up%0ATotal Active: \$active Client%0AService\
    : \$service%0APaket :\$profile%0ALast Disconnect Reason: \$lastdisc %0ALas\
    t Logout: \$lastlogout %0ALast Caller ID: \$lastcall\" url=\"http://alijay\
    a.online:8000//send/message\" keep-result=no;"
add dont-require-permissions=no name=a1 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=cj4XJjtCml31Ui2UK2E9U7fJzinaXt\
    &sender=6287820851413&number=120363184282402401@g.us&message=\\E2\\9C\\85 \
    CLIENT LOGOUT%0A\\F0\\9F\\93\\8D User: \$user%0A\\F0\\9F\\93\\86 Profile: \
    \$profile%0A\\F0\\9F\\93\\B6 IP Address :\$remote%0A\\F0\\9F\\8C\\8D User \
    Aktif :\$active%0A\\E2\\8F\\B0 Waktu :\$last\" url=\"https://wa.alijaya.ne\
    t/send-message\" keep-result=no;}}\r\
    \n"
add dont-require-permissions=no name=c2 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"id_group=120363152915962417@g.us&messa\
    ge============================= *Monitor-Voucher-Hotspot* %0A=============\
    ==============%0AKode Voucher : \$user%0AMAC-Address  : \$mac%0A==========\
    =================%0A*Detail-Aktivasi:*%0ATanggal : \$date%0APaket     : *\
    \$Mpkt*%0A===========================%0A*Masa Aktif* : \$exp%0A===========\
    ================%0A*Jenis Hp* : \$dvc%0A===========================%0AUser\
    \_Aktif : \$Ma User&parse_mode=markdown\" url=\"http://103.190.28.101:8001\
    /send-group-message\" keep-result=no"
add dont-require-permissions=no name=c4 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=\"https://app1.alijayajuraganpulsa.com/send-message\?ap\
    i_key=djAhG3WaiHeBvMBVxxO0EX2kXhMbqB&sender=6287820851413&number=628194721\
    5703&message=jajal kirim2"
add comment="gatwey SMK" dont-require-permissions=no name=bb owner=\
    alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=q5K2wUFzcsrOR8Ocob6wORqNoW9wmu\
    &sender=6287820851413&number=6281947215703&message===>> CLIENT PPPOE LOG-O\
    UT <<===%0A -USEERNAME : *\$user*\" url=\"https://wa.smkmaarif2temon.sch.i\
    d/send-message\" keep-result=no"
add dont-require-permissions=no name=1 owner=alijayanet policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="\
    \r\
    \n:local ips [/ppp active get [find name=\$nama] address]; \r\
    \n:local up [/ppp active get [find name=\$nama] uptime]; \r\
    \n:local caller [/ppp active get [find name=\$nama] caller-id]; \r\
    \n:local service [/ppp active get [find name=\$nama] service]; \r\
    \n:local active [/ppp active print count]; \r\
    \n:local secret [/ppp secret print count]; \r\
    \n:local terputus (\$secret - \$active) \r\
    \n:local serv [/ppp secret get [find name=\$nama] service]; \r\
    \n:local datetime \"Tanggal: \$[/system clock get date] %0AJam: \$[/system\
    \_clock get time]\"; \r\
    \n:local lastdisc [/ppp secret get [find name=\$user] last-disconnect-reas\
    on]; \r\
    \n:local last [/ppp secret get [find name=\$nama] last-logged-out]; \r\
    \n:local lastcall [/ppp secret get [find name=\$user] last-caller-id]; \r\
    \n:local profile [/ppp secret get [find name=\$nama] profile]; \r\
    \n:local password [/ppp secret get [find name=\$nama] password]; \r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"api_key=jV1SOTRMSmRKcdnR3Z0KFoMIAdK\
    BvD&sender=6287820851413&number=120363031495796203@g.us&message=\\E2\\9C\\\
    85 CLIENT NYALA BOSS \r\
    \n \r\
    \n*DATA PELANGGAN* \r\
    \n\\F0\\9F\\91\\A5 User : *\$user* \r\
    \n\\F0\\9F\\94\\90 Password : \$password \r\
    \n\\F0\\9F\\93\\8C Services : *\$serv* \r\
    \n\\F0\\9F\\93\\86 Profile : \$profile \r\
    \n\\F0\\9F\\93\\B6 IP Address : \$ips \r\
    \n\\E2\\8F\\B0 Waktu Aktip : \$last \r\
    \n\\E2\\8F\\B0 Waktu connect : \$up \r\
    \n\\E2\\93\\82 MAC ADress : \$lastcall \r\
    \n \r\
    \n*STATUS GANGGUAN* \r\
    \n\\F0\\9F\\93\\B4 Jmlh Gangguan : *0 Terputus* \r\
    \n============================ \r\
    \n\\F0\\9F\\8C\\8D User Aktif : \$active \r\
    \n\\F0\\9F\\8C\\8D Total PPPOE : \$secret \r\
    \n\\F0\\9F\\8C\\8D Total Mati *(\$terputus)*: \r\
    \n============================ \r\
    \n \r\
    \n_Powered by,_ \r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://app1.alijayajuraganpulsa.c\
    om/send-message\" keep-result=no;}}\r\
    \n"
add dont-require-permissions=no name=a2 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"number=120363200614993481&message=\\E2\
    \\9C\\85=====test PPPoE LOG-OUT====%0A\$datetime%0AUser: *\$user*%0ATotal \
    Active: *\$active* Client%0ALogin Terakhir: \$lastlogout %0A\" url=\"http:\
    //192.168.8.130:8000/send-group-message\" keep-result=no;"
add comment="gatwey SMK" dont-require-permissions=no name=bc owner=\
    alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=c2E6BE6S3xn0ZMeRUnOlVQSrJq1v1a\
    &sender=6281947215703&number=6287820851413&message===>> CLIENT PPPOE LOG-O\
    UT <<===%0A -USEERNAME : *\$user*\" url=\"https://app.alijaya.net/send-mes\
    sage\" keep-result=no"
add comment="gatwey SMK" dont-require-permissions=no name=bd owner=\
    alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=cj4XJjtCml31Ui2UK2E9U7fJzinaXt\
    &sender=6287820851413&number=6281947215703&message===>> CLIENT PPPOE LOG-O\
    UT <<===%0A -USEERNAME : *\$user*\" url=\"https://wa.alijaya.net/send-mess\
    age\" keep-result=no"
add dont-require-permissions=no name=a11 owner=alijayahotspot policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"number=081947215703&message=\\E2\\9C\\\
    85 PPPoE LOGIN%0A\$datetime%0AUser: \$user%0AIP Client: \$ips%0ACaller ID:\
    \_\$caller%0AUptime: \$up%0ATotal Active: \$active Client%0AService: \$ser\
    vice%0ALast Disconnect Reason: \$lastdisc %0ALast Logout: \$lastlogout %0A\
    Last Caller ID: \$lastcall\" url=\"http://192.168.8.130:8000/send-message\
    \" keep-result=no"
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=damar \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    3255
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    astri@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    4370
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=rintem \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    203
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=warsana \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    4631
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=bunga \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1079
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nana owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    816
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    hany@tarsiti owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    213
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=memble2 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    341
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kasmuri \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1612
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nesa owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    273
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=coyih \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    432
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    pandi@tanjungpura owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    436
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    waidah@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    658
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=eva@pegagan \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    975
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    sudini@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    678
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    wendy@genjong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    601
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    paisal@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    10
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=F663 owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    749
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    lina@ujungmulya owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    202
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    dadang@genjong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    484
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=murdani \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1111
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    uung@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    673
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    umikulsum@janggar owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    518
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=wilda \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    118
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    soleh@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2261
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=sang owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    706
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    nalda@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1266
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=novita \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1031
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    khofik@janggar owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    573
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=gemblung \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    694
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    mangasep@janggar owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    470
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=ggclink \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    38
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=leha owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    580
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    setiyadi@genjong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    494
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    durniyah@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    951
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    denihamdani@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1558
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    surminih@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    936
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    anwar@janggar owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    560
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    yuni@ujungmulya owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    406
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    sarna@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    659
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    abas@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    350
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    eryanto@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1192
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kurnati \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    886
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    Endra@genjong1 owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    463
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    sutara@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1272
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nani owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    676
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    adinesep@ujungmulya owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    258
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=yusuf \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1099
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=winata \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    4707
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=erul owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1256
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=yogi owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    838
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    kasdi@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    202
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=mella \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    373
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=talita \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    468
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=oland \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    895
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=andi owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    368
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=ety@pegagan \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    724
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=aang2 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    632
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=santo \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    239
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=barli \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    35
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=windah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    694
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    wendy@tanjungpura owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    234
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    junanto@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    201
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=alan@pentud \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    304
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=rom@lah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    250
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=gunawan \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    299
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    daruni@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1414
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=gadel \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    479
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=Uchi owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    791
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    wadi@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    197
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    warungyuni@laut owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    406
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    yuni@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    339
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    dhea_tile@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    231
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=sanyo \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    231
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=lussy \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    303
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=karmanda \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    886
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=Tarci@lor \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    241
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    nalda@rawagunda2 owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    384
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    indah@tanjungpura owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    252
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nina@kesin \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    213
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=koriya \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    142
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=karban \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    188
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=epon02 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    37
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kincling \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    390
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    warung_elisa@laut owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    412
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nuriyah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    243
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=SDNUG1 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    306
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=ajri owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    909
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=jami@sut \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    192
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    lisan@banteng owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    328
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=ooh owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    27146
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=dedi@aira \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    241
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=icha owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    696
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=memble@ \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    269
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=toko@sayur \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    382
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=RT-KARONI \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    312
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=rasta \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    271
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    joni@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    88
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=luwih@ \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    764
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=handoko \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    329
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=sumi owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    363
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=tinih \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    226
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=test owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    139
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=h.juroh \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    599
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=ros_pppoe \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    123
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=erni owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1199
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=tariman \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    227
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=eva owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    240
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=iman@ \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    199
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nadiva \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    177
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=yessy \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    69
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=elvano1 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    394
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=winata@laut \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    193
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=darim@lor \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    211
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=mastobari@ \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    203
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=codet \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    411
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=tibil \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    201
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=toyinah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    307
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    kendo@tanjungpura owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    238
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=walong@asep \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    348
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    suminih@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    315
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    opang@tanjungpura owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    188
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    muktar@ompong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    582
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=raeni \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    251
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=aqiel \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    211
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=server@ilik \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    252
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=alam owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    455
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=antony@ps \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    190
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=fajar \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    221
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=atam owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    287
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nurudin \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    237
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=ejun owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    251
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=toax owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    305
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=dedy@sarkim \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    907
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=murba \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    221
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=sandi@rajan \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    312
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=yudi owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    355
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=daskunah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    66
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=suliwa \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    233
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=runaeni \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    363
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=dasta \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    184
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=abibah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    230
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=darim \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    169
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=maktub \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    188
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=sarwan \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    269
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    wiwin@seblak owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    186
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=aang owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    196
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=tarci \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    334
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=brohim \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    247
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=karsih \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    180
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=seka owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    484
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=mardi \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    270
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=wakeng \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    226
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    elis@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    173
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    rudibengkel@tanjungpura owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    110
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=salsa \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    243
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kandar \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    876
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=aldo owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    278
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=eka owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    226
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    intan@ujungmulya owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1030
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=rangdu \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    190
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=durnawi \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    55
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=turidah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1377
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=epon owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    85
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    pabudi@genjong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    500
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kama@ \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    206
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=adiiman \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    166
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    server@yayan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    401
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=alijaya \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=1
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    yohan@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    275
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=tester \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    53
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=server@arep \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    128
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kus owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    175
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    opang@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    808
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=durta \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    709
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=newok \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    110
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=sarjo \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    395
add dont-require-permissions=no name=a123 owner=alijaya policy=\
    reboot,read,write,test,password,sniff,sensitive,romon source="/tool fetch \
    http-header-field=\"content-type: application/x-www-form-urlencoded\" http\
    -method=post http-data=\"api_key=JPweqBKzCUX6MqHAIZN9iXK6Y1B9qD&sender=628\
    7820851413&number=120363031495796203&message=\\E2\\9C\\85 CLIENT LOGOUT%0A\
    \\F0\\9F\\93\\8D User: \$user%0A\\F0\\9F\\93\\86 Profile: \$profile%0A\\F0\
    \\9F\\93\\B6 IP Address :\$remote%0A\\F0\\9F\\8C\\8D User Aktif :\$active%\
    0A\\E2\\8F\\B0 Waktu :\$last\" url=\"https://wa.alijaya.net/send-message\"\
    \_keep-result=no;}}\r\
    \n"
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=adineasep \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    758
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=juanda \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    195
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    indra@plentong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    639
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=dayuni \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    318
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=darmini \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    789
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=waran \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1190
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=Zea owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    194
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=cecep \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    144
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=wardi \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    130
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    server_warung owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=2
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kanu owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    273
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=3600 owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=1
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=yuyun \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    213
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=wiranto \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    256
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=tinih_toko \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    190
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=server_umi \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    215
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=rudi_ \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    162
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    yudi@rawagunda owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    367
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    linah@ujungmulya owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    889
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=server \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    104
add dont-require-permissions=no name=test1 owner=alijaya policy=\
    reboot,read,write,test,password,sniff,sensitive,romon source="# Script On \
    Logout untuk Profile PPPoE\r\
    \n# Tempatkan di bagian \"on-logout\" script dari PPPoE profile\r\
    \n\r\
    \n# Mendapatkan informasi user\r\
    \n:local username \$user\r\
    \n:local ipAddress \$address\r\
    \n:local sessionTime \$session-time\r\
    \n\r\
    \n# Kirim notifikasi logout ke server\r\
    \n/tool fetch url=\"http://192.168.8.89:3003/api/external/pppoe/notificati\
    on\?event=logout&user=\$username&ip=\$ipAddress&session=\$sessionTime&api_\
    key=gembok-api-2024\" mode=http"
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=server2 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    194
add dont-require-permissions=no name=11 owner=alijaya policy=\
    reboot,read,write,test,password,sniff,sensitive,romon source="/tool fetch \
    http-header-field=\"content-type: application/x-www-form-urlencoded\" http\
    -method=post http-data=\"api_key=JPweqBKzCUX6MqHAIZN9iXK6Y1B9qD&sender=628\
    7820851413&number=120363031495796203@g.us&message=\\E2\\9D\\8C *TERPUTUS*\
    \r\
    \n\r\
    \n============================\r\
    \n\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n*INFO LAYANAN*\r\
    \n\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\r\
    \n\\F0\\9F\\93\\8C IP Address : *\$ips*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n_Powered by,_\r\
    \n\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://wa.alijaya.net/send-messag\
    e\" keep-result=no;"
add dont-require-permissions=no name=2 owner=alijayanet policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool fetch http-header-field=\"content-type: application/x-www-form-urlenc\
    oded\" http-method=post http-data=\"api_key=JPweqBKzCUX6MqHAIZN9iXK6Y1B9qD\
    &sender=&number=120363031495796203@g.us&message=\\E2\\9D\\8C *TERPUTUS*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n\\E2\\8F\\B0 *\$date*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n*INFO LAYANAN*\r\
    \n\r\
    \n\\F0\\9F\\91\\A5 Nama  : *\$nama*\r\
    \n\r\
    \n\\F0\\9F\\94\\A3 Kode    : *\$kodeprofile*\r\
    \n\r\
    \n\\F0\\9F\\93\\A6 Paket   : *\$profile*\r\
    \n\r\
    \n\r\
    \n\r\
    \n*INFO PERANGKAT*\r\
    \n\r\
    \n\\F0\\9F\\94\\90 Username : *\$un*\r\
    \n\r\
    \n\\F0\\9F\\93\\8C IP Address : *\$ips*\r\
    \n\r\
    \n============================\r\
    \n\r\
    \n_Powered by,_\r\
    \n\r\
    \n*PT. ALIJAYA DIGITAL NETWORK*\" url=\"https://wa.alijaya.net/send-group-\
    message\" keep-result=no;"
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=alfa owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    120
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=tino owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    115
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    fitri@sukinih owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    86
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kevin \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    136
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    sosis@janggar owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    276
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=juniah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    74
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=mail owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    176
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=codet2 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    419
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=denggol \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    494
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=koriyah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    153
add comment=QuickPrintMikhmon dont-require-permissions=no name=\
    Quick_Print_3000 owner=alijaya policy=\
    reboot,read,write,test,password,sniff,sensitive,romon source=\
    #3000#all#vc#4##num#3k#0#0##1d#2000_3000#Disable
add comment=QuickPrintMikhmon dont-require-permissions=no name=\
    Quick_Print_5000 owner=alijaya policy=\
    reboot,read,write,test,password,sniff,sensitive,romon source=\
    #5000#all#vc#5##num#5k#0#0##2d#4000_5000#Disable
add comment=QuickPrintMikhmon dont-require-permissions=no name=\
    Quick_Print_10000 owner=alijaya policy=\
    reboot,read,write,test,password,sniff,sensitive,romon source=\
    #10000#all#vc#6##num#10k#0#0##5d#8000_10000#Disable
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=denggol2 \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    158
add dont-require-permissions=no name=notif-login owner=alijayanet policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    ""
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=robet \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    158
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    server_naela owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    12
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=warsinah \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    74
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=wa_jebod \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    48
add dont-require-permissions=no name=clean-hotspot-scheduler owner=alijayanet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":foreach i in=[/system scheduler find] do={\r\
    \n\r\
    \n    :local schedName [/system scheduler get \$i name]\r\
    \n    :local schedEvent [/system scheduler get \$i on-event]\r\
    \n\r\
    \n    # Cek apakah ada user hotspot dengan nama yang sama\r\
    \n    :local userExists [/ip hotspot user find name=\$schedName]\r\
    \n\r\
    \n    # Hapus hanya jika:\r\
    \n    # 1. User hotspot tidak ada\r\
    \n    # 2. On Event kosong\r\
    \n    :if (([:len \$userExists] = 0) && ([:len \$schedEvent] = 0)) do={\r\
    \n        /system scheduler remove \$i\r\
    \n        :log info (\"Scheduler '\" . \$schedName . \"' dihapus karena us\
    er hotspot tidak ditemukan dan On Event kosong.\")\r\
    \n    }\r\
    \n}\r\
    \n"
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=sobirin \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    70
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=serveroki \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    128
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    kedai_hd@pegagan owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    694
add dont-require-permissions=no name=BackupRSC_Telegram owner=alijayanet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="# --- KONFIGURASI ---\r\
    \n:local botToken \"2138277971:AAEQmJ5ziNca6VAJp_8hiXBbkLeUkregdt4\"\r\
    \n:local chatId \"567858628\"\r\
    \n:local identitas [/system identity get name]\r\
    \n:local fileName \"short_backup.rsc\"\r\
    \n\r\
    \n# --- 1. PROSES EXPORT COMPACT ---\r\
    \n# Menggunakan compact agar teks tidak terlalu panjang\r\
    \n/export compact file=\$fileName\r\
    \n:delay 10s\r\
    \n\r\
    \n# --- 2. BACA ISI & KIRIM ---\r\
    \n:if ([:len [/file find name=\$fileName]] > 0) do={\r\
    \n    :local isi [/file get \$fileName contents]\r\
    \n    \r\
    \n    :if ([:len \$isi] > 0) do={\r\
    \n        :log info \"Mengirim teks konfigurasi ke Telegram...\"\r\
    \n        /tool fetch http-method=post \\\r\
    \n            url=\"https://api.telegram.org/bot\$botToken/sendMessage\" \
    \\\r\
    \n            http-data=\"chat_id=\$chatId&text=--- BACKUP RSC \$identitas\
    \_---\\n\\n\$isi\" \\\r\
    \n            check-certificate=no\r\
    \n        \r\
    \n        :log info \"BERHASIL TERKIRIM VIA TEKS!\"\r\
    \n        /file remove [find name=\$fileName]\r\
    \n    } else={\r\
    \n        :log error \"Isi file terlalu besar untuk dikirim sebagai teks (\
    Limit 4KB).\"\r\
    \n        :log info \"Mencoba mengirim potongan kecil saja...\"\r\
    \n        \r\
    \n        # Jika file terlalu besar, kirim pesan status saja\r\
    \n        /tool fetch url=\"https://api.telegram.org/bot\$botToken/sendMes\
    sage\?chat_id=\$chatId&text=Backup+\$identitas+terlalu+besar+untuk+teks.+G\
    unakan+Email+saja.\" check-certificate=no\r\
    \n    }\r\
    \n} else={\r\
    \n    :log error \"File tidak ditemukan.\"\r\
    \n}"
add dont-require-permissions=no name=AutoEmailRSC owner=alijayanet policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    log info \"mulai backup\"\r\
    \n\r\
    \n# --- KONFIGURASI TELEGRAM ---\r\
    \n:local bToken \"2138277971:AAEQmJ5ziNca6VAJp_8hiXBbkLeUkregdt4\"\r\
    \n:local cId \"567858628\"\r\
    \n\r\
    \n# --- PROSES NAMA FILE ---\r\
    \n:local date [/system clock get date]\r\
    \n:local time [/system clock get time]\r\
    \n:local d [:pick \$date 4 6]\r\
    \n:local m [:pick \$date 0 3] \r\
    \n:local y [:pick \$date 7 11]\r\
    \n\r\
    \n# Menghapus karakter \":\" pada jam agar tidak error di beberapa sistem\
    \r\
    \n:local hh [:pick \$time 0 2]\r\
    \n:local mm [:pick \$time 3 5]\r\
    \n:local ss [:pick \$time 6 8]\r\
    \n:local jamClean \"\$hh-\$mm-\$ss\"\r\
    \n\r\
    \n:local filename (\"Backup-HAP-AC2-Kintachips-\" . \$jamClean . \"-\" . \
    \$m . \"-\" . \$d . \"-\" . \$y)\r\
    \n\r\
    \n# --- PROSES EXPORT ---\r\
    \n/export file=\$filename\r\
    \n:log info \"jeda backup selama 20 detik\"\r\
    \n:delay 20s\r\
    \n\r\
    \n# --- PENGIRIMAN EMAIL ---\r\
    \n:log info \"backup dikirim ke email\"\r\
    \n/tool e-mail send \\\r\
    \n    to=alijayanet@gmail.com \\\r\
    \n    cc=alijayahotspot@gmail.com \\\r\
    \n    subject=(\"Backup \" . [/system identity get name] . \" \" . \$date \
    . \" pukul-\" . \$time) \\\r\
    \n    body=(\"Backup terakhir tanggal \" . \$date . \" pukul-\" . \$time .\
    \_\" file: \$filename.rsc\") \\\r\
    \n    file=\"\$filename.rsc\" \\\r\
    \n    start-tls=yes\r\
    \n\r\
    \n:delay 20s\r\
    \n\r\
    \n# --- NOTIFIKASI TELEGRAM ---\r\
    \n:log info \"mengirim notifikasi ke telegram\"\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bToken/sendMessage\?chat\
    _id=\$cId&text=%E2%9C%85+Notifikasi:+Backup+RSC+[\$filename]+telah+dikirim\
    +ke+Email+alijayanet@gmail.com\" check-certificate=no\r\
    \n\r\
    \n# --- PEMBERSIHAN ---\r\
    \n/file remove [find name=\"\$filename.rsc\"]\r\
    \n:log info \"backup selesai\""
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kangcas \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    51
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    indri@ujungmulya owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1174
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=diva owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    85
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=home owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    11
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=kanol@tjp \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    33
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    fhergunawan@genjong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    110
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    robert@warunglaut owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    221
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nyamung \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    63
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    rasta@empang owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    377
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    server@naela owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    21
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    sofyan@genjong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    41
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=anitarsiti@ \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    21
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=nalda \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    16
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    gina@genjong owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    45
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=devano@laut \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=2
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=\
    jarwo@ujungmulya owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    36
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=agus owner=\
    *sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    37
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=serverhome \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    19
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=darsono \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=6
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=ujungmulya \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    12
add comment="CEK TOTAL GANGGUAN" dont-require-permissions=no name=karbani \
    owner=*sys policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=1
/tool e-mail
set address=smtp.gmail.com from=alijayatv@gmail.com password=\
    "hpyc malt mozh pqak" port=587 start-tls=yes user=alijayatv@gmail.com
/tool netwatch
add comment="LINK SERVER" down-script="/tool fetch http-header-field=\"content\
    -type: application/x-www-form-urlencoded\" http-method=post http-data=\"nu\
    mber=081947215703&message=SERVER HOTSPOT DOWN\" url=\"http://103.190.28.10\
    1/send-message\" keep-result=no" host=192.168.100.1 up-script="/tool fetch\
    \_http-header-field=\"content-type: application/x-www-form-urlencoded\" ht\
    tp-method=post http-data=\"api_key=Dd2az2yx5O36YfVboT0ieNKkgtnkJT&sender=6\
    28781947215703&number=6287820851413&message=CLIENT TEST TERHUBUNG url=\"ht\
    tps://wa.alijaya.net/send-message\" keep-result=no;}}\r\
    \n"
add down-script="/tool fetch http-header-field=\"content-type: application/x-w\
    ww-form-urlencoded\" http-method=post http-data=\"number=081947215703&mess\
    age=SERVER ULIZNET DOWN\" url=\"http:/103.190.28.101/send-message\" keep-r\
    esult=no" host=103.175.238.126 up-script="/tool fetch http-header-field=\"\
    content-type: application/x-www-form-urlencoded\" http-method=post http-da\
    ta=\"number=081947215703&message=SERVER ULIZNET NORMAL\" url=\"http://103.\
    190.28.101/send-message\" keep-result=no"
/tool romon
set enabled=yes secrets=060111
/tool traffic-monitor
add disabled=yes interface=ether1-ISP name=tmon1 on-event=":local CurDate [/sy\
    stem clock get date]\r\
    \n:local CurTime [/system clock get time]\r\
    \n:log warning \"Kecepatan Download Lebih Dari 150 Mbps\"\r\
    \n\r\
    \n/tool fetch http-header-field=\"content-type: application/x-www-form-url\
    encoded\" http-method=post http-data=\"phone=120363152915962417&message=Tr\
    afik Monitor \$CurDate \$CurTime Sudah lebih dari 150Mbps\" url=\"http://1\
    92.168.8.164:3000//send/message\" keep-result=no;" threshold=150000000 \
    traffic=received
add disabled=yes interface=ether1-ISP name=tmon2 on-event=":local CurDate [/sy\
    stem clock get date]\r\
    \n:local CurTime [/system clock get time]\r\
    \n:log warning \"Kecepatan Download Lebih Dari 150 Mbps\"\r\
    \n\r\
    \n/tool fetch url=\"https://api.telegram.org/bot2099790593:AAGgDoUpg5GMbe3\
    _rkV9Fd6jsADqzgfdCeE/sendMessage\?chat_id=567858628&text='Traffick Upload \
    Internet Di \$CurDate \$CurTime Sudah Lebih Dari 50 Mbps Gan\" keep-result\
    =no" threshold=50000000
add disabled=yes interface=ether1-ISP name=tmon3 on-event="/tool fetch http-he\
    ader-field=\"content-type: application/x-www-form-urlencoded\" http-method\
    =post http-data=\"api_key=q5K2wUFzcsrOR8Ocob6wORqNoW9wmu&sender=6287820851\
    413&number=120363031495796203@g.us&message=Test Kirim Trafik Monitor\" url\
    =\"\"https://wa.smkmaarif2temon.sch.id/send-message\" keep-result=no;" \
    threshold=150000000 traffic=received
add disabled=yes interface=ether1-ISP name=tmon4 on-event="/tool fetch http-he\
    ader-field=\"content-type: application/x-www-form-urlencoded\" http-method\
    =post http-data=\"api_key=q5K2wUFzcsrOR8Ocob6wORqNoW9wmu&sender=6287820851\
    413&number=1203630152915962417@g.us&message=Test Kirim Trafik Monitor\" ur\
    l=\"\"https://wa.smkmaarif2temon.sch.id/send-message\" keep-result=no;" \
    threshold=150000000 traffic=received
