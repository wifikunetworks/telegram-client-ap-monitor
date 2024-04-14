:local telegramBotToken "7037802497:AAGWNH_XSfeJXqUBhAwq1Q7kgIM7P-oZAIs"
:local chatId1 "919256852"
:local chatId2 "1239274181"

:local owners {
    "Memos"="172.16.0.2";
    "Wanda"="172.16.0.3";
    "Toko Wulan"="172.16.0.4";
    "Marunda"="172.16.0.5";
    "Kentung"="172.16.0.6";
    "Nurgaya"="172.16.0.7";
    "Dewi Marno"="172.16.0.8";
    "Yanto Marno"="172.16.0.9";
    "Dhea"="172.16.0.10";
    "Mama Ika"="172.16.0.11";
    "Atik"="172.16.0.12";
    "KIKI"="172.16.0.13";
    "Adi Simpang"="172.16.0.14";
    "Shindy"="172.16.0.15";
    "Zyana Laundry"="172.16.0.16";
    "Rudi"="172.16.0.17";
    "Eva"="172.16.0.18";
    "Sudar"="172.16.0.19";
    "Mandoge"="172.16.0.20";
    "Hendro"="172.16.0.21";
    "Debbie Rasyid"="172.16.0.22";
    "Yono"="172.16.0.23";
    "Jumi"="172.16.0.24";
    "Yusi"="172.16.0.25";
    "Yasmin"="172.16.0.26";
    "Salma"="172.16.0.27";
    "Kendro"="192.168.4.2";
    "Nigsih"="192.168.4.3";
    "Sahadi"="192.168.4.4";
    "Eka Wulan"="192.168.4.5";
    "Yudi Bengkel"="192.168.4.6";
    "Delio"="192.168.4.7";
}

:local currentDate [/system clock get date]
:local currentMonth [:pick $currentDate 0 3]
:local currentDay [:pick $currentDate 4 6]
:local currentYear [:pick $currentDate 7 11]

:local currentTime [/system clock get time]
:local currentHour [:pick $currentTime 0 2]
:local currentMinute [:pick $currentTime 3 5]
:local currentSecond [:pick $currentTime 6 8]

:local monthName;
:if ($currentMonth = "jan") do={:set monthName "Januari"}
:if ($currentMonth = "feb") do={:set monthName "Februari"}
:if ($currentMonth = "mar") do={:set monthName "Maret"}
:if ($currentMonth = "apr") do={:set monthName "April"}
:if ($currentMonth = "may") do={:set monthName "Mei"}
:if ($currentMonth = "jun") do={:set monthName "Juni"}
:if ($currentMonth = "jul") do={:set monthName "Juli"}
:if ($currentMonth = "aug") do={:set monthName "Agustus"}
:if ($currentMonth = "sep") do={:set monthName "September"}
:if ($currentMonth = "oct") do={:set monthName "Oktober"}
:if ($currentMonth = "nov") do={:set monthName "November"}
:if ($currentMonth = "dec") do={:set monthName "Desember"}

:local datetime ("Tanggal: " . $currentDay . " " . $monthName . " " . $currentYear . "%0APukul: " . $currentHour . ":" . $currentMinute . ":" . $currentSecond . " WIB")

:foreach owner,host in=$owners do={
    :local offlineCount 0
    :for i from=1 to=5 do={
        :local status [/ping $host count=1]
        :if ($status = 0) do={
            :set offlineCount ($offlineCount + 1)
        }
    }
    :if ($offlineCount = 5) do={
        :local offlineMessage ("Akses point " . $host . " (" . $owner . ") offline \E2\9D\8C %0A" . $datetime . "%0AMohon segera lakukan pengecekan!")
        /tool fetch url=("https://api.telegram.org/bot" . $telegramBotToken . "/sendMessage\?chat_id=" . $chatId1 . "&text=" . $offlineMessage) mode=https
        /tool fetch url=("https://api.telegram.org/bot" . $telegramBotToken . "/sendMessage\?chat_id=" . $chatId2 . "&text=" . $offlineMessage) mode=https
    }
}
