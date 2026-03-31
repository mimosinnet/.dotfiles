#!/usr/bin/env zsh

/home/mimosinnet/Dades/Scripts/Actius/Segur.zsh \
  --uuid 7AC66ED8C66E93E3 \
  --exclude /home/mimosinnet/Dades/Sistema/ExclouArxiusSegurUSB.txt \
  --origin /home/mimosinnet/Dades/Documents \
  --destination /mnt/USB/7AC66ED8C66E93E3 

/home/mimosinnet/Dades/Scripts/Actius/Segur.zsh \
  --uuid 7a7f5621-220c-4363-bcc6-89af0438a399 \
  --exclude /home/mimosinnet/Dades/Sistema/ExclouArxiusSegur.txt \
  --origin /mnt/chroot \
  --destination /mnt/BKP/bkp_chroot

/home/mimosinnet/Dades/Scripts/Actius/Segur.zsh \
  --uuid 56d6586b-c334-4f36-a890-df82a1baf053  \
  --exclude /home/mimosinnet/Dades/Sistema/ExclouArxiusSegur.txt \
  --origin /home/mimosinnet/Dades/Documents \
  --destination /mnt/BKP/bkp_documents \

/home/mimosinnet/Dades/Scripts/Actius/DF.zsh
