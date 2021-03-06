[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null

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


########################################################################################################################################################################################################	
#*******************************************************************************************************************************************************************************************************
# 																		BUTTONS AND LABELS INITIALIZATION 
#*******************************************************************************************************************************************************************************************************
########################################################################################################################################################################################################



$Flyout_Right = $Form.findname("Flyout_Right") 
$Flyout_Left = $Form.findname("Flyout_Left") 
$Flyout_Up = $Form.findname("Flyout_Up") 
$Flyout_Down = $Form.findname("Flyout_Down") 



$Open_Flyout_Up = $Form.findname("Open_Flyout_Up") 
$Open_Flyout_Left = $Form.findname("Open_Flyout_Left") 
$Open_Flyout_Right = $Form.findname("Open_Flyout_Right") 
$Open_Flyout_Down = $Form.findname("Open_Flyout_Down") 


$Open_Flyout_Right.Add_Click({
    $Flyout_Right.IsOpen = $true    
})

$Open_Flyout_Left.Add_Click({
    $Flyout_Left.IsOpen = $true    
})

$Open_Flyout_Up.Add_Click({
    $Flyout_Up.IsOpen = $true    
})

$Open_Flyout_Down.Add_Click({
    $Flyout_Down.IsOpen = $true    
})



$Form.ShowDialog() | Out-Null

