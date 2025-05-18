

$scriptPath = $MyInvocation.MyCommand.Definition
$scriptDir = Split-Path -Parent $scriptPath
Set-Location -Path $scriptDir


# Yönetici olarak çalışmıyorsa kendini yeniden başlat
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
}


echo "Choose an option which perform would like to do ?"

function Show-Menu {
    Write-Host "1: Get GPO HTML report"
    Write-Host "2: Get status of Enrollment with DSREGCMD /status "
    Write-Host "3: Unjoin Enrollment with DSREGCMD /leave"
    Write-Host "4: Delete Enrollment Registry"
    Write-Host "5: Execute GPUPDATE /Force"
    Write-Host "6: Execute Auto Enrollment Task"
    Write-Host "Q: Quit"
}


function Run-Bat {
    param (
        [string]$batFile
    )
    $fullPath = Join-Path -Path $scriptDir -ChildPath $batFile
    if (Test-Path $fullPath) {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/k `"$fullPath`"" 
    } else {
        Write-Host "`nHATA: '$batFile' couldn't find. Please be sure bat file in same script folder.`n" -ForegroundColor Red
    }
}

while ($true) {
    Show-Menu
    $choice = Read-Host "Chosee an option (1-6 veya Q)"
    
    switch ($choice) {
        "1" { Run-Bat -batFile "1-GPRESULT-HTML-REPORT.bat" }
        "2" { Run-Bat -batFile "2-DSREGCMD-Status.bat" }
        "3" { Run-Bat -batFile "3-DSREGCMD-Leave.bat" }
        "4" { Run-Bat -batFile "4-Enrollments-Registry-Delete.bat" }
        "5" { Run-Bat -batFile "5-GPUPDATE-FORCE.bat" }
        "6" { Run-Bat -batFile "6-Auto-Enrollment-Task.bat" }
        "Q" { break }
        default { Write-Host "Invalid option, please try again." }
    }
}
