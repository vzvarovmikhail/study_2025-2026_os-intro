#!/bin/bash


usage() {
    echo "Использование: $0 <директория>"
    echo "Архивирует все файлы в директории, изменённые менее 7 дней назад"
    exit 0
}

if [ $# -ne 1 ]; then
    usage
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: $DIR не является директорией"
    exit 1
fi

ARCHIVE_NAME="archive_$(date +%Y%m%d_%H%M%S).tar.gz"

echo "Поиск файлов, изменённых менее 7 дней назад в $DIR..."

find "$DIR" -type f -mtime -7 -print0 | tar -czf "$ARCHIVE_NAME" --null -T -

echo "Архив создан: $ARCHIVE_NAME"
echo "Содержимое архива:"
tar -tzf "$ARCHIVE_NAME" | head -10
