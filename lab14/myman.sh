#!/bin/bash

MAN_DIR="/usr/share/man/man1"

if [ $# -ne 1 ]; then
    echo "Использование: $0 <команда>"
    echo "Пример: $0 ls"
    exit 1
fi

CMD="$1"

if [ ! -d "$MAN_DIR" ]; then
    echo "Ошибка: каталог $MAN_DIR не найден"
    exit 1
fi

MAN_FILE=""
for ext in "" ".gz" ".bz2" ".xz"; do
    if [ -f "$MAN_DIR/${CMD}.1$ext" ]; then
        MAN_FILE="$MAN_DIR/${CMD}.1$ext"
        break
    fi
done

if [ -z "$MAN_FILE" ]; then
    echo "Справка для команды '$CMD' не найдена"
    echo "Проверьте: man $CMD"
    exit 1
fi

echo "=== Справка для команды '$CMD' ==="
echo "Источник: $MAN_FILE"
echo "----------------------------------------"

if command -v less &> /dev/null; then
    less "$MAN_FILE"
else
    case "$MAN_FILE" in
        *.gz) gunzip -c "$MAN_FILE" ;;
        *.bz2) bunzip2 -c "$MAN_FILE" ;;
        *.xz) unxz -c "$MAN_FILE" ;;
        *) cat "$MAN_FILE" ;;
    esac
fi
