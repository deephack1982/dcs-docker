#!/bin/bash

mkdir ~/Games
WINEPREFIX=~/Games wineboot --init
wget https://www.digitalcombatsimulator.com/upload/iblock/937/DCS_World_OpenBeta_Server_web_5.exe
read -p "*** Now we will install DCS, press enter ***"
WINEPREFIX=~/Games wine DCS_World_OpenBeta_Server_web_5.exe
