# <span style="color:#FF8500;">Xampp Installer</span>

<span style="color:#EDCDB6">This project was created with the aim of creating a simple installer for xampp and above all to add a launcher for xampp, avoiding having to open it via command line, so as to have everything at hand.</span>

<span style="color:#EDCDB6">It also adds another launcher that takes us directly to the xampp htdocs and all with a simple click (especially useful if you use a plank-type bottom docker). </span>

---

## <span style="color:#FF8500">INSTALLATION</span>

#### <u style="color:#80B847;">Preparing Git folder</u>

The installer for xampp is really easy and automatically.
First of all, create a folder where to download this repository:

    `$ mkdir /home/user/Desktop/xampp-installer`

Change directory in this folder:

    `$ cd /home/user/Desktop/xampp-installer`

Let's copy the repository:

    `$ git clone https://github.com/SimoLinuxDesign/Xampp-Installer.git`

Now you have all the required installation files in your folder.

#### <u style="color:#80B847;">Installation Starting</u>

Now, we are ready to install Xampp.
The first thing that we have to do is to change the user permission to execute the script "**install.sh**".

Go into the directory that we cloned the repository from your terminal with the "**cd**" command:

    `$ cd /home/user/Desktop/xampp-installer`

and now we have to write:

    `$ sudo chmod 775 install.sh`

Insert the sudo password, and after that we are able to execute the script install with this command:

    `$ ./install.sh`

And so, welcome to the installer! =)

#### <u style="color:#80B847;">Installation Explanation</u>

The installation is totally automatic. What you have to do only to follow all the installation process and only insert the sudo password when requested.

This script is going to check if there is xampp installation already presents in the folder /opt/lampp.

If there is any installation already present in the system, it will ask you if you would like to reinstall xampp again.

When you have do download the file, just do 1 right click on the link and then select the version that you would like to install of xampp and open the folder.

There should be a file that is named like:

    "xampp-linux-x64-8.2.12-0-installer.run"

Press the right mouse botton on it and select "copy link", and paste it on the terminal, and press "enter".

The donwload will start but is not taking longer (depends of your speed connection).

After that the installation will star, press next on evrything, and select the xampp core if is not already selected and when the installation is finished, uncheck the option "**open xampp**".

Now you can follow again the installation until the end. It will not take longer.

Once you finished, the installation is compleated =)!!

#### <u style="color:#80B847;">List of Installed Files</u>

This process will is going to install diffentents files:

- 2 Lauchers (xampp and Xampp htdocs).
- One script that is used to execute xampp on request.
- 1 readme file.
- 2 PNG icons.
- Lampp Folder (usually folder of xampp situated in: /opt/lampp).

When you clone the git repository, is important to **do not cancel any of those** files as they are **really important**. Is also present a uninstall file, that is going to remove all the files that has been installed if is runned.

The procedure run the unistall.sh is the same of the "install.sh".

<span style="color:red; font-weight:bold">P.S. Is really important to save all your project in htdocs before to run "uninstall.sh" otherwise you will lose everything. PLEASE KEEP IT IN MIND!!!</span>

---

## <span style="color:#FF8500">REPORTING BUGS</span>

#### <u style="color:#80B847;">How to report bugs</u>

If you have any issue during the installation or execution, please email me the at <a href="mailto:SimoLinuxDesign@gmail.com">SimoLinuxDesign@gmail.com</a>

#### <u style="color:#80B847;">Why reporting is important</u>

Reporting errors is important, as not all of us have the same system with the same hardware and software configuration. Therefore reporting errors is the best way to learn about crucial points that are not always visible on the current system.

---

## <span style="color:#FF8500">KNOWN BUGS - FIXED BUGS</span>

#### <u style="color:#80B847;">Known Bugs</u>

> No any known bugs at the moment.

#### <u style="color:#80B847;">Fixed Bugs</u>

> There's any bugs fixed at the moment.
