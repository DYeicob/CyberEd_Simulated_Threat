# Requires assembly for InputBox/MessageBox functionality
Add-Type -AssemblyName Microsoft.VisualBasic

$TargetTime = [datetime]::Now.AddSeconds(60) # Cuenta atrás de 60 segundos
$Password = "miContraseñaSecreta" # La contraseña secreta (Killswitch)
$TimesUp = $false

do {
    $Remaining = $TargetTime - [datetime]::Now
    
    # Manejo de la visualización del tiempo restante
    if ($Remaining.TotalSeconds -le 0) {
        $TimeDisplay = "0s"
    } elseif ($Remaining.TotalSeconds -lt 60) {
        # Muestra sólo los segundos (redondeado hacia arriba)
        $TimeDisplay = [math]::Ceiling($Remaining.TotalSeconds).ToString() + "s"
    } else {
        $TimeDisplay = $Remaining.ToString("mm\:ss")
    }

    $Title = "⚠️ ALERTA DE SEGURIDAD - Desbloquear en " + $TimeDisplay + " ⚠️"

    # Muestra el cuadro de diálogo para pedir la contraseña
    # *** CORRECCIÓN CRÍTICA: Eliminado el tercer argumento vacío (,"") ***
    $Input = [Microsoft.VisualBasic.Interaction]::InputBox("Introduzca la contraseña de desbloqueo para evitar la 'consecuencia'", $Title)

    # Si el tiempo ya expiró antes de que el usuario respondiera, salir
    if ($Remaining.TotalSeconds -le 0) {
        $TimesUp = $true
        [System.Windows.MessageBox]::Show("¡TIEMPO EXPIRADO! Activando consecuencia simulada...", "CONSECUENCIA", "OK", "Error")
        break
    }
    
    if ($Input -eq $Password) {
        # Contraseña correcta: Salir del loop (el killswitch)
        [System.Windows.MessageBox]::Show("ACCESO AUTORIZADO. El sistema ha sido desbloqueado.", "KILLSWITCH ACTIVADO", "OK", "Information")
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
