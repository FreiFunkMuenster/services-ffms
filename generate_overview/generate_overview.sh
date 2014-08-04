#!/bin/sh

FIRMWARE_DIR=/var/www/firmware
TEMPLATE_DIR=$(dirname $0)
TARGET_FILE=/var/www/wordpress/ressources/firmware.html

STABLE_VERSION=$(awk '{print $2}' < $FIRMWARE_DIR/stable/sysupgrade/stable.manifest | sort | uniq | tail -n3)
BETA_VERSION=$(awk '{print $2}' < $FIRMWARE_DIR/beta/sysupgrade/beta.manifest | sort | uniq | tail -n3)
EXPERIMENTAL_VERSION=$(awk '{print $2}' < $FIRMWARE_DIR/experimental/sysupgrade/experimental.manifest | sort | uniq | tail -n3)
export STABLE_VERSION;
export BETA_VERSION;
export EXPERIMENTAL_VERSION;

sed -e "s/STABLE_VERSION/$STABLE_VERSION/g" -e "s/BETA_VERSION/$BETA_VERSION/g" -e "s/EXPERIMENTAL_VERSION/$EXPERIMENTAL_VERSION/g" $TEMPLATE_DIR/template.html > $TARGET_FILE
