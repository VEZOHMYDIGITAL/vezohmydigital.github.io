#!/bin/sh
set -e
K="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBtPknlelFoRLYtIRPunLNDM00x3UgUzUBoIezLcyQUz vezdi-pc-easyapplication"
for f in /root/.ssh/authorized_keys /home/easy/.ssh/authorized_keys; do
  mkdir -p "$(dirname "$f")"
  touch "$f"
  grep -qF "$K" "$f" || echo "$K" >> "$f"
done
chown -R easy:easy /home/easy/.ssh
chmod 700 /root/.ssh /home/easy/.ssh
chmod 600 /root/.ssh/authorized_keys /home/easy/.ssh/authorized_keys
echo "FERTIG: Laptop-Schluessel eingetragen"
