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
	# Simple Dialog	
	[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowMessageAsync($Form, "Hello :-)", "Oh Yeahhhh")		
})



$Form.ShowDialog() | Out-Null