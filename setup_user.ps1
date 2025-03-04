# ================== CONFIGURATION ==================
# New user name (change as needed)
$user = "test3"

# User group (Users or Administrators)
$group = "Users"

# ================== DISABLING PASSWORD REQUIREMENT ==================
Write-Host "Disabling Windows password requirement..."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
Write-Host "Windows will NOT require a password for local accounts."

# ================== CREATING THE USER ==================
Write-Host "Creating new user: $user"

# Check if the user already exists
if (Get-LocalUser -Name $user -ErrorAction SilentlyContinue) {
    Write-Host "User $user already exists!"
} else {
    # Create a local user account WITHOUT a password
    New-LocalUser -Name $user -NoPassword -Description "Developer account"

    # Disable password requirement
    wmic useraccount where name="$user" set PasswordRequired=False
    wmic useraccount where name="$user" set PasswordExpires=False

    # Add the user to the specified group
    Add-LocalGroupMember -Group $group -Member $user

    Write-Host "User $user created WITHOUT password requirement and added to group: $group"
}

# ================== SKIPPING FIRST LOGIN SETUP ==================
Write-Host "Skipping first login setup..."

# Automatically accept privacy settings and disable first logon animation
reg load HKU\Default C:\Users\Default\NTUSER.DAT
reg add "HKU\Default\Software\Microsoft\Windows\CurrentVersion\OOBE" /v DisablePrivacyExperience /t REG_DWORD /d 1 /f
reg add "HKU\Default\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f
reg unload HKU\Default

Write-Host "Windows first-time setup screen skipped."

# ================== SYSTEM SETTINGS ==================
Write-Host "Configuring system settings..."

# 1️⃣ Enable Developer Mode
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v AllowDevelopmentWithoutDevLicense /t REG_DWORD /d 1 /f
Write-Host "Developer Mode enabled."

# 2️⃣ Enable file extensions visibility
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
Write-Host "File extensions are now visible."

# 3️⃣ Set DARK theme for Windows and applications
Write-Host "Setting Windows dark theme..."
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
Write-Host "Dark theme activated."

# 4️⃣ Configure Windows Terminal with PowerShell, dark theme, and tabs
Write-Host "Configuring Windows Terminal..."
$terminalSettingsPath = "C:\Users\Default\AppData\Local\Microsoft\Windows Terminal\settings.json"
if (-Not (Test-Path $terminalSettingsPath)) {
    New-Item -Path $terminalSettingsPath -ItemType File -Force
}
$terminalConfig = @"
{
    "defaultProfile": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
    "profiles": {
        "defaults": {
            "fontFace": "Cascadia Code",
            "tabTitle": "PowerShell",
            "useAcrylic": true,
            "opacity": 85,
            "colorScheme": "Campbell"
        }
    }
}
"@
$terminalConfig | Set-Content -Path $terminalSettingsPath -Encoding UTF8
Write-Host "Windows Terminal configured with PowerShell, dark theme, and tab support."

# ================== COMPLETION ==================
Write-Host "Configuration completed! You can now log into the account: $user without a password, with dark theme and developer mode enabled."

