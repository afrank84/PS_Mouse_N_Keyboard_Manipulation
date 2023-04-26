function Move-MouseSlowly {
    param (
        [int]$TargetX,
        [int]$TargetY,
        [int]$Speed = 10
    )

    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class Mouse {
            [DllImport("user32.dll")]
            public static extern bool SetCursorPos(int x, int y);
        }
"@

    $CurrentX = [System.Windows.Forms.Cursor]::Position.X
    $CurrentY = [System.Windows.Forms.Cursor]::Position.Y

    $DeltaX = $TargetX - $CurrentX
    $DeltaY = $TargetY - $CurrentY

    $StepsX = [Math]::Abs($DeltaX) / $Speed
    $StepsY = [Math]::Abs($DeltaY) / $Speed

    $StepX = if ($DeltaX -lt 0) { -$Speed } else { $Speed }
    $StepY = if ($DeltaY -lt 0) { -$Speed } else { $Speed }

    for ($i = 1; $i -le $StepsX; $i++) {
        $CurrentX += $StepX
        [void][Mouse]::SetCursorPos($CurrentX, $CurrentY)
        Start-Sleep -Milliseconds 10
    }

    for ($i = 1; $i -le $StepsY; $i++) {
        $CurrentY += $StepY
        [void][Mouse]::SetCursorPos($CurrentX, $CurrentY)
        Start-Sleep -Milliseconds 10
    }

    [void][Mouse]::SetCursorPos($TargetX, $TargetY) # final positioning
}

//Example: Move-MouseSlowly -TargetX 100 -TargetY 200 -Speed 5
