$today_date = get-date -format yyyy-MM-dd-T-HH-mm
$txt_file = "usb_encryption" + $today_date

$folderName = "usb_encoder"
$root_pwd = (Resolve-Path .\).Path
$current_pwd = Join-Path $root_pwd $folderName 
$Path = Join-Path $current_pwd $txt_file

if(!(Test-Path -Path $current_pwd )){
    New-Item $folderName -ItemType Directory | %{$_.Attributes = "hidden"}
}

# https://stackoverflow.com/a/40614022
$name = $path + '.rar'
  . "C:\Program Files\WinRAR\winrar.exe" a -r -ep $path "Z:\Company_D"
