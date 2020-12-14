# WAQ - Windows 10 for ARM on QEMU

## Why do this?
Microsoft has released Windows 10 for ARM64 for several years. This sound interesting and you want to try this right? But if you don't have
a real ARM cpu, the only way is running it inside QEMU.

<br> There are some pages show how to do this on the Internet. But the problem is, you will have to download the iso and install yourself
and this takes <b>really long time</b> to install on QEMU (about 3 -> 4 days on my machine with <i>Pentium Dualcore T4300</i>). Another way
is to apply the install.wim to a vhd file and put it to QEMU, but this might not work due to missing EFI loader (I have tried this too).

<br>So in this gist I will give you my modified version of preinstalled img file originally from <a href="https://discourse.pi64.win/t/how-to-installing-windows-10-arm64-17134-on-your-raspberry-pi-3-and-4/488/4">this post</a>
and the download link is <a href="https://mega.nz/#F!kJI3HIAS!CQAUKgp6thSAA_A2GbgdjA">here</a>.

## What have been modified?
- Disable Pagefile
- Disable Search Index
- Disable Printer Service
- Fixed EFI

## Download link
- <a href="https://drive.google.com/file/d/1AkEPWPXm_N3jzcDk58p2uJbi7HENA2sq/view?usp=sharing">FreeArc compressed version</a>. You must use FreeArc to extract it. (Size: 4.0 GB)
- <a href="https://drive.google.com/file/d/1XmCJDlcITesHN5oW01ySUU1eyLF_fUE-/view?usp=sharing">7z compressed version</a> (Size: 4.2GB)

## How to use
Step 1: Install QEMU
<br>    Goto <a href="https:\\qemu.org">qemu.org</a> and install QEMU if you haven't installed it yet.
<br>    On Linux just run ```sudo apt install qemu-system-aarch64```
        
Step 2: Clone the repo
<br>    ```bash
        git clone https://github.com/raspiduino/waq/
        cd waq
        ```

Step 3: (Optional) Install Virtio driver
<br>    Download the driver iso <a href="https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso">here</a> and put it to the vm directory.
<br>    <b>IMPORTANT:</b> If you don't want to install Virtio driver or you finished install it, you can delete it (if you have downloaded it) and comment out the 2 last line in the script. For Linux/MacOS script, just remove ```-device usb-storage,drive=drivercdrom -drive file="virtio-win-0.1.185.iso",media=cdrom,if=none,id=drivercdrom``` from arm.sh

Step 4: Start the script
<br>    Just like normal script, ```./arm.sh``` for Linux/MacOS and ```arm.sh``` for Windows

<br>Notes:
- The emulator may be so lag when you boot it. After a while when the desktop loaded, you can use it normally.
- This image file can be used to flash the real rpi