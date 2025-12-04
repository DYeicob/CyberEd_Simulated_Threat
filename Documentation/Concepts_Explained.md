# 📚 Conceptos de Ciberseguridad Explicados

Este proyecto de código (SimuThreat) está diseñado para ilustrar los siguientes conceptos defensivos y de seguridad:

## 1. Payload Benigno vs. Malware Real

* **Definición:** Un *payload* es el componente que realiza la acción deseada por el atacante.
* **SimuThreat:** Nuestro payload (`02_Lock_Simulator.ps1`) solo ejecuta una función de bloqueo y cambio de configuración, sin cifrar archivos ni robar información. Un *malware* real tendría código malicioso destructivo o de espionaje.

## 2. Killswitch (Interruptor de Muerte)

* **Definición:** Una característica dentro del código malicioso que permite al desarrollador (o al atacante) detener su funcionamiento remotamente, o en este caso, mediante una contraseña.
* **SimuThreat:** La contraseña en `02_Lock_Simulator.ps1` actúa como un **Killswitch**. En la realidad, esto podría ser una dirección IP, una clave de registro o una contraseña que permite al atacante detener una campaña de *ransomware* si sale mal.

## 3. LOLBAS (Living Off the Land Binaries and Scripts)

* **Definición:** La práctica de utilizar herramientas y binarios legítimos que ya existen en el sistema operativo (ej. PowerShell, `cmd.exe`, `bitsadmin`, `certutil`) para realizar acciones maliciosas.
* **SimuThreat:**
    * Usamos **PowerShell** para la lógica principal y el cambio de teclado.
    * Usamos **`magnify.exe`** para invertir los colores de la pantalla.
    * **Importancia Defensiva:** Esto hace que los ataques sean difíciles de detectar, ya que las herramientas usadas son de confianza para el sistema operativo.

## 4. Persistencia (Simulada)

* **Definición:** Las técnicas utilizadas por los atacantes para asegurar que su código se vuelva a ejecutar después de un reinicio del sistema, un cierre de sesión, o en un momento específico.
* **SimuThreat:** El comando `shutdown /s /t 60` simula una **acción programada**. En la realidad, esto sería reemplazado por la modificación del Registro de Windows (`Run` Keys) o la creación de Tareas Programadas maliciosas.
