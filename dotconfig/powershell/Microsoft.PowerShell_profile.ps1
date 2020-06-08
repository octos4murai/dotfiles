# Keep this up-to-date: https://gist.github.com/octos4murai/12641e1c44fc031e689133e9a77c7b0d.

function Prompt {
    $signature = @{
        Object          = "-octos4murai-"
        NoNewline       = $true
        ForegroundColor = "White"
        BackgroundColor = "DarkGray"
    }

    Write-Host @signature
    " /" + (Get-Item -Path ".").Name + " > "
}