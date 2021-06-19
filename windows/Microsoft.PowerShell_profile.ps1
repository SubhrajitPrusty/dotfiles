$env:PYTHONIOENCODING="utf-8"
$env:PYTHONUNBUFFERED=1
$MyDocuments = [environment]::getfolderpath("mydocuments")
function subl { &"${Env:ProgramFiles}\Sublime Text 3\sublime_text.exe" $args }
function cdx { cd "$MyDocuments\CDX" }

Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme stelbent.minimal
