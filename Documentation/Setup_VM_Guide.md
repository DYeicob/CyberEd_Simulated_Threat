# 🛠️ Secure Virtual Machine (VM) Setup Guide

**NEVER execute this code on your primary system.** Follow this guide to set up a secure testing environment.

## 1. Requirements

* Virtualization Software (e.g., **VirtualBox**, **VMware Workstation Player**).
* A Windows OS ISO image (Windows 10 or 11) to install on the VM.

## 2. VM Configuration

1.  **Install the OS:** Create a new virtual machine and install the test Windows operating system.
2.  **Isolated Network Mode:** Configure the VM's network adapter to **"Host-Only"** or **"Internal Network"** mode. This ensures complete isolation from your home or corporate network.



3.  **Snapshot:** Once the OS is fully installed and functional, **take a Snapshot**. This allows you to revert the VM to this clean state in seconds, regardless of any *simulated* damage caused by the payload.



## 3. Preparing the Test Environment

1.  **Create a Folder:** Inside the VM, create a folder named `C:\TestEnv`.
2.  **File Transfer:** Use the "Drag and Drop" feature of your virtualization software (or a shared folder) to transfer the contents of `Simulation_Payload/` and `Cleanup_Tool.bat` to `C:\TestEnv` inside the VM.

## 4. Quick Reversion

If the payload causes any unexpected issues:

* **Option A (Recommended):** Power off the VM and **revert to the snapshot** taken in Step 2.
* **Option B (Manual):** Run `Cleanup_Tool.bat` and restart the VM.
