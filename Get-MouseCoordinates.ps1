function Get-MouseCoordinates {
    Add-Type -AssemblyName System.Windows.Forms

    # Create a form object
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Mouse Coordinate Capture"
    $form.Size = New-Object System.Drawing.Size(300, 150)
    $form.StartPosition = "CenterScreen"

    # Create a label to display the coordinates
    $lblCoord = New-Object System.Windows.Forms.Label
    $lblCoord.Text = "Press 'Capture' to get mouse coordinates."
    $lblCoord.AutoSize = $true
    $lblCoord.Location = New-Object System.Drawing.Point(10, 10)
    $form.Controls.Add($lblCoord)

    # Create a button to capture the coordinates
    $btnCapture = New-Object System.Windows.Forms.Button
    $btnCapture.Text = "Capture"
    $btnCapture.Location = New-Object System.Drawing.Point(10, 50)
    $btnCapture.Add_Click({
        $form.Tag = [System.Windows.Forms.Cursor]::Position
        $form.DialogResult = [System.Windows.Forms.DialogResult]::OK
    })
    $form.AcceptButton = $btnCapture
    $form.Controls.Add($btnCapture)

    # Display the form
    $result = $form.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $point = $form.Tag
        return $point
    }
}
