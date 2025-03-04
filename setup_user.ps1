# ================== KONFIGURACJA ==================
# Nazwa nowego użytkownika (zmień według potrzeb)
$user = "test1"

# Grupa użytkownika (Users lub Administrators)
$group = "Users"

# ================== TWORZENIE KONTA ==================
Write-Host "Tworzenie nowego użytkownika: $user"

# Sprawdzenie, czy użytkownik już istnieje
if (Get-LocalUser -Name $user -ErrorAction SilentlyContinue) {
    Write-Host "Użytkownik $user już istnieje!"
} else {
    # Tworzenie konta bez hasła
    New-LocalUser -Name $user -NoPassword -Description "Konto deweloperskie"

    # Ustawienie, aby konto NIE wymagało hasła
    wmic useraccount where name="$user" set PasswordRequired=False
    wmic useraccount where name="$user" set PasswordExpires=False

    Write-Host "Użytkownik $user został utworzony BEZ wymogu hasła."

    # Dodanie użytkownika do grupy
    Add-LocalGroupMember -Group $group -Member $user
    Write-Host "Użytkownik dodany do grupy: $group"
}

# ================== WYŁĄCZENIE WYMOGU LOGOWANIA HASŁEM ==================
Write-Host "Wyłączanie wymogu podawania hasła przy logowaniu..."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v dontdisplaylastusername /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableAutomaticRestartSignOn /t REG_DWORD /d 1 /f

# Wyłączenie wymogu podania hasła w systemie Windows
cmd /c "control userpasswords2"
cmd /c "netplwiz"

Write-Host "System NIE będzie wymagał hasła przy logowaniu!"

# ================== WŁĄCZENIE TRYBU DEWELOPERA ==================
Write-Host "Aktywowanie trybu dewelopera..."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v AllowDevelopmentWithoutDevLicense /t REG_DWORD /d 1 /f
Write-Host "Tryb dewelopera włączony"

# ================== USTAWIENIA SYSTEMOWE ==================
Write-Host "Włączanie widoczności rozszerzeń plików..."
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
Write-Host "Rozszerzenia plików są teraz widoczne"

# ================== ZAKOŃCZENIE ==================
Write-Host "Konfiguracja zakończona! Możesz teraz zalogować się na konto: $user bez hasła."
