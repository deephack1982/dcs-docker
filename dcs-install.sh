#!/bin/bash

mkdir ~/Games
WINEPREFIX=~/Games wineboot --init
WINEPREFIX=~/Games wincfg -v win10
wget https://www.digitalcombatsimulator.com/upload/iblock/937/DCS_World_OpenBeta_Server_web_5.exe
read -p "*** Now we will install DCS, press enter ***"
WINEPREFIX=~/Games wine DCS_World_OpenBeta_Server_web_5.exe
WINEPREFIX=~/Games winecfg -v win10
WINEPREFIX=~/Games wine C:\\Program\ Files\\Eagle\ Dynamics\\DCS\ World\ OpenBeta\ Server\\bin\\DCS_updater.exe update
