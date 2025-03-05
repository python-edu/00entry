# Ustawienie domyślnego edytora (można zmienić na dowolny inny, np. "notepad", "vim", "code")
$global:EDITOR_CMD = "micro"

# Funkcja nvv - wyszukiwanie plików i otwieranie w wybranym edytorze
function nvv {
    $pattern = Read-Host "Wpisz wzorzec wyszukiwania dla plików (obsługuje regex)"
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force |
        Where-Object { $_.Name -match $pattern } |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz plik: "

    if ($file) {
        & $global:EDITOR_CMD $file
    }
}

# Funkcja cdd - wyszukiwanie katalogów i przechodzenie do wybranego katalogu
function cdd {
    $pattern = Read-Host "Wpisz wzorzec wyszukiwania dla katalogów (obsługuje regex)"
    $dir = Get-ChildItem -Path $HOME -Recurse -Directory -Force |
        Where-Object { $_.Name -match $pattern } |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz katalog: "

    if ($dir) {
        Set-Location $dir
        Get-Location
    }
}

# Funkcja fdd - wyszukiwanie katalogów i wyświetlenie ich drzewa (2 poziomy zagnieżdżenia)
function fdd {
    $pattern = Read-Host "Wpisz wzorzec wyszukiwania dla katalogów (obsługuje regex)"
    $dir = Get-ChildItem -Path $HOME -Recurse -Directory -Force |
        Where-Object { $_.Name -match $pattern } |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz katalog: "

    if ($dir) {
        Write-Host "Wybrane drzewo katalogu: $dir" -ForegroundColor Yellow
        tree /F /A "$dir" | Out-Host
    }
}

# Eksport funkcji, aby działały w bieżącej sesji
# Set-Alias nvv nvv
# Set-Alias cdd cdd
# Set-Alias fdd fdd

