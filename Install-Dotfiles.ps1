#!/usr/bin/env pwsh

# PowerShell
$sourcePath = "$HOME/.config"
if (Test-Path $sourcePath) {
    Remove-Item -Recurse -Force -Confirm -Path $sourcePath
}

New-Item -ItemType SymbolicLink -Path $sourcePath -Target "$HOME/Public/Workspace/dotfiles/dotconfig"

