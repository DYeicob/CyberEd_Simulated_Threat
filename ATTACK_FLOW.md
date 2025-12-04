# 📈 Flujo de Demostración del Ataque Simulado (SimuThreat)

Este documento guía al instructor (o al usuario) a través de las fases del ataque simulado.

## FASE 1: Vector de Entrega (Ingeniería Social)

* **Acción:** El instructor explica que el archivo `01_Initial_Execution.bat` simula un archivo descargado de un correo electrónico de *phishing* o un sitio web malicioso.
* **Concepto:** La confianza del usuario es el primer vector de ataque.
* **Ejecución:** El usuario hace doble clic en `01_Initial_Execution.bat`.

## FASE 2: Ejecución del Payload y Bloqueo

* **Acción:** `01_Initial_Execution.bat` ejecuta silenciosamente el script de PowerShell (`02_Lock_Simulator.ps1`).
* **Efecto:** Aparece una ventana emergente de "ALERTA DE SEGURIDAD" con una cuenta atrás de 120 segundos.
* **Concepto:** El *payload* se ha ejecutado y ha tomado el control del bucle de interacción del usuario.

## FASE 3A: Opción de Éxito (Uso del Killswitch)

* **Instrucción:** Demostrar que el ataque está "controlado" por el atacante.
* **Acción:** Antes de que expire el tiempo, introduzca la contraseña secreta (establecida en el script, ej: `miContraseñaSecreta`).
* **Resultado:** El script se cierra inmediatamente, deteniendo el flujo sin consecuencias.
* **Concepto:** Demostración del **Killswitch** — una salida programada utilizada tanto para pruebas como a veces por los atacantes.

## FASE 3B: Opción de Falla (Activación de la Consecuencia)

* **Instrucción:** Dejar que la cuenta atrás llegue a cero.
* **Acción:** Cuando el tiempo expira, el script de PowerShell llama a `03_Reversible_Consequence.bat`.
* **Efecto:**
    1.  Se activa la herramienta Lupa (`magnify -inv`), invirtiendo los colores de la pantalla.
    2.  Se cambia la distribución del teclado al Chino (simplificado).
    3.  Aparece un aviso de apagado del sistema en 60 segundos.
* **Conceptos:** **LOLBAS** (Lupa) y **Persistencia Simulada** (Apagado programado).

## FASE 4: Reversión y Análisis (Defensa)

* **Acción:** El usuario debe revertir manualmente las consecuencias.
* **Pasos de Reversión:**
    1.  Abrir la línea de comandos y escribir `shutdown /a` para cancelar el apagado.
    2.  Cerrar la aplicación "Lupa" (magnify) haciendo clic en su icono o cerrando su ventana.
    3.  Ejecutar `Cleanup_Tool.bat` para restaurar la distribución del teclado (o hacerlo manualmente a través del Panel de Control).
* **Concepto:** La **Remediación** y la importancia de conocer los comandos del sistema para deshacer acciones no deseadas.
