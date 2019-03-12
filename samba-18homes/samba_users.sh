#! /bin/bash
# @edt ASIX M06 2018-2019
# users samba
# -------------------------------------

useradd lila
useradd pla
useradd patipla
useradd rock

echo -e "pla\npla" | smbpasswd -a pla
echo -e "patipla\npatipla" | smbpasswd -a patipla
echo -e "rock\nrock" | smbpasswd -a rock
echo -e "lila\nlila" | smbpasswd -a lila
echo -e "pere\npere" | smbpasswd -a pere
echo -e "pau\npau" | passwd -a pau
echo -e "marta\nmarta" | smbpasswd -a marta


