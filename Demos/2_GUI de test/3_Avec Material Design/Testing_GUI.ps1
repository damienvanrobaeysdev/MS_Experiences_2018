[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MaterialDesignThemes.Wpf.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MaterialDesignColors.dll')       | out-null 
[System.Reflection.Assembly]::LoadFrom('assembly\MaterialDesignThemes.MahApps.dll')       | out-null 


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

$Global:Current_Folder =(get-location).path 


########################################################################################################################################################################################################	
#*******************************************************************************************************************************************************************************************************
# 																		BUTTONS AND LABELS INITIALIZATION 
#*******************************************************************************************************************************************************************************************************
########################################################################################################################################################################################################

# ListBox
$DataGrid_XML = $Form.findname("DataGrid_XML")
$Choose_DS = $Form.findname("Choose_DS") 



Function Populate_Ville
	{		
		$Share_XML = "Infos.xml"										
		$Global:my_share_xml = [xml] (Get-Content $Share_XML)	
		foreach ($data in $my_share_xml.selectNodes("Infos/Site"))				
			{
				$Choose_DS.Items.Add($data.Ville)	| out-null	
			}					
	}				
Populate_Ville	


Function Populate_Datagrid_XML # Function to list your applications in the datagrid
	{			
		$Global:List_XML_Content = ""
		$Input_XML = ""		
		
		$Global:List_XML_Content = "Infos.xml"						
		$Input_XML = [xml] (Get-Content $List_XML_Content)		
		foreach ($data in $Input_XML.selectNodes("Infos/Site"))		
			{
				$XML_values = New-Object PSObject
				$XML_values = $XML_values | Add-Member NoteProperty Ville $data.Ville –passthru				
				$XML_values = $XML_values | Add-Member NoteProperty Prenom $data.Prenom –passthru
				$XML_values = $XML_values | Add-Member NoteProperty Nom $data.Nom –passthru
				$DataGrid_XML.Items.Add($XML_values) > $null
			}		
	}		
Populate_Datagrid_XML

	
	

$Form.ShowDialog() | Out-Null

