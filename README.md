# First Run
## Installation of DCS
VNC to the docker and click cancel when asked to install mono. Wait for the wine config update to happen and then run the DCS Install script on the desktop. Untick create desktop icon and later untick start download. Let the updater self update and then install DCS. This will take a long time. Once done restart the docker and ensure that DCS starts normally. Now you can configure it and use it.

## Installation of LotAtc (optional)
VNC to the docker and run the lotatc-install script from the desktop. Choose to install into the folder C:\Program Files\LotAtc and select all components except Applications/LotAtc Client. Once the configurator starts choose the latest branch and click install. Then choose your config profile. Click the fix it button and then close the configurator.