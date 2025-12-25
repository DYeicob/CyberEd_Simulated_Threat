# 🛡️ Educational Project: Controlled Simulated Threat (SimuThreat)

## ⚠️ IMPORTANT WARNING! FOR SECURE ENVIRONMENTS ONLY

This code project has been designed and tested **EXCLUSIVELY** for use in **Virtual Machines (VMs)** or isolated testing environments.

**UNDER NO CIRCUMSTANCES** should this be executed on production operating systems, personal devices, or real corporate networks. Its purpose is **100% educational and defensive**.

---

## 💡 Project Objective

The goal of **SimuThreat** is to provide a practical and safe demonstration of the lifecycle of a basic *malware payload*, illustrating key cybersecurity concepts, including:

* **Delivery Vector:** Simulation of how a script can be introduced into a system.
* **Payload and Killswitch:** Demonstration of execution code and a controlled "emergency exit."
* **LOLBAS (Living Off the Land Binaries and Scripts):** Utilizing legitimate system tools (such as `magnify` and PowerShell) for unintended purposes.
* **Reversible Consequences:** Activation of visible but harmless effects (keyboard layout change, screen inversion).
* **Simulated Persistence:** Use of the `shutdown` command to simulate a scheduled action.

---

## 🚀 How to Start the Demonstration

**STEP 1: Set Up the Virtual Machine (VM)**
* Follow the detailed instructions in `Documentation/Setup_VM_Guide.md`. **This step is mandatory.**

**STEP 2: Start the Simulation**
1. Copy the contents of the `Simulation_Payload/` folder to the VM.
2. Execute the main file: `01_Initial_Execution.bat`.

**STEP 3: Follow the Flow**
* Follow the demonstration script detailed in `ATTACK_FLOW.md`.

---

## 🧹 Quick Cleanup

To immediately stop any effects (such as the scheduled shutdown or keyboard change), execute the following file:

```bash
Cleanup_Tool.bat
```
