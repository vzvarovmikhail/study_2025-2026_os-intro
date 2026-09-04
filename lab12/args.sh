#!/bin/bash

echo "Количество аргументов: $#"
echo "Все аргументы: $@"
echo "Имя скрипта: $0"
echo "---"

count=1
fоr arg in "$@"; do
	echo "Аргумент $count: $arg"
	count=$((count + 1))
done

echo "---"
echo "Обработка через shift:"
while [ $# -gt 0 ]; do
	echo "Текущий аргумент: $1"
	shift
done
