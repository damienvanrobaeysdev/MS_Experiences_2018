[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")


[xml]$MonXAML = get-content -path "MonProjet.xaml"
$Reader=(New-Object System.Xml.XmlNodeReader $MonXAML)
$Interface = [Windows.Markup.XamlReader]::Load($Reader)

$MonBouton = $Interface.FindName("MonBouton") 
$MonTextBox = $Interface.FindName("MonTextBox") 


$MonBouton.Add_Click({
	[System.Windows.Forms.MessageBox]::Show("Ca c'est un simple clic")	
})

$MonBouton.Add_MouseRightButtonDown({	
	[System.Windows.Forms.MessageBox]::Show("Ca c'est un clic droit")	
})


$MonTextBox.Add_MouseDoubleClick({
	[System.Windows.Forms.MessageBox]::Show("Ca c'est un double clic")		
})

# $MonTextBox.Add_MouseEnter({
	# [System.Windows.Forms.MessageBox]::Show("Curseur de la souris au dessus du bouton")		
# })


$Interface.Add_Closing({
	[System.Windows.Forms.MessageBox]::Show("Curseur de la souris au dessus du bouton")		
})


# https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls?view=netframework-4.7.2 
# https://docs.microsoft.com/fr-fr/dotnet/api/system.windows.controls.button?view=netframework-4.7.2#%C3%A9v%C3%A9nements





$Interface.ShowDialog() | Out-Null
