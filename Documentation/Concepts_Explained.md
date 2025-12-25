# 📚 Cybersecurity Concepts Explained

The **SimuThreat** project is designed to provide a practical demonstration of the following defensive and security concepts:

## 1. Benign Payload vs. Real Malware

* **Definition:** A **payload** is the component of an attack that performs the specific action intended by the attacker (e.g., data theft, encryption, or system disruption).
* **SimuThreat:** Our payload (`02_Lock_Simulator.ps1`) only executes a lockdown function and minor configuration changes without encrypting files or exfiltrating data. Real-world **malware** would contain destructive or espionage-oriented malicious code.



## 2. Killswitch

* **Definition:** A mechanism embedded within malicious code that allows the developer or attacker to stop its operation immediately. 
* **SimuThreat:** The password in `02_Lock_Simulator.ps1` acts as a **Killswitch**. In a real-world scenario, a killswitch might be triggered by a specific domain name (as seen in the WannaCry ransomware), a registry key, or a remote command from a Command and Control (C2) server.

## 3. LOLBAS (Living Off the Land Binaries and Scripts)

* **Definition:** The practice of utilizing legitimate, pre-installed system tools (such as PowerShell, `cmd.exe`, `bitsadmin`, or `certutil`) to perform malicious actions.
* **SimuThreat:**
    * **PowerShell:** Used for the core logic and modifying user language settings.
    * **`magnify.exe`:** Used to invert screen colors.
* **Defensive Importance:** Using trusted binaries allows attackers to bypass traditional antivirus signatures. Security professionals must monitor for **anomalous behavior** in these trusted tools rather than just blocking the files themselves.



## 4. Persistence (Simulated)

* **Definition:** Techniques used by attackers to maintain access to a system across restarts, logoffs, or other interruptions.
* **SimuThreat:** The `shutdown /s /t 60` command simulates a **scheduled action**. In a professional penetration test or a real attack, persistence is typically achieved through:
    * **Registry Run Keys:** Automatically launching code on startup.
    * **Scheduled Tasks:** Executing code at specific intervals.
    * **Service Creation:** Running malicious code as a background system service.
