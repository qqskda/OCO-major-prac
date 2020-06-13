$today_date = get-date -format yyyy-MM-dd-T-HH-mm
$txt_file = "usb_encryption" + $today_date
$txt_file_2 = "usb_encryption2_" + $today_date
$txt_file_3 = "usb_encryption3_" + $today_date

$folderName = "usb_encoder"
$root_pwd = (Resolve-Path .\).Path
$current_pwd = Join-Path $root_pwd $folderName 
$Path = Join-Path $current_pwd $txt_file
$Path_2 = Join-Path $current_pwd $txt_file_2
$Path_3 = Join-Path $current_pwd $txt_file_3
  if(!(Test-Path -Path $current_pwd )){
    New-Item $folderName -ItemType Directory | %{$_.Attributes = "hidden"}
  }
Get-ChildItem Z:\*\*\*\ > $Path
Get-ChildItem Z:\*\*\ > $Path_2

# https://stackoverflow.com/questions/31057946/out-file-inside-a-foreach-statement
$startFolder = "Z:";
$totalSize = 0;

$colItems = Get-ChildItem $startFolder
foreach ($i in $colItems)
{
    foreach ($j in $i)
    {
        $subFolderItems = Get-ChildItem $j.FullName -recurse -force | Where-Object {$_.PSIsContainer -eq $false} | Measure-Object -property Length -sum | Select-Object Sum
        $inMb = $subFolderItems.sum / 1MB
        $j.FullName+ " | " + "{0:N2}" -f ($inMb) + " MB" | Add-Content $Path_3
        $totalSize = $totalSize + $inMb
    }
} 
$startFolder + " | " + "{0:N2}" -f ($totalSize) + " MB" | Add-Content $Path_3


