::Powershell:Futtatás engedélyezése
powershell Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -force
::powershell New-PSDrive HKCR Registry HKEY_CLASSES_ROOT
::powershell Set-ItemProperty HKCR:\Microsoft.PowerShellScript.1\Shell '(Default)' 0