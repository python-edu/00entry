# User can define his own editor, if not specified - default is micro
EDITOR_CMD = nvim

$global:EDITOR_CMD = if ($env:EDITOR) { $env:EDITOR } else { "micro" }


# fpp function - searches for files by name
function fpp {
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz plik: "

    if ($file) {
        Write-Host "Wybrano plik: $file"
    }
}


# fee function - searches for files by extension
function fee {
    $ext = Read-Host "Podaj rozszerzenie pliku (np. txt, py, log)"
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force -Filter "*.$ext" |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz plik: "

    if ($file) {
        Write-Host "Wybrano plik: $file"
    }
}


# cdd function - searches directories and moves to the selected one
function cdd {
    $dirs = Get-ChildItem -Path $HOME -Recurse -Directory -Force |
        ForEach-Object { $_.FullName }
    $dirs = $dirs + $HOME  # Katalog domowy zawsze na końcu listy

    $dir = $dirs | fzf --exact --prompt "Wybierz katalog: "

    if ($dir) {
        Set-Location $dir
        Get-Location
    }
}


# mc - alias for selected editor
Set-Alias mc $global:EDITOR_CMD


# mcc function - searches for files and opens the selected one in the editor
function mcc {
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force |
        ForEach-Object { $_.FullName } |
        fzf --exact --prompt "Wybierz plik do edycji: "

    if ($file) {
        & $global:EDITOR_CMD $file
    }
}


# fdd function - searches directories and displays their contents (`dir`),
function fdd {
    $dirs = Get-ChildItem -Path $HOME -Recurse -Directory -Force |
        ForEach-Object { $_.FullName }
    $dirs = $dirs + $HOME  # Katalog domowy zawsze na końcu listy

    $dir = $dirs | fzf --exact --prompt "Wybierz katalog: "

    if ($dir) {
        Write-Host "Zawartość katalogu: $dir"
        Get-ChildItem -Path $dir
    }
}


