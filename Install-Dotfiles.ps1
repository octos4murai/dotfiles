#!/usr/bin/env pwsh

param (
    [Parameter(Mandatory = $true)]
    [ValidateScript({Test-Path $_ -PathType Leaf})]
    [string]
    $ConfigPath,

    [Parameter(Mandatory = $true)]
    [ValidateSet("macos", "windows")]
    [string]
    $ProfileName
)

Get-Content $ConfigPath |
ConvertFrom-Json |
Select-Object -ExpandProperty "items" |
ForEach-Object {
    if ($_.profile -eq $ProfileName) {
        $itemProps = @{
            Path   = $ExecutionContext.InvokeCommand.ExpandString($_.path)
            Target = $ExecutionContext.InvokeCommand.ExpandString($_.target)
        }

        if (!(Test-Path -Path $($itemProps.Path) -IsValid)) {
            "The given path is not valid: '$($itemProps.Path)'."
            continue
        }

        if (!(Test-Path $($itemProps.Target))) {
            "The given target cannot be found: '$($itemProps.Target)'."
            continue
        }

        New-Item @itemProps -ItemType SymbolicLink -Force
    }
}
