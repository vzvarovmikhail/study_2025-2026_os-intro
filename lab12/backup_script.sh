#!/bin/bash
if [ ! -d ~/backup ]; then
	mkdir -p ~/backup
	echo "Каталог ~/backup создан."
fi
SCRIPT_NAME=$(basename "$0")
BACKUP_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

tar -czf ~/backup/"$BACKUP_NAME" "$0"

echo "Резервная копия создана: ~/backup/~BACKUP_NAME"
