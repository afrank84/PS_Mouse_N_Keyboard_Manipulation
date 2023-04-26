function Click-rightmouse {
    $RightButtonDown = 0x00000008
    $RightButtonUp = 0x00000010

    $signature = @"
        [DllImport("user32.dll")]
        public static extern void mouse_event(uint dwFlags, int dx, int dy, uint dwData, IntPtr dwExtraInfo);
"@

    $SendMouseClick = Add-Type -MemberDefinition $signature -Name "SendMouseClick" -Namespace "Win32" -PassThru

    $SendMouseClick::mouse_event($RightButtonDown, 0, 0, 0, 0)
    $SendMouseClick::mouse_event($RightButtonUp, 0, 0, 0, 0)
}

#example : Click-rightmouse
