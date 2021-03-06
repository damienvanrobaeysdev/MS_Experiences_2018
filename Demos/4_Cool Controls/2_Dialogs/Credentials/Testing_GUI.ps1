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
    # Dialog de login
    $Login = [MahApps.Metro.Controls.Dialogs.DialogManager]::ShowModalLoginExternal($Form,"Login:","Type your credentials :)") 
    $User_Login = $Login.Username
    $User_PWD  = $Login.Password	
	[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowMessageAsync($Form, "Credentials :-)", "User is: $User_Login Password is: $User_PWD")		
})



$Form.ShowDialog() | Out-Null