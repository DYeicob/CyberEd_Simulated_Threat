# Requires assembly for InputBox/MessageBox functionality
Add-Type -AssemblyName Microsoft.VisualBasic

$TargetTime = [datetime]::Now.AddSeconds(60) # 60-second countdown
$Password = "mySecretPassword" # The secret password (Killswitch)
$TimesUp = $false

do {
    $Remaining = $TargetTime - [datetime]::Now
    
    # Handling the display of remaining time
    if ($Remaining.TotalSeconds -le 0) {
        $TimeDisplay = "0s"
    } elseif ($Remaining.TotalSeconds -lt 60) {
        # Shows only seconds (rounded up)
        $TimeDisplay = [math]::Ceiling($Remaining.TotalSeconds).ToString() + "s"
    } else {
        $TimeDisplay = $Remaining.ToString("mm\:ss")
    }

    $Title = "⚠️ SECURITY ALERT - Unlock within " + $TimeDisplay + " ⚠️"

    # Displays the dialog box to request the password
    # *** CRITICAL CORRECTION: Removed empty third argument ***
    $Input = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the unlock password to prevent the 'consequence'", $Title)

    # If time expired before the user responded, exit the loop
    if ($Remaining.TotalSeconds -le 0) {
        $TimesUp = $true
        [System.Windows.MessageBox]::Show("TIME EXPIRED! Activating simulated consequence...", "CONSEQUENCE", "OK", "Error")
        break
    }
    
    if ($Input -eq $Password) {
        # Correct password: Exit the loop (the Killswitch)
        [System.Windows.MessageBox]::Show("ACCESS AUTHORIZED. The system has been unlocked.", "KILLSWITCH ACTIVATED", "OK", "Information")
        break
    } else {
        # Incorrect password, warning
        [System.Windows.MessageBox]::Show("Incorrect password. The clock is still ticking.", "AUTHENTICATION ERROR", "OK", "Warning")
    }

} while($true)

# If time ran out, execute the consequence
if ($TimesUp) {
    # Calls the reversible consequence batch script
    Start-Process -FilePath ".\03_Reversible_Consequence.bat"
}
