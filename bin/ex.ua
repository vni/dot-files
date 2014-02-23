#!/bin/sh

#exec wget -c --restrict-file-names=nocontrol --trust-server-names=on --limit-rate=20k -i $@
exec wget -c --restrict-file-names=nocontrol --trust-server-names=on -i $@
