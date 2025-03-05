# Użytkownik może zdefiniować własny edytor, jeśli nie poda - domyślnie micro
$global:EDITOR_CMD = if ($env:EDITOR) { $env:EDITOR } else { "micro" }

# Funkcja fpp - wyszukuje pliki po nazwie
function fpp {
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz plik: "

    if ($file) {
        Write-Host "Wybrano plik: $file"
    }
}

# Funkcja fee - wyszukuje pliki po rozszerzeniu
function fee {
    $ext = Read-Host "Podaj rozszerzenie pliku (np. txt, py, log)"
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force -Filter "*.$ext" |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz plik: "

    if ($file) {
        Write-Host "Wybrano plik: $file"
    }
}

# Funkcja cdd - wyszukuje katalogi i przenosi do wybranego, zawsze pokazuje katalog domowy
function cdd {
    $dirs = Get-ChildItem -Path $HOME -Recurse -Directory -Force |
        ForEach-Object { $_.FullName }
    $dirs += $HOME  # Dodanie katalogu domowego na końcu listy

    $dir = $dirs | fzf --exact --prompt "Wybierz katalog: "

    if ($dir) {
        Set-Location $dir
        Get-Location
    }
}

# Funkcja mc - alias dla wybranego edytora
Set-Alias mc $global:EDITOR_CMD

# Funkcja mcc - wyszukuje pliki i otwiera wybrany w edytorze
function mcc {
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz plik do edycji: "

    if ($file) {
        & $global:EDITOR_CMD $file
    }
}

# Funkcja fdd - wyszukuje katalogi i wyświetla ich zawartość (`dir`)
function fdd {
    $dirs = Get-ChildItem -Path $HOME -Recurse -Directory -Force |
        ForEach-Object { $_.FullName }
    $dirs += $HOME  # Dodanie katalogu domowego na końcu listy

    $dir = $dirs | fzf --exact --prompt "Wybierz katalog: "

    if ($dir) {
        Write-Host "Zawartość katalogu: $dir"
        Get-ChildItem -Path $dir
    }
}

# Eksport funkcji, aby działały w bieżącej sesji
# Set-Alias fpp fpp
# Set-Alias fee fee
# Set-Alias cdd cdd
# Set-Alias mcc mcc
# Set-Alias fdd fdd

