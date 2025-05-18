# Intune-Enrollment-Tool
# Enrollment Solution

This PowerShell-based tool provides a menu with several options to manage and troubleshoot device enrollments. Each option runs a different batch file to perform specific tasks. Below are the details of each menu option:

## 📋 Commands and Descriptions

### 1. 📝 GPRESULT HTML Report
- **Description:** Checks the Group Policy Objects (GPOs) applied to the device using the `GPRESULT` command.
- **Action:** Creates a folder named `gpresult` in the script's directory, generates an HTML report with a timestamped filename, and opens the report in the default web browser.
- **Usage:** Used to review the Group Policy Objects applied to the device.

### 2. 📊 DSREGCMD Status
- **Description:** Reports the current enrollment status of the device using the `DSREGCMD /status` command.
- **Action:** Executes the command to display the device's enrollment status.
- **Usage:** Used to verify the enrollment status and troubleshoot any issues related to device enrollment.

### 3. ❌ DSREGCMD Leave
- **Description:** Removes the device from the current enrollment using the `DSREGCMD /leave` command.
- **Action:** Executes the command to unenroll the device from the current management system.
- **Usage:** Used to unenroll the device from the domain.

### 4. 🗑️ Enrollment Registry Delete
- **Description:** Deletes previous erroneous registry entries related to device enrollment.
- **Action:** Cleans up the registry to resolve issues caused by incorrect or outdated enrollment entries.
- **Usage:** Used to ensure a clean enrollment state by removing faulty registry entries.

### 5. 🔄 GPUPDATE Force
- **Description:** Forces the device to update its Group Policy settings using the `GPUPDATE /force` command.
- **Action:** Executes the command to apply the latest Group Policy settings immediately.
- **Usage:** Used to enforce Group Policy changes on the device.

### 6. 🚀 Auto Enrollment Task
- **Description:** Forces the execution of the Auto Enrollment Task.
- **Action:** Triggers the automatic enrollment process to ensure the device is enrolled correctly.
- **Usage:** Used to initiate the automatic enrollment process.

### 📷 Sample Menu Interface
Below is a placeholder for the sample menu interface of the tool:

![image](https://github.com/user-attachments/assets/957de8d7-0b21-4009-85b5-b49e95c6006f)



> **Note:** The menu interface image is provided as an example. The actual interface is text-based and displayed in the PowerShell window.

## 🚀 Usage Instructions
1. Run the PowerShell
2. Execute "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass" 
3. Enter the path of script where you dowload (for Example: CD c:\sciprt) and ".\Enrollment-Solution.ps1"
4. Enter a menu option (1-6 or Q).
5. The selected command will be executed, and the results will be displayed on the screen.

---

This tool is designed to simplify daily tasks for system administrators. If you encounter any issues, please contact your system administrator.
