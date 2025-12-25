# 📄 Project Report: Controlled Simulated Threat (SimuThreat)

## 1. Introduction: Purpose and Scope
The **SimuThreat** (Controlled Simulated Threat) project is a hands-on educational tool developed to safely deconstruct and demonstrate the **cyberattack lifecycle** within a controlled environment.

The primary goal is to illustrate common attacker **Tactics, Techniques, and Procedures (TTPs)** without causing actual harm. This report describes the **what, how, and why** of the simulation.

### 🎯 Key Educational Objectives
The project is designed to demonstrate the following concepts:

| Concept | Demonstration in SimuThreat |
| :--- | :--- |
| **Social Engineering / Delivery Vector** | How a deceptive file convinces the user to execute the *payload*. |
| **Payload and Execution** | Activation of the code (PowerShell) and its effects. |
| **Killswitch** | A programmed "emergency exit" that halts the attack. |
| **LOLBAS (Living Off the Land)** | Using legitimate Windows binaries (`magnify.exe`, `PowerShell`) for hostile purposes. |
| **Persistence** | Simulating a scheduled future action (`shutdown`). |
| **Remediation** | The importance of knowing system commands to quickly revert actions. |

---

## 2. Methodology: The Technical Flow of the Simulated Attack
The simulation runs through three main scripts and follows a logical sequence that mimics a real-world attack.

### A. Execution Phase
1. **Entry Vector:** The user starts the simulation by running `01_Initial_Execution.bat`.
2. **Activation:** This Batch file immediately launches the main PowerShell script, `02_Lock_Simulator.ps1`, using the `-ExecutionPolicy Bypass` parameter to ensure execution within the testing environment.

### B. Lockdown and Control Phase
The script `02_Lock_Simulator.ps1` takes control:
* **Simulated Lock:** It initiates a loop that presents a password input window, preventing normal interaction with the desktop.
* **Pressure (Countdown):** A **120-second countdown** is established.

### C. Branching Phase (Killswitch vs. Consequence)
The flow branches here, demonstrating the control provided by the code:

| Scenario | Result | Concept Demonstrated |
| :--- | :--- | :--- |
| **Success (Killswitch)** | The correct password is entered. The script terminates immediately and safely. | **Killswitch** (Control Mechanism). |
| **Failure (Consequence)** | Time expires without entering the password. The script calls `03_Reversible_Consequence.bat`. | **Consequence Payload Activation**. |

### D. Reversible Consequence Phase
The script `03_Reversible_Consequence.bat` executes a series of harmless but disruptive actions:
1. **Color Inversion:** Calls the legitimate Windows tool `magnify.exe` with the `-inv` parameter, inverting the screen colors (**LOLBAS** example).
2. **Keyboard Layout Change:** Uses PowerShell to modify the user's language settings, changing the keyboard layout to **Simplified Chinese (zh-CN)**.
3. **Simulated Persistence:** Schedules a system shutdown in 60 seconds using `shutdown /s /t 60`, simulating a *scheduled destructive action*.

---

## 3. Project Safety and Remediation
Test environment safety is the highest priority.

### A. Isolated Environment
The code **must only be executed in a Virtual Machine (VM)** with the network adapter configured to **"Host-only"** or **"Internal Network"** mode. This measure ensures that the code, although benign, does not accidentally interact with the main network or the host operating system.

### B. Remediation Mechanisms
Each consequence has a direct and quick solution, teaching the user how to respond to an attack:

| Consequence | Quick Remedy |
| :--- | :--- |
| **Scheduled Shutdown** | Open Command Prompt (CMD) and run `shutdown /a` (abort). |
| **Color Inversion** | Close the **Magnifier (`magnify.exe`)** application from the taskbar. |
| **Keyboard Change** | Run `Cleanup_Tool.bat` to restore the keyboard LCID (or restore it manually via Control Panel). |

The `Cleanup_Tool.bat` file centralizes all these remediation commands for an instant reversal of the test environment.

---

## 4. Conclusion
**SimuThreat** is a valuable educational tool that balances the **visibility and impact** of a cyberattack with the **safety and control** necessary for an academic setting. The project clearly demonstrates how simple scripts can utilize legitimate system tools (LOLBAS) to achieve attacker objectives, reinforcing the need for security solutions that monitor anomalous use of system binaries, rather than just traditional malware signatures.
