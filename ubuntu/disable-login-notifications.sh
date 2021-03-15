#!/usr/bin/env bash

# Disables login notifications for the GNOME desktop environment

keys=/etc/dconf/db/gdm.d/no-notifications
locks=/etc/dconf/db/gdm.d/locks/no-notifications
profile=/etc/dconf/profile/gdm

install -D /dev/null $keys
install -D /dev/null $locks
install -D /dev/null $profile

echo "[org/gnome/desktop/notifications]
show-banners=false" >> $keys

echo "/org/gnome/desktop/notifications/show-banners" >> $locks

echo "user-db:user
system-db:gdm" >> $profile

dconf update

# To revert the changes made by this script:
# 1. Delete /etc/dconf/profile/gdm,
# 2. Delete /etc/dconf/db/gdm.d, and
# 3. Run `dconf update`.
