# 📈 Simulated Attack Demonstration Flow (SimuThreat)

This document guides the instructor (or the user) through the phases of the simulated attack.

## PHASE 1: Delivery Vector (Social Engineering)

* **Action:** The instructor explains that the file `01_Initial_Execution.bat` simulates a file downloaded from a phishing email or a malicious website.
* **Concept:** User trust is the primary attack vector.
* **Execution:** The user double-clicks `01_Initial_Execution.bat`.

## PHASE 2: Payload Execution and Lockdown

* **Action:** `01_Initial_Execution.bat` silently executes the PowerShell script (`02_Lock_Simulator.ps1`).
* **Effect:** A "SECURITY ALERT" pop-up window appears with a 120-second countdown.
* **Concept:** The payload has executed and taken control of the user's interaction loop.

## PHASE 3A: Success Option (Using the Killswitch)

* **Instruction:** Demonstrate that the attack is "controlled" by the attacker.
* **Action:** Before the time expires, enter the secret password (defined in the script, e.g., `mySecretPassword`).
* **Result:** The script closes immediately, stopping the flow without further consequences.
* **Concept:** Demonstration of the **Killswitch** — a programmed exit used for testing and sometimes by real-world attackers.

## PHASE 3B: Failure Option (Consequence Activation)

* **Instruction:** Allow the countdown to reach zero.
* **Action:** When time expires, the PowerShell script calls `03_Reversible_Consequence.bat`.
* **Effect:**
    1.  The Magnifier tool is activated (`magnify -inv`), inverting the screen colors.
    2.  The keyboard layout is changed to Chinese (Simplified).
    3.  A system shutdown notice appears, scheduled for 60 seconds.
* **Concepts:** **LOLBAS** (Magnifier) and **Simulated Persistence** (Scheduled shutdown).

## PHASE 4: Reversion and Analysis (Defense)

* **Action:** The user must manually revert the consequences.
* **Reversion Steps:**
    1.  Open the Command Prompt and type `shutdown /a` to cancel the shutdown.
    2.  Close the "Magnifier" application (magnify) by clicking its icon or closing its window.
    3.  Execute `Cleanup_Tool.bat` to restore the keyboard layout (or do so manually via Control Panel).
* **Concept:** **Remediation** and the importance of knowing system commands to undo unwanted actions.
