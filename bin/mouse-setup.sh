#!/bin/sh

# MacBook Pro 11,4 touchpad tweaks

# the code is taken from this article:
# http://uselessuseofcat.com/?p=74

# sensitivity
# currently, not working... don't care just for now
#synclient FingerHigh=50

# tap-to-click
synclient TapButton1=1
synclient TapButton2=2
synclient TapButton3=3
synclient TapAndDragGesture=0

# disable the corner buttons
synclient RTCornerButton=0
synclient RBCornerButton=0
synclient LTCornerButton=0
synclient LBCornerButton=0

# enable palm detection
synclient PalmDetect=1
