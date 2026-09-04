#!/bin/bash
DIR="${1:-.}"

if [ ! -d "$DIR"; then
	echo "Ошибка: $DIR не является каталогом"
	exit 1
fi

echo "Содержимое каталога: $DIR"
echo "================================"

for file in "$DIR"/*; do
	if [ -e "$file" ]; then
		perms=""
		[ -r  "$file" ] && perms="${perms}r" || perms="${perms}-"
		[ -w  "$file" ] && perms="${perms}w" || perms="${perms}-"
		[ -x  "$file" ] && perms="${perms}x" || perms="${perms}-"

		if [ -d "$file" ]; then
			type="[DIR]"
		elif [ -f "$file" ]; then
			 type="[FILE]"
		elif [ -L "$file" ]; then
			type="[LINK]"
		else
			type="[OTHER]"
		fi
		
		basename=$(basename "$file")
		echo "$type $perms $basename"
	fi
done
