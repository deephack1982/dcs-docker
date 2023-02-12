#!/bin/bash
## Install in C:\Program Files\LotAtc
## Install everything except applications/LotAtc client

wget https://github.com/doitsujin/dxvk/releases/download/v2.1/dxvk-2.1.tar.gz
tar xzpf dxvk-2.1.tar.gz
cp dxvk-2.1/x64/*.dll ~/Games/drive_c/windows/system32
read -p "*** Winecfg will now load, make sure to set Windows version to Windows 10 and add d3d11, d3d10core, dxgi, and d3d9 to dll overrides ***"
WINEPREFIX=~/Games winecfg
wget https://www.lotatc.com/download/Setup_LotAtc.exe
WINEPREFIX=~/Games wine Setup_LotAtc.exe
