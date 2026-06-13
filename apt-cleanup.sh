#!/usr/bin/env bash
set -euo pipefail

echo "Cleaning up APT packages..."

if [[ "${EUID}" -ne 0 ]]; then
    echo "ERROR: apt-cleanup must be run as root. Try: sudo apt-cleanup" >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

apt-get -f install -y
apt-get autoremove --purge -y
apt-get autoclean -y
apt-get clean

echo "APT cleanup complete."