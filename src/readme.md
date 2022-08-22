# Installation

Plain Ubuntu (22.04 LTS) aufsetzen

# Partitionen
- Boot Partition
partition: /dev/sda1:/boot/efi
EFI System
500 MB

- System Partition
partition: /dev/sda2:/ (Filesystem Root)
Ext4
60GB

- Data/Home Partition
partition: /dev/sda4:/home
Ext4

- Swap Partition (am Ende)
partition: /dev/sda3:
Linux Swap (Swap Version 1)
1GB

