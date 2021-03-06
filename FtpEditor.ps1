###############xxxx Made by prhckspc xxxx##################
##############################################
###///~~~~~~~~~\\\###
###==>FtpEditor<==###
###\\\~~~~~~~~~///###
#####################

##Moduls##
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
##Hide PowerShell Console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

[System.Windows.Forms.Application]::EnableVisualStyles()


##Declarated values import
. .\MainVars.ps1
##New window
function Miniform ($adat,$type){
$FormMini = New-Object System.Windows.Forms.Form
$FormMini.Size = New-Object System.Drawing.Size(700,720)
$FormMini.StartPosition = "CenterScreen"
$FormMini.Topmost = $True
#LabelPic
$LabelMini = New-Object System.Windows.Forms.Label
$LabelMini.Location = New-Object System.Drawing.Point(45,10)
$LabelMini.Size = New-Object System.Drawing.Size(400,20)
$InputMini = New-Object System.Windows.Forms.TextBox
#InputPic
$InputMini.Multiline = $true
$InputMini.Size = New-Object System.Drawing.Size(600,600)
$InputMini.Location = New-Object System.Drawing.Point(45,60)
$InputMini.Text = $adat
$InputMini.AutoSize = $True
$InputMini.ScrollBars = "Vertical"

$SaveMini = New-Object System.Windows.Forms.Button
$SaveMini.Size = New-Object System.Drawing.Size(50,30)
$SaveMini.Location = New-Object System.Drawing.Point(45,30)
$SaveMini.Text = "Save"

$FormMini.Controls.Add($LabelMini)
$FormMini.Controls.Add($InputMini)
$FormMini.Controls.Add($SaveMini)

##Conditions with "$type"
if($type -match "$json_name1")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file1";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name2")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file2";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name3")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file3";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name4")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file4";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name5")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file5";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name6")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file6";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name7")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file7";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name8")
{

$SaveMini.add_Click({$InputMini.Text > "$json_file8";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}

if($type -match "$json_name9")
{
$SaveMini.add_Click({$InputMini.Text > "$json_file9";uploadJsons;$FormMini.Close();$cancel = $true;})
$resultmini = $FormMini.ShowDialog()
}
}

##Renamer function :D
function Renamer($start_szam) {
$myArray = @()
##Temp File
$tmpText = "$picture_temp_file"
##File numbering
$fileNumber = 1
##Read the input field
$fileName = $Input1.Text
##List data (Statikus :D) from Pictures folder then write out to the temp
Get-ChildItem -Name $pictures_folder > $tmpText
##Var for temp
$Tmp = Get-Content -Path $picture_temp_file
##Read line by line to the temp then paste the numbers to the pictures
foreach($v in $Tmp){
   Rename-Item "$pictures_folder$v" "$filename$start_szam.jpg" 
   $start_szam++
   $myArray += $start_szam
   }

if($Tmp.count -eq $myArray.length)
{
[System.Windows.Forms.MessageBox]::Show("Picture renaming successful")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Picture renaming unsuccessful")
}
}

##Download json if we got null then write an error
Function downloadJsons{
$ftpdown = ncftpget -u $ftp_username -p $ftp_password $ftp_server $ftp_json_folder_local_download $ftp_json_folder_download 
if($ftpdown -eq $null)
{
[System.Windows.Forms.MessageBox]::Show("Operation successfull")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Operation unsuccessfull")
}

}

##Upload json if we got null then write an error
Function uploadJsons{
$ftpup = ncftpput -u $ftp_username -p $ftp_password $ftp_server $ftp_json_folder_upload $ftp_json_folder_local_upload
if($ftpup -eq $null)
{
[System.Windows.Forms.MessageBox]::Show("Operation successfull")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Operation unsuccessfull")
}
}

##Folders upload

function uploadFolder1{
$ftpFolder1 = ncftpput -u $ftp_username -p $ftp_password $ftp_server $ftp_folder1_upload $local_folder1
if($ftpFolder1 -eq $null)
{
[System.Windows.Forms.MessageBox]::Show("Operation successfull")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Operation unsuccessfull")
}
}

function uploadFolder2{
$ftpFolder2 = ncftpput -u $ftp_username -p $ftp_password $ftp_server $ftp_folder2_upload $local_folder2
if($ftpFolder2 -eq $null)
{
[System.Windows.Forms.MessageBox]::Show("Operation successfull")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Operation unsuccessfull")
}
}

function uploadFolder3{
$ftpFolder3 = ncftpput -u $ftp_username -p $ftp_password $ftp_server $ftp_folder3_upload $local_folder3
if($ftpFolder3 -eq $null)
{
[System.Windows.Forms.MessageBox]::Show("Operation successfull")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Operation unsuccessfull")
}
}

function uploadFolder4{
$ftpFolder4 = ncftpput -u $ftp_username -p $ftp_password $ftp_server $ftp_folder4_upload $local_folder4
if($ftpFolder4 -eq $null)
{
[System.Windows.Forms.MessageBox]::Show("Operation successfull")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Operation unsuccessfull")
}
}

function uploadFolder5{
$ftpFolder5 = ncftpput -u $ftp_username -p $ftp_password $ftp_server $ftp_folder5_upload $local_folder5
if($ftpFolder5 -eq $null)
{
[System.Windows.Forms.MessageBox]::Show("Operation successfull")
}
else
{
[System.Windows.Forms.MessageBox]::Show("Operation unsuccessfull")
}
}

##Program close
function Close 
{
$Form1.Close()
}

##About
function About
{
[System.Windows.Forms.MessageBox]::Show("WebEditor`n Made by:`nPrhckSpc")
}

##Form window
$Form1 = New-Object System.Windows.Forms.Form
$Form1.Size = New-Object System.Drawing.Size(200,390)
$Form1.StartPosition = "CenterScreen"
$Form1.Icon = [Drawing.Icon]::ExtractAssociatedIcon((Get-Command powershell).Path)
$Form1.Topmost = $True
$Form1.MaximizeBox = $False
$Form1.MinimizeBox = $True

##Menu
$FormMenuMain = New-Object System.Windows.Forms.MenuStrip
$FormMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$FormMenu.Text = "Menu"
$FormMenu.AllowDrop = $True
##Folders
$FormFolders = New-Object System.Windows.Forms.ToolStripMenuItem
$FormFolders.Text = "Folders"
$FormFolders.AllowDrop = $True
##Menü Elemek Hozzáadása
$FormMenuMain.Items.Add($FormMenu)
$FormMenuMain.Items.Add($FormFolders)
##Upload from folders
$UploadMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$UploadMenu.Text = "Upload"
$FormMenu.DropDownItems.Add($UploadMenu)
##Delete files from folders
$DeleteMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$DeleteMenu.Text = "Purge"
$DeleteMenu.AllowDrop = $True
$FormMenu.DropDownItems.Add($DeleteMenu)

#Upload files from folders
$UploadFolder1 = New-Object System.Windows.Forms.ToolStripMenuItem
$UploadFolder1.Text = "Folder1"
$UploadMenu.DropDownItems.Add($UploadFolder1)
$UploadFolder1.Add_Click({uploadFolder1})

$UploadFolder2 = New-Object System.Windows.Forms.ToolStripMenuItem
$UploadFolder2.Text = "Folder2"
$UploadMenu.DropDownItems.Add($UploadFolder2)
$UploadFolder2.Add_Click({uploadFolder2})

$UploadFolder3 = New-Object System.Windows.Forms.ToolStripMenuItem
$UploadFolder3.Text = "Folder3"
$UploadMenu.DropDownItems.Add($UploadFolder3)
$UploadFolder3.Add_Click({uploadFolder3})

$UploadFolder4 = New-Object System.Windows.Forms.ToolStripMenuItem
$UploadFolder4.Text = "Folder4"
$UploadMenu.DropDownItems.Add($UploadFolder4)
$UploadFolder4.Add_Click({uploadFolder4})

$UploadFolder5 = New-Object System.Windows.Forms.ToolStripMenuItem
$UploadFolder5.Text = "Folder5"
$UploadMenu.DropDownItems.Add($UploadFolder5)
$UploadFolder5.Add_Click({uploadFolder5})

##Delete files from folders
$DeleteFolder1 = New-Object System.Windows.Forms.ToolStripMenuItem
$DeleteFolder1.Text = "Folder1"
$DeleteMenu.DropDownItems.Add($DeleteFolder1)
$DeleteFolder1.Add_Click({Remove-Item -Path $local_folder1 -Recurse -Force;[System.Windows.Forms.MessageBox]::Show("Operation successfull")})

$DeleteFolder2 = New-Object System.Windows.Forms.ToolStripMenuItem
$DeleteFolder2.Text = "Folder2"
$DeleteMenu.DropDownItems.Add($DeleteFolder2)
$DeleteFolder2.Add_Click({Remove-Item -Path $local_folder2 -Recurse -Force;[System.Windows.Forms.MessageBox]::Show("Operation successfull")})

$DeleteFolder3 = New-Object System.Windows.Forms.ToolStripMenuItem
$DeleteFolder3.Text = "Folder3"
$DeleteMenu.DropDownItems.Add($DeleteFolder3)
$DeleteFolder3.Add_Click({Remove-Item -Path $local_folder3 -Recurse -Force;[System.Windows.Forms.MessageBox]::Show("Operation successfull")})

$DeleteFolder4 = New-Object System.Windows.Forms.ToolStripMenuItem
$DeleteFolder4.Text = "Folder4"
$DeleteMenu.DropDownItems.Add($DeleteFolder4)
$DeleteFolder4.Add_Click({Remove-Item -Path $local_folder4 -Recurse -Force;[System.Windows.Forms.MessageBox]::Show("Operation successfull")})

$DeleteFolder5 = New-Object System.Windows.Forms.ToolStripMenuItem
$DeleteFolder5.Text = "Folder5"
$DeleteMenu.DropDownItems.Add($DeleteFolder5)
$DeleteFolder5.Add_Click({Remove-Item -Path $local_folder5 -Recurse -Force;[System.Windows.Forms.MessageBox]::Show("Operation successfull")})
##Info
$InfoMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$InfoMenu.Text = "Info"
$InfoMenu.Add_Click({About})
$FormMenu.DropDownItems.Add($InfoMenu)

#Close
$CloseMenu = New-Object System.Windows.Forms.ToolStripMenuItem
$CloseMenu.Text = "Close"
$CloseMenu.Add_Click({Close})
$FormMenu.DropDownItems.Add($CloseMenu)

#Folders
$FoldersFolder1 = New-Object System.Windows.Forms.ToolStripMenuItem
$FoldersFolder1.Text = "Folder1"
$FoldersFolder1.Add_Click({ii $local_folder1_location})
$FormFolders.DropDownItems.Add($FoldersFolder1)


$FoldersFolder2 = New-Object System.Windows.Forms.ToolStripMenuItem
$FoldersFolder2.Text = "Folder2"
$FoldersFolder2.Add_Click({ii $local_folder2_location})
$FormFolders.DropDownItems.Add($FoldersFolder2)


$FoldersFolder3 = New-Object System.Windows.Forms.ToolStripMenuItem
$FoldersFolder3.Text = "Folder3"
$FoldersFolder3.Add_Click({ii $local_folder3_location})
$FormFolders.DropDownItems.Add($FoldersFolder3)


$FoldersFolder4 = New-Object System.Windows.Forms.ToolStripMenuItem
$FoldersFolder4.Text = "Folder4"
$FoldersFolder4.Add_Click({ii $local_folder4_location})
$FormFolders.DropDownItems.Add($FoldersFolder4)


$FoldersFolder5 = New-Object System.Windows.Forms.ToolStripMenuItem
$FoldersFolder5.Text = "Folder5"
$FoldersFolder5.Add_Click({ii $local_folder5_location})
$FormFolders.DropDownItems.Add($FoldersFolder5)

##MainLabel
$mainLabel = New-Object System.Windows.Forms.Label
$mainLabel.Text = "Pictures start name and number:"
$mainLabel.Location = New-Object System.Drawing.Point(8,27)
$mainLabel.Size = New-Object System.Drawing.Size(200,20)

$Input1 = New-Object System.Windows.Forms.TextBox
$Input1.Location = New-Object System.Drawing.Point(10,40)
$Input1.Size = New-Object System.Drawing.Size(165,10)

$Input2 = New-Object System.Windows.Forms.NumericUpDown
$Input2.Location = New-Object System.Drawing.Point(10,61)
$Input2.Size = New-Object System.Drawing.Size(60,10)
$Input2.Maximum = 99999

##Ok button
$renameButton = New-Object System.Windows.Forms.Button
$renameButton.Location = New-Object System.Drawing.Point(10,121)
$renameButton.Size = New-Object System.Drawing.Size(80,40)
$renameButton.Text = "Rename (Pictures)"

##JSON-(Download)
$jsonButtonDown = New-Object System.Windows.Forms.Button
$jsonButtonDown.Location = New-Object System.Drawing.Point(10,81)
$jsonButtonDown.Size = New-Object System.Drawing.Size(80,40)
$jsonButtonDown.Text = "Json files download"

##JSON-(Upload)
$jsonButtonUp = New-Object System.Windows.Forms.Button
$jsonButtonUp.Location = New-Object System.Drawing.Point(95,81)
$jsonButtonUp.Size = New-Object System.Drawing.Size(80,40)
$jsonButtonUp.Text = "Json files upload"

#New window for edit the jsons
$miniJson1 = New-Object System.Windows.Forms.Button
$miniJson1.Location = New-Object System.Drawing.Point(95,121)
$miniJson1.Size = New-Object System.Drawing.Size(80,40)
$miniJson1.Text = "Json1 edit"


$miniJson2 = New-Object System.Windows.Forms.Button
$miniJson2.Location = New-Object System.Drawing.Point(10,161)
$miniJson2.Size = New-Object System.Drawing.Size(80,40)
$miniJson2.Text = "Json2 edit"

$miniJson3 = New-Object System.Windows.Forms.Button
$miniJson3.Location = New-Object System.Drawing.Point(95,161)
$miniJson3.Size = New-Object System.Drawing.Size(80,40)
$miniJson3.Text = "Json3 edit"

$miniJson4 = New-Object System.Windows.Forms.Button
$miniJson4.Location = New-Object System.Drawing.Point(10,201)
$miniJson4.Size = New-Object System.Drawing.Size(80,40)
$miniJson4.Text = "Jdon4 edit"

$miniJson5 = New-Object System.Windows.Forms.Button
$miniJson5.Location = New-Object System.Drawing.Point(95,201)
$miniJson5.Size = New-Object System.Drawing.Size(80,40)
$miniJson5.Text = "Json5 edit"

$miniJson6 = New-Object System.Windows.Forms.Button
$miniJson6.Location = New-Object System.Drawing.Point(10,241)
$miniJson6.Size = New-Object System.Drawing.Size(80,40)
$miniJson6.Text = "Json6 edit"

$miniJson7 = New-Object System.Windows.Forms.Button
$miniJson7.Location = New-Object System.Drawing.Point(95,241)
$miniJson7.Size = New-Object System.Drawing.Size(80,40)
$miniJson7.Text = "Json7 edit"

$miniJson8 = New-Object System.Windows.Forms.Button
$miniJson8.Location = New-Object System.Drawing.Point(10,281)
$miniJson8.Size = New-Object System.Drawing.Size(80,40)
$miniJson8.Text = "Json8 edit"

$miniJson9 = New-Object System.Windows.Forms.Button
$minijson9.Location = New-Object System.Drawing.Point(95,281)
$miniJson9.Size = New-Object System.Drawing.Size(80,40)
$miniJson9.Text = "Json9 edit"

#Make form
$Form1.Controls.Add($FormMenuMain)
$Form1.Controls.Add($Input1)
$Form1.Controls.Add($Input2)
$Form1.Controls.Add($appName)
$Form1.Controls.Add($mainLabel)
$Form1.Controls.Add($renameButton)
$Form1.Controls.Add($jsonButtonDown)
$Form1.Controls.Add($jsonButtonUp)
$Form1.Controls.Add($miniJson1)
$Form1.Controls.Add($miniJson2)
$Form1.Controls.Add($miniJson3)
$Form1.Controls.Add($miniJson4)
$Form1.Controls.Add($miniJson5)
$Form1.Controls.Add($miniJson6)
$Form1.Controls.Add($miniJson7)
$Form1.Controls.Add($miniJson8)
$Form1.Controls.Add($miniJson9)

##Renamer function
$renameButton.add_Click({Renamer($Input2.Value)})
$jsonButtonDown.add_Click({downloadJsons})
$jsonButtonUp.add_Click({uploadJsons})
$miniJson1.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file1") ("$json_name1")})
$miniJson2.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file2") ("$json_name2")})
$miniJson3.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file3") ("$json_name3")})
$miniJson4.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file4") ("$json_name4")})
$miniJson5.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file5") ("$json_name5")})
$miniJson6.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file6") ("$json_name6")})
$miniJson7.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file7") ("$json_name7")})
$miniJson8.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file8") ("$json_name8")})
$miniJson9.add_Click({Miniform(Get-Content -Encoding UTF8 "$json_file9") ("$json_name9")})
$result = $Form1.ShowDialog()
