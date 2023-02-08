#!/bin/bash

WINEPREFIX=~/Games wine C:\\Program\ Files\\Eagle\ Dynamics\\DCS\ World\ OpenBeta\ Server\\bin\\DCS_updater.exe --quiet
sleep 15
xdotool windowmove $(xdotool search --onlyvisible 'DCS Login') 10 10