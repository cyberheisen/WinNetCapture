$etl_file = ".\NetTrace.etl"
$trace_start = "netsh trace start capture=yes tracefile=" + $etl_file
$trace_stop = "netsh trace stop"
$etl2pcap = ".\etl2pcapng "
$start_results = Invoke-Expression -Command $trace_start

$start_results
Write-Host "Press any key to end the packet trace"
$null = $Host.UI.RawUI.Readkey('NoEcho, IncludeKeyDown')
Write-Host "Stopping trace"

$end_results = Invoke-Expression -command $trace_stop
$end_results
Write-Host "Converting ETL file to pcap format"

$etl_convert = Invoke-Expression -command $etl2pcap + $etl_file
Write-Host $etl_convert

