# Requires assembly for InputBox/MessageBox functionality
Add-Type -AssemblyName Microsoft.VisualBasic

$TargetTime = [datetime]::Now.AddSeconds(120) # 2 minutos (120 segundos)
$Password = "miContraseñaSecreta" # La contraseña secreta (Killswitch)
$TimesUp = $false

do {
    $Remaining = $TargetTime - [datetime]::Now
    $Title = "⚠️ ALERTA DE SEGURIDAD - Desbloquear en " + $Remaining.ToString("mm\:ss") + " ⚠️"

    # Muestra el cuadro de diálogo para pedir la contraseña
    $Input = [Microsoft.VisualBasic.Interaction]::InputBox("Introduzca la contraseña de desbloqueo para evitar la 'consecuencia'", $Title, "")

    if ($Input -eq $Password) {
        # Contraseña correcta: Salir del loop (el killswitch)
        [System.Windows.MessageBox]::Show("ACCESO AUTORIZADO. El sistema ha sido desbloqueado.", "KILLSWITCH ACTIVADO", "OK", "Information")
        break
    } elseif ($Remaining.TotalSeconds -le 0) {
        # Se acaba el tiempo
        $TimesUp = $true
        [System.Windows.MessageBox]::Show("¡TIEMPO EXPIRADO! Activando consecuencia simulada...", "CONSECUENCIA", "OK", "Error")
        break
    } else {
        # Contraseña incorrecta, advertencia
        [System.Windows.MessageBox]::Show("Contraseña incorrecta. El tiempo sigue corriendo.", "ERROR DE AUTENTICACIÓN", "OK", "Warning")
    }

} while($true)

# Si el tiempo se acabó, ejecutar la consecuencia
if ($TimesUp) {
    # Llama al script batch de la consecuencia reversible
    Start-Process -FilePath ".\03_Reversible_Consequence.bat"
}

# El script termina si se usó el Killswitch o si se activó la Consecuencia.
