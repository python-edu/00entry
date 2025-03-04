# ================== KONFIGURACJA ==================
# Nazwa nowego użytkownika
$user = "test1"

# Grupa użytkownika (Users lub Administrators)
$group = "Users"

# ================== TWORZENIE KONTA ==================
Write-Host "Tworzenie nowego użytkownika: $user"

# Sprawdzenie, czy użytkownik już istnieje
if (Get-LocalUser -Name $user -ErrorAction SilentlyContinue) {
    Write-Host "Użytkownik $user już istnieje!"
} else {
    # Tworzenie konta lokalnego (bez hasła)
    New-LocalUser -Name $user -NoPassword -Description "Konto deweloperskie"
    Write-Host "Użytkownik $user został utworzony."

    # Dodanie użytkownika do grupy
    Add-LocalGroupMember -Group $group -Member $user
    Write-Host "Użytkownik dodany do grupy: $group"
}

# ================== KONFIGURACJA POWERSHELL ==================
Write-Host "Konfiguracja PowerShell..."

# Ustawienie polityki uruchamiania skryptów
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
Write-Host "Polityka uruchamiania skryptów ustawiona na RemoteSigned"

# Ustawienie terminala na PowerShell
$terminalSettingsPath = "C:\Users\$user\AppData\Local\Microsoft\Windows Terminal\settings.json"
if (-Not (Test-Path $terminalSettingsPath)) {
    New-Item -Path $terminalSettingsPath -ItemType File -Force
}

# Konfiguracja terminala
$terminalConfig = @"
{
    "defaultProfile": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
    "profiles": {
        "defaults": {
            "fontFace": "Cascadia Code",
            "tabTitle": "PowerShell",
            "useAcrylic": true,
            "opacity": 85
        }
    }
}
"@
$terminalConfig | Set-Content -Path $terminalSettingsPath -Encoding UTF8
Write-Host "Terminal skonfigurowany na PowerShell"

# ================== WŁĄCZENIE TRYBU DEWELOPERA ==================
Write-Host "Aktywowanie trybu dewelopera..."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v AllowDevelopmentWithoutDevLicense /t REG_DWORD /d 1 /f
Write-Host "Tryb dewelopera włączony"

# ================== USTAWIENIA SYSTEMOWE ==================
Write-Host "Włączanie widoczności rozszerzeń plików..."
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
Write-Host "Rozszerzenia plików są teraz widoczne"

# ================== ZAKOŃCZENIE ==================
Write-Host "Konfiguracja zakończona! Możesz teraz zalogować się na konto: $user"

