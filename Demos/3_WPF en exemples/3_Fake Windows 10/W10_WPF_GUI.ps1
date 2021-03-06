[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
$XamlMainWindow=LoadXml("W10_WPF_GUI.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

$Global:Current_Folder =(get-location).path 


########################################################################################################################################################################################################	
#*******************************************************************************************************************************************************************************************************
# 																		BUTTONS AND LABELS INITIALIZATION 
#*******************************************************************************************************************************************************************************************************
########################################################################################################################################################################################################

$Open_Settings = $Form.findname("Open_Settings") 
$Open_Start = $Form.findname("Open_Start") 
$button_up = $Form.findname("button_up") 
$network = $Form.findname("network") 
$battery = $Form.findname("battery") 
$sound = $Form.findname("sound") 
$Close_Window = $Form.findname("Close_Window") 
$User_Name = $Form.findname("User_Name") 
$Start_Settings = $Form.findname("Start_Settings") 
$User_Name = $Form.findname("User_Name") 
$Sound_Value = $Form.findname("Sound_Value") 
$Sound_Value_Label = $Form.findname("Sound_Value_Label") 
$Scroll_MostUsed = $Form.findname("Scroll_MostUsed") 
$Shutdown_Menu = $Form.findname("Shutdown_Menu") 

$Search_Windows = $Form.findname("Search_Windows") 

$Date = $Form.findname("Date") 



# Right-Click Part
$Program_features = $Form.findname("Program_features") 
$Mobility_Center = $Form.findname("Mobility_Center") 
$Power_options = $Form.findname("Power_options") 
$Event_viewer = $Form.findname("Event_viewer") 
$System = $Form.findname("System") 
$Device_Manager = $Form.findname("Device_Manager") 
$Disk_Management = $Form.findname("Disk_Management") 
$Computer_Management = $Form.findname("Computer_Management") 
$Command_Prompt = $Form.findname("Command_Prompt") 
$Command_Prompt_Admin = $Form.findname("Command_Prompt_Admin") 
$Task_Manager = $Form.findname("Task_Manager") 
$Control_Panel = $Form.findname("Control_Panel") 
$File_Explorer = $Form.findname("File_Explorer") 
$Search = $Form.findname("Search") 
$Run = $Form.findname("Run") 

# Flyout Controls
$FlyOutContent = $Form.findname("FlyOutContent") 
$FlyOutContent_Start = $Form.findname("FlyOutContent_Start") 
$FlyOutContent_Up = $Form.findname("FlyOutContent_Up") 
$FlyOutContent_Battery = $Form.findname("FlyOutContent_Battery") 
$FlyOutContent_Network = $Form.findname("FlyOutContent_Network") 
$FlyOutContent_Sound = $Form.findname("FlyOutContent_Sound") 
$FlyOutContent_RightClick_StartMenu = $Form.findname("FlyOutContent_RightClick_StartMenu") 
$FlyOutContent_ShutdownMenu = $Form.findname("FlyOutContent_ShutdownMenu") 


# Task Bar Shortcut buttons
$Shortcut_File_Explorer = $Form.findname("Shortcut_File_Explorer") 
$Shortcut_Chrome = $Form.findname("Shortcut_Chrome") 
$Shortcut_Outlook = $Form.findname("Shortcut_Outlook") 
$Shortcut_dropbox = $Form.findname("Shortcut_dropbox") 
$Shortcut_word = $Form.findname("Shortcut_word") 





# List Network buttons
$Network_Ethernet = $Form.findname("Network_Ethernet") 
$Network_Wifi = $Form.findname("Network_Wifi") 
$Network_Name = $Form.findname("Network_Name") 
$Network_Settings = $Form.findname("Network_Settings") 
$Scroll_Network = $Form.findname("Scroll_Network") 
$Network_Airplane_Button = $Form.findname("Network_Airplane_Button") 
$Network_Wifi_Button = $Form.findname("Network_Wifi_Button") 




$UserName = $env:username

$User_Name.Tooltip = $UserName
$Start_Settings.Tooltip = "Settings"
$Close_Window.Tooltip = "Close the GUI"

# $Sound_Value.Value = "50"
$Sound_Value_Label.Content = $Sound_Value.Value

$Date_Day_Month_Year = Get-Date -Uformat "%d/%m/%Y"

$Date.Content = $Date_Day_Month_Year





$Sound_Value.Add_ValueChanged({
	$Sound_Value_Label.Content = [Math]::Round(($Sound_Value.Value), 0)	
})

$Close_Window.Add_Click({	
	$okAndCancel = [MahApps.Metro.Controls.Dialogs.MessageDialogStyle]::AffirmativeAndNegative
	$result = [MahApps.Metro.Controls.Dialogs.DialogManager]::ShowModalMessageExternal($Form,"Close confirmation","Do you want to close the GUI ?",$okAndCancel)
	If($result -eq "Affirmative")
		{
			$Form.Close()
		}
})

$User_Name.Add_Click({	
    $Login = [MahApps.Metro.Controls.Dialogs.DialogManager]::ShowModalLoginExternal($Form,"Change User Name","Type your credentials") 
    $User_Login = $Login.Username
    $User_PWD  = $Login.Password
	$User_Name.Tooltip = $User_Login
	[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowMessageAsync($Form, "New user name", "You will logged as user: $User_Login")		
	
})


###########################################################################################################################################################################
#
# 																	START MENU RIGHT CLICK BUTTONS
#
###########################################################################################################################################################################

$Program_features.Add_Click({
	start-process appwiz
})

$Mobility_Center.Add_Click({
	start-process mblctr
})

$Power_options.Add_Click({
	start-process powercfg.cpl	
})

$Event_viewer.Add_Click({
	start-process eventvwr.msc	
})

$Disk_Management.Add_Click({
	start-process diskmgmt.msc	
})

$Device_Manager.Add_Click({
	start-process hdwwiz	
})

$Computer_Management.Add_Click({
	start-process compmgmt.msc	
})

$Command_Prompt.Add_Click({
	start-process cmd	
})

$Command_Prompt_Admin.Add_Click({
	start-process cmd	
})

$Task_Manager.Add_Click({
	Start-Process cmd -Verb runAs
})

$Control_Panel.Add_Click({
	start-process control	
})

$File_Explorer.Add_Click({
	start-process explorer	
})




###########################################################################################################################################################################
#
# 																	TASK BAR SHORTCUTS BUTTONS ACTIONS
#
###########################################################################################################################################################################

$Shortcut_File_Explorer.Add_Click({
	start-process explorer	
})

$Shortcut_Chrome.Add_Click({
})

$Shortcut_Outlook.Add_Click({
})

$Shortcut_dropbox.Add_Click({
})

$Shortcut_word.Add_Click({
})








$Open_Start.Add_Click({
    $FlyOutContent_Start.IsOpen = $true    
})

$network.Add_Click({
    $FlyOutContent_Network.IsOpen = $true    		
})


# Clic droit sur bouton démarrer
$Open_Start.Add_MouseRightButtonDown({
    $FlyOutContent_RightClick_StartMenu.IsOpen = $true    		
})

$button_up.Add_Click({
    $FlyOutContent_Up.IsOpen = $true    	
})

$battery.Add_Click({
    $FlyOutContent_Battery.IsOpen = $true    	
})


$sound.Add_Click({
    $FlyOutContent_Sound.IsOpen = $true    		
})


$Open_Settings.Add_Click({
    $FlyOutContent.IsOpen = $true    
})


# $Shutdown_Menu.Add_Click({
$Shutdown_Menu.Add_MouseEnter({
    $FlyOutContent_ShutdownMenu.IsOpen = $true    
})

$Scroll_MostUsed.Add_MouseEnter({
	$Scroll_MostUsed.CanContentScroll = $true
})

$Scroll_MostUsed.Add_MouseLeave({
	$Scroll_MostUsed.CanContentScroll = $false
})

$Search_Windows.Add_MouseDoubleClick({
	$Search_Windows.Text = ""
})










###########################################################################################################################################################################
#
# 																	START MENU RIGHT CLICK BUTTONS
#
###########################################################################################################################################################################









###########################################################################################################################################################################
#
# 																	NETWORK PART
#
###########################################################################################################################################################################

$Actual_Network = Get-NetConnectionProfile
$Actual_Network_Name = $Actual_Network.name
$Actual_Network_Type = $Actual_Network.InterfaceAlias

If ($Actual_Network_Type -like "*Ethernet*")
	{
		$Network_Ethernet.Visibility = "Visible"
		$Network_Wifi.Visibility = "Collapsed"	
		$Network_Name.Content = $Actual_Network_Name
	}
ElseIf ($Actual_Network_Type -like "*Wifi*")
	{
		$Network_Ethernet.Visibility = "Collapsed"
		$Network_Wifi.Visibility = "Visible"	
		$Network_Name.Content = $Actual_Network_Name		
	}



$Network_Airplane_Button.Background = "#6A6A6A"


$Network_Airplane_Button.Add_Click({
	$Network_Airplane_Button.Background = "#0078D7"	
})		
		
$Network_Airplane_Button.Add_MouseDown({
	$Network_Airplane_Button.Background = "#6A6A6A"	
})	


$Network_Wifi_Button.Add_Click({
	$Network_Wifi_Button.Background = "#6A6A6A"	
	
})		
		
$Network_Wifi_Button.Add_MouseDown({
	$Network_Wifi_Button.Background = "#0078D7"	
})		
	
	
	
###########################################################################################################################################################################
#
# 																	FORMS ACTIONS
#
###########################################################################################################################################################################
	
$Form.add_MouseLeftButtonDown({
   $_.handled=$true
   $this.DragMove()
})	
		
	
	
	

$Form.ShowDialog() | Out-Null

