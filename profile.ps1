# Set the default editor (User can change it)
$global:EDITOR_CMD = "micro"  # Change to your preferred editor (e.g., "notepad", "vim", "code")

# Function to prompt user for a search pattern
function Get-Pattern {
    param ([string]$message)
    Write-Host "$message" -ForegroundColor Cyan -NoNewline
    $pattern = Read-Host
    return $pattern
}

# Function nvv - Search and open files with the preferred editor
function nvv {
    $pattern = Get-Pattern "📂 Enter search pattern for files (regex supported): "
    $file = Get-ChildItem -Path $HOME -Recurse -File -Force | Where-Object { $_.Name -match $pattern } | ForEach-Object { $_.FullName } | fzf --exact --prompt "📂 Select a file: "
    if ($file) { & $global:EDITOR_CMD $file }
}

# Function cdd - Search and navigate to a directory
function cdd {
    $pattern = Get-Pattern "📁 Enter search pattern for directories (regex supported): "
    $dir = Get-ChildItem -Path $HOME -Recurse -Directory -Force | Where-Object { $_.Name -match $pattern } | ForEach-Object { $_.FullName } | fzf --exact --prompt "📁 Select a directory: "
    if ($dir) { Set-Location $dir; Get-Location }
}

# Function fdd - Search and display a tree view of the selected directory (2 levels)
function fdd {
    $pattern = Get-Pattern "📁 Enter search pattern for directories (regex supported): "
    $dir = Get-ChildItem -Path $HOME -Recurse -Directory -Force | Where-Object { $_.Name -match $pattern } | ForEach-Object { $_.FullName } | fzf --exact --prompt "📁 Select a directory: "
    if ($dir) {
        Write-Host "📂 Selected directory tree: $dir" -ForegroundColor Yellow
        tree /F /A "$dir" | Out-Host
    }
}

# Export functions for usage in the current session
# Set-Alias nvv nvv
# Set-Alias cdd cdd
# Set-Alias fdd fdd

