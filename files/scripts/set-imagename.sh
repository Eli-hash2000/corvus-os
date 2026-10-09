#!/usr/bin/env bash
set -oue pipefail

#### Change os name to CorviOS in /usr/lib/os-release

IMAGE_DATE=$(date +%Y%m%d.%H)
MAJOR_RELEASE_VERSION=$(grep -oP '[0-9]*' /etc/fedora-release)
sed -i "s,^NAME=.*,NAME=\"Corvus-OS\"," /usr/lib/os-release
sed -i "s,^DEFAULT_HOSTNAME=.*,DEFAULT_HOSTNAME=\"Corvus-OS\"," /usr/lib/os-release
sed -i "s,^PRETTY_NAME=.*,PRETTY_NAME=\"Corvus-OS ${MAJOR_RELEASE_VERSION}.${IMAGE_DATE}\"," /usr/lib/os-release
