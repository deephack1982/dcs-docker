#!/bin/bash
WORKDIR=notset

WINEDLLOVERRIDES=wbemprox=n WINEESYNC=1 WINEPREFIX=~/Games wine C:\\Program\ Files\\Eagle\ Dynamics\\DCS\ World\ OpenBeta\ Server\\bin\\DCS.exe --server --norender --quiet -w $WORKDIR