function Click-mouse {
    $LeftButtonDown = 0x00000002
    $LeftButtonUp = 0x00000004

    $signature = @"
        [DllImport("user32.dll")]
        public static extern void mouse_event(uint dwFlags, int dx, int dy, uint dwData, IntPtr dwExtraInfo);
"@

    $SendMouseClick = Add-Type -MemberDefinition $signature -Name "SendMouseClick" -Namespace "Win32" -PassThru

    $SendMouseClick::mouse_event($LeftButtonDown, 0, 0, 0, 0)
    $SendMouseClick::mouse_event($LeftButtonUp, 0, 0, 0, 0)
}

# Example: Click-mouse
