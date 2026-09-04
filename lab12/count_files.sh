#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Использование: $0 <расширение> <директория>"
	echo "Пример: $0 .txt /home/user"
	exit 1
fi

EXT="$1"
DIR="$2"

if [ ! -d "$DIR" ]; then
	echo "Ошибка: Директория $DIR не существует"
	exit 1
fi

count=$(find "$DIR" -type f -name "*$EXT" 2>/dev/null | wc -l)

echo "Количество файлов с расширением '$EXT' в директории '$DIR': $count"
