#!/bin/sh

FIRMWARE_DIR=/var/www/firmware
TEMPLATE_DIR=$(dirname $0)
TARGET_FILE=/var/www/wordpress/ressources/firmware.html

STABLE_VERSION=$(awk '/^[a-z].*[\s]/ {print $2}' < $FIRMWARE_DIR/stable/sysupgrade/stable.manifest | tail -n1)
BETA_VERSION=$(awk '/^[a-z].*[\s]/ {print $2}' < $FIRMWARE_DIR/beta/sysupgrade/beta.manifest | tail -n1)
EXPERIMENTAL_VERSION=$(awk '/^[a-z].*[\s]/ {print $2}' < $FIRMWARE_DIR/experimental/sysupgrade/experimental.manifest | tail -n1)
export STABLE_VERSION;
export BETA_VERSION;
export EXPERIMENTAL_VERSION;

sed -e "s/STABLE_VERSION/$STABLE_VERSION/g" -e "s/BETA_VERSION/$BETA_VERSION/g" -e "s/EXPERIMENTAL_VERSION/$EXPERIMENTAL_VERSION/g" $TEMPLATE_DIR/template.html > $TARGET_FILE
