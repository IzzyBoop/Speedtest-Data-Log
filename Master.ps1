$date = get-date -f yyyy-MM-dd

.\speedtest.exe --format=json-pretty > "Results\results_$($date).json"

$path = "Your Path"

$data = Get-Content -Raw -Path "$($Path)\Results\results_$($date).json" | ConvertFrom-Json

$ping = [math]::round($data.ping.latency,2)
$downloadMbits = [math]::round(($data.download.bytes / 125000) / ($data.download.elapsed / 1000),2)
$uploadMbits = [math]::round(($data.upload.bytes / 125000) / ($data.upload.elapsed / 1000),2)

Add-Content "$($Path)\Results\Results Master.txt" "Date: $date | Download: $downloadMbits | Upload: $uploadMbits | Ping: $ping `n"
