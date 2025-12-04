# 🛠️ Guía de Configuración de Máquina Virtual (VM) Segura

**NUNCA ejecute este código en su sistema principal.** Siga esta guía para configurar un entorno seguro.

## 1. Requisitos

* Software de Virtualización (ej. **VirtualBox**, **VMware Workstation Player**).
* Una imagen ISO de un sistema operativo Windows (Windows 10 o 11) para instalar en la VM.

## 2. Configuración de la VM

1.  **Instalar el SO:** Cree una nueva máquina virtual e instale el sistema operativo Windows de prueba.
2.  **Modo de Red Aislado:** Configure el adaptador de red de la VM en modo **"Solo anfitrión"** (*Host-Only*) o **"NAT"** (sin redireccionamiento de puertos) o, idealmente, **"Red interna"** para aislarlo completamente de su red doméstica o corporativa.
3.  **Snapshot (Instantánea):** Una vez que el sistema operativo esté completamente instalado y funcional, **tome una instantánea (Snapshot)**. Esto permite revertir la VM a este estado limpio en segundos, sin importar el daño *simulado* que cause el *payload*.

## 3. Preparación del Entorno de Prueba

1.  **Cree una Carpeta:** Dentro de la VM, cree una carpeta llamada `C:\TestEnv`.
2.  **Transferencia de Archivos:** Use la función de arrastrar y soltar de su software de virtualización (o una carpeta compartida) para transferir los contenidos de `Simulation_Payload/` y `Cleanup_Tool.bat` a `C:\TestEnv` en la VM.

## 4. Reversión Rápida

Si el *payload* causa cualquier problema inesperado:

* **Opción A (Recomendada):** Apague la VM y **revierta a la instantánea** tomada en el Paso 2.
* **Opción B (Manual):** Ejecute `Cleanup_Tool.bat` y reinicie la VM.
