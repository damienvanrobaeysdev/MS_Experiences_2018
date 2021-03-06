
# Load assemblies
[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null

# Load XAML
function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}
$XamlMainWindow=LoadXml("Interface_WPF.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)


$Visible = $Form.findname("Visible") 
$Hidden = $Form.findname("Hidden") 
$Collapsed = $Form.findname("Collapsed") 
$Premier = $Form.findname("Premier") 
$Second = $Form.findname("Second") 
$Troisieme = $Form.findname("Troisieme") 

$Visible.Add_Click({
	$Premier.Visibility = "Visible"
	$Second.Visibility = "Visible"
	$Troisieme.Visibility = "Visible"
})
$Hidden.Add_Click({
	$Premier.Visibility = "Hidden"
	$Second.Visibility = "Hidden"
	$Troisieme.Visibility = "Visible"
})
$Collapsed.Add_Click({
	$Premier.Visibility = "Collapsed"
	$Second.Visibility = "Collapsed"
	$Troisieme.Visibility = "Visible"
})





# Show GUI
$Form.ShowDialog() | Out-Null
