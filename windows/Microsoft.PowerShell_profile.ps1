function subl { &"${Env:ProgramFiles}\Sublime Text 3\sublime_text.exe" $args }
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Custom
$env:PYTHONIOENCODING="utf-8"
$env:PYTHONUNBUFFERED=1
$MyDocuments = [environment]::getfolderpath("mydocuments")