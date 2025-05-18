

$scriptPath = $MyInvocation.MyCommand.Definition
$scriptDir = Split-Path -Parent $scriptPath
Set-Location -Path $scriptDir


# Yönetici olarak çalışmıyorsa kendini yeniden başlat
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
}


chcp 65001

function Show-Menu {
    Write-Host "1: GPRESULT ile rapor çıkart"
    Write-Host "2: DSREGCMD /status ile Enrollment Status getir"
    Write-Host "3: DSREGCMD /leave ile Enrollment kaldır"
    Write-Host "4: Enrollment Registry kayıtlarını kaldır"
    Write-Host "5: GPUPDATE /Force ile Group Policy al"
    Write-Host "6: Auto Enrollment Task'ını çalıştır"
    Write-Host "Q: Çıkış"
}


function Run-Bat {
    param (
        [string]$batFile
    )
    $fullPath = Join-Path -Path $scriptDir -ChildPath $batFile
    if (Test-Path $fullPath) {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/k `"$fullPath`"" 
    } else {
        Write-Host "`nHATA: '$batFile' bulunamadı. Lütfen dosyanın script ile aynı klasörde olduğundan emin olun.`n" -ForegroundColor Red
    }
}

while ($true) {
    Show-Menu
    $choice = Read-Host "Bir seçenek girin (1-6 veya Q)"
    
    switch ($choice) {
        "1" { Run-Bat -batFile "1-GPRESULT-HTML-REPORT.bat" }
        "2" { Run-Bat -batFile "2-DSREGCMD-Status.bat" }
        "3" { Run-Bat -batFile "3-DSREGCMD-Leave.bat" }
        "4" { Run-Bat -batFile "4-Enrollments-Registry-Delete.bat" }
        "5" { Run-Bat -batFile "5-GPUPDATE-FORCE.bat" }
        "6" { Run-Bat -batFile "6-Auto-Enrollment-Task.bat" }
        "Q" { break }
        default { Write-Host "Geçersiz seçenek, lütfen tekrar deneyin." }
    }
}
