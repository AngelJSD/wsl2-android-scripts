# WSL2 Android scripts for React Native
This repository contains the setup instructions and the scripts to be able to launch/compile a react-native application from WSL2 directly to an Android virtual device running on Windows.

## Setup
#### WSL2 side:
- (WSL2) sudo apt-get update
- (WSL2) sudo apt-get install openjdk-11-jdk
- (WSL2) mkdir -p ~/Android/Sdk/tools
- (Windows) Go to (Command line tools only)[https://developer.android.com/studio#downloads] and download de linux option and unzip it
- (WSL2) Copy the content of the unziped folder to ~/Android/Sdk/tools (e.g. `cp -r /mnt/c/Users/User/Downloads/cmdline-tools/. /home/angel/Android/Sdk/tools/`)
- (WSL2) `export ANDROID_HOME=/home/angel/Android/Sdk`
- (WSL2) `export PATH=${PATH}:${ANDROID_HOME}/platform-tools`
- (WSL2) `export PATH=${PATH}:${ANDROID_HOME}/tools/bin`
- (WSL2) `sdkmanager "platform-tools" --sdk_root=$ANDROID_HOME`
- (WSL2) `adb version`
- (Windows) Open PowerShell and execute `adb.exe version` (e.g. `C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe version`)
- If the versions are the same skip the nect step
- (WSL2) `sudo ln -sf /home/angel/Android/Sdk/platform-tools/adb adb` (this step should solve the issue and the versions should be the same now)
- (WSL2) `nano ~/.bashrc`
- (wsl2) Add the following lines at the end:
```
export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"
export ANDROID_HOME=/home/<your-user>/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
```
- (WSL2) Copy the adb-bridge.sh script to your Dev folder
- (WSL2) `chmod +x adb-bridge.sh`

#### Windows side:
- Install Android Studio
- Ensure SDK Manager -> SDK tools is updated to the latest version
- Open ADV manager and launch a virtual device
- Close the device
- Copy the scripts ADB.bat, EMULATOR.bat to the Desktop

## Usage
Don't forget to edit the files ADB.bat, ADB.ps1 and EMULATOR.bat replacing all the strings that match `C:\Users\User` with `C:\Users\<your-user>`

1. (Windows) Execute as admin ADB.bat
2. (Windows) Execute EMULATOR.bat
3. (Windows) Pick an emulator
4. (WSL2) Execute `nohup ./adb-bridge.sh &`
5. (WSL2) `adb devices` should show the emulator in the list
