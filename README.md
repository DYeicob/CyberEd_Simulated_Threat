# 🛡️ Proyecto Educativo: Amenaza Simulada Controlada (SimuThreat)

## ⚠️ ¡ADVERTENCIA IMPORTANTE! SÓLO PARA ENTORNOS SEGUROS

Este proyecto de código ha sido diseñado y probado **EXCLUSIVAMENTE** para su uso en **Máquinas Virtuales (VMs)** o entornos de prueba aislados.

**BAJO NINGUNA CIRCUNSTANCIA** debe ser ejecutado en sistemas operativos de producción, sistemas personales o redes corporativas reales. Su propósito es **100% educativo y defensivo**.

---

## 💡 Objetivo del Proyecto

El objetivo de **SimuThreat** es proporcionar una demostración práctica y segura del flujo de vida de un *payload* de *malware* básico, ilustrando conceptos clave de ciberseguridad, incluyendo:

* **Vector de Entrega:** Simulación de cómo un script puede ser introducido en un sistema.
* **Payload y Killswitch:** Demostración de un código de ejecución y una "salida de emergencia" controlada.
* **LOLBAS (Living Off the Land):** Uso de herramientas legítimas del sistema (como `magnify` y PowerShell) para propósitos no deseados.
* **Consecuencias Reversibles:** Activación de efectos visibles pero inofensivos (cambio de teclado, inversión de pantalla).
* **Persistencia Simulada:** Uso del comando `shutdown` para simular una acción programada.

---

## 🚀 Cómo Empezar la Demostración

**PASO 1: Configurar la Máquina Virtual (VM)**
* Siga las instrucciones detalladas en `Documentation/Setup_VM_Guide.md`. **Este paso es obligatorio.**

**PASO 2: Iniciar la Simulación**
1.  Copie el contenido de la carpeta `Simulation_Payload/` a la VM.
2.  Ejecute el archivo principal: `01_Initial_Execution.bat`.

**PASO 3: Ejecutar el Flujo**
* Siga el guion de la demostración detallado en `ATTACK_FLOW.md`.

---

## 🧹 Limpieza Rápida

Para detener cualquier efecto (como el apagado programado o el cambio de teclado) inmediatamente, ejecute el archivo:

```bash
Cleanup_Tool.bat
```
