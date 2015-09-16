#! /bin/sh
set -ex

SCRIPT_DIR=$(dirname $0)

$SCRIPT_DIR/all-headless.sh

# Needed to build wxwidgets
$SCRIPT_DIR/gtk.sh

# Used for virtual desktop
$SCRIPT_DIR/xvfb.sh
