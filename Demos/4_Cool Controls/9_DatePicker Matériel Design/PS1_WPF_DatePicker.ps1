[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  				| out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null
# [System.Reflection.Assembly]::LoadFrom('assembly\System.Windows.Interactivity.dll')       				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\ControlzEx.dll')       | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MaterialDesignThemes.Wpf.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MaterialDesignColors.dll')       | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MaterialDesignThemes.MahApps.dll')       | out-null 
function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

$XamlMainWindow=LoadXml("PS1_WPF_DatePicker.xaml")

$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

$Date = $Form.FindName("Date")
$Show_Date = $Form.FindName("Show_Date")



$Date.Add_Click({		
})

$Show_Date.Add_Click({	
	$MyDate = $Date.SelectedDate	
	If ($MyDate -eq $null)
		{
			$MyDate = "No date selected"
		}
	[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowMessageAsync($Form, "My date :-)", "$MyDate")		
})


$Form.ShowDialog() | Out-Null