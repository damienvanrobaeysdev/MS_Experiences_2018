# Load assemblies
[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null
[System.Reflection.Assembly]::LoadFrom('Assembly\MahApps.Metro.dll')      
[System.Reflection.Assembly]::LoadFrom('Assembly\System.Windows.Interactivity.dll') 


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

$DataGrid_XML = $Form.findname("DataGrid_XML")

Function Populate_Datagrid_XML # Function to list your applications in the datagrid
	{			
		$Global:List_XML_Content = ""
		$Input_XML = ""		
		
		$Global:List_XML_Content = "Infos.xml"						
		$Input_XML = [xml] (Get-Content $List_XML_Content)		
		foreach ($data in $Input_XML.selectNodes("Infos/Site"))		
			{
				$XML_values = New-Object PSObject
				$XML_values = $XML_values | Add-Member NoteProperty FirstName $data.FirstName –passthru				
				$XML_values = $XML_values | Add-Member NoteProperty Name $data.Name –passthru
				$XML_values = $XML_values | Add-Member NoteProperty Town $data.Town –passthru
				$DataGrid_XML.Items.Add($XML_values) > $null
			}		
	}		
Populate_Datagrid_XML



# Show GUI
$Form.ShowDialog() | Out-Null
