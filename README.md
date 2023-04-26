# PS_Mouse_N_Keyboard_Manipulation
Allows a user to identify x and y coordinates in PowerShell, send clicks on mouse (left and right), and send keys for typing.

##Get-MouseCoordinates
The Get-MouseCoordinates function creates a form with a label and a button, just like the previous example. However, when you click the button, it sets the form's Tag property to the mouse coordinates and sets the DialogResult property to OK to indicate that the user has clicked the capture button.

The function then waits for the form to close and checks if the DialogResult property is OK. If it is, it retrieves the mouse coordinates from the Tag property and returns them as a System.Drawing.Point object.

You can save this code in a PowerShell script file with a .ps1 extension and then call the Get-MouseCoordinates function from the PowerShell console or other PowerShell scripts to capture the mouse coordinates.
