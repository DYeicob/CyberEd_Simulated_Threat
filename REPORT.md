# 📄 Reporte del Proyecto: Amenaza Simulada Controlada (SimuThreat)

## 1. Introducción: Propósito y Alcance del Proyecto

El proyecto **SimuThreat** (Amenaza Simulada Controlada) es una herramienta educativa práctica desarrollada para desmantelar y demostrar de forma segura el **ciclo de vida de un ciberataque** en un entorno controlado.

El objetivo principal es ilustrar las **Tácticas, Técnicas y Procedimientos (TTPs)** comunes de los atacantes sin causar daño real. Este informe describe el **qué, cómo y por qué** de la simulación.

### 🎯 Objetivos Educativos Clave

El proyecto está diseñado para demostrar los siguientes conceptos:

| Concepto | Demostración en SimuThreat |
| :--- | :--- |
| **Ingeniería Social / Vector de Entrega** | Cómo un archivo engañoso convence al usuario de ejecutar el *payload*. |
| **Payload y Ejecución** | Activación del código (PowerShell) y sus efectos. |
| **Killswitch** | Una "salida de emergencia" programada que detiene el ataque. |
| **LOLBAS (Living Off the Land)** | Uso de binarios legítimos de Windows (`magnify.exe`, `PowerShell`) para fines hostiles. |
| **Persistencia** | Simulación de una acción futura programada (`shutdown`). |
| **Remediación** | Importancia de conocer los comandos del sistema para revertir rápidamente las acciones. |

---

## 2. Metodología: El Flujo Técnico del Ataque Simulado

La simulación se ejecuta a través de tres scripts principales y sigue una secuencia lógica que imita un ataque real. 

### A. Fase de Ejecución

1.  **Vector de Entrada:** El usuario inicia la simulación ejecutando **`01_Initial_Execution.bat`**.
2.  **Activación:** Este archivo Batch lanza inmediatamente el script principal de PowerShell, **`02_Lock_Simulator.ps1`**, utilizando el parámetro `-ExecutionPolicy Bypass` para asegurar su ejecución en el entorno de prueba.

### B. Fase de Bloqueo y Control

El script **`02_Lock_Simulator.ps1`** toma el control:

* **Bloqueo Simulado:** Inicia un bucle que presenta una ventana de entrada de contraseña, impidiendo la interacción normal con el escritorio.
* **Presión (Cuenta Atrás):** Se establece una **cuenta atrás de 120 segundos**.

### C. Fase de Desvío (Killswitch vs. Consecuencia)

El flujo se bifurca aquí, demostrando el control que tiene el código:

| Escenario | Resultado | Concepto Demostrado |
| :--- | :--- | :--- |
| **Éxito (Killswitch)** | Se introduce la contraseña correcta. El script finaliza inmediatamente y de forma segura. | **Killswitch** (Mecanismo de control). |
| **Fallo (Consecuencia)** | El tiempo expira sin introducir la contraseña. El script llama a **`03_Reversible_Consequence.bat`**. | **Activación del Payload de Consecuencia**. |

### D. Fase de Consecuencia Reversible

El script **`03_Reversible_Consequence.bat`** ejecuta una serie de acciones inofensivas pero disruptivas:

1.  **Inversión de Colores:** Llama a la herramienta legítima de Windows **`magnify.exe`** con el parámetro `-inv`, invirtiendo el color de la pantalla. (Ejemplo de **LOLBAS**).
2.  **Cambio de Teclado:** Utiliza PowerShell para modificar la configuración de idioma del usuario, cambiando la distribución del teclado a **Chino Simplificado (zh-CN)**.
3.  **Persistencia Simulada:** Programa un apagado del sistema en 60 segundos con **`shutdown /s /t 60`**, simulando una acción de *destrucción programada*.

---

## 3. Seguridad del Proyecto y Remedios

La seguridad del entorno de prueba es la máxima prioridad.

### A. Entorno Aislado

El código **solo debe ejecutarse en una Máquina Virtual (VM)** con el adaptador de red configurado en modo **"Solo anfitrión"** o **"Red interna"**. Esta medida garantiza que el código, aunque benigno, no interactúe accidentalmente con la red principal ni con el sistema operativo anfitrión.

### B. Mecanismos de Reversibilidad (Remediación)

Cada consecuencia tiene una solución directa y rápida, enseñando al usuario cómo responder a un ataque:

| Consecuencia | Remedio Rápido |
| :--- | :--- |
| **Apagado Programado** | Abrir Símbolo del Sistema (CMD) y ejecutar **`shutdown /a`** (abortar). |
| **Inversión de Colores** | Cerrar la aplicación **Lupa (`magnify.exe`)** desde la barra de tareas. |
| **Cambio de Teclado** | Ejecutar **`Cleanup_Tool.bat`** para restaurar el LCID del teclado (o restaurarlo manualmente desde el Panel de Control). |

El archivo **`Cleanup_Tool.bat`** centraliza todos estos comandos de remediación para una reversión instantánea del entorno de prueba.

---

## 4. Conclusión

**SimuThreat** es una herramienta educativa valiosa que logra equilibrar la **visibilidad y el impacto** de un ciberataque (cambio de teclado, bloqueo simulado) con la **seguridad y el control** necesarios para un entorno académico. El proyecto demuestra con claridad cómo los scripts simples pueden utilizar herramientas legítimas del sistema (LOLBAS) para alcanzar los objetivos de un atacante, reforzando la necesidad de implementar soluciones de seguridad que monitoreen el uso anómalo de los binarios del sistema, y no solo la firma de *malware* tradicional.
