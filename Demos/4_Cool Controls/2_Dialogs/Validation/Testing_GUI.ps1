[System.Reflection.Assembly]::LoadFrom('Assembly\MahApps.Metro.dll')      
[System.Reflection.Assembly]::LoadFrom('Assembly\System.Windows.Interactivity.dll') 
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
$XamlMainWindow=LoadXml("Testing_GUI.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

$ShowDialog = $Form.findname("ShowDialog") 

$ShowDialog.Add_Click({
	# Dialog de validation	
	$okAndCancel = [MahApps.Metro.Controls.Dialogs.MessageDialogStyle]::AffirmativeAndNegative
	$result = [MahApps.Metro.Controls.Dialogs.DialogManager]::ShowModalMessageExternal($Form,"hello","On continue ?",$okAndCancel)
	If($result -eq "Affirmative")
		{
			[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowMessageAsync($Form, "Hello :-)", "Yes")			
		}
	Else
		{
			[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowMessageAsync($Form, "Hello :-)", "Cancel")			
		}
})



$Form.ShowDialog() | Out-Null