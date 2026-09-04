#!/bin/bash

usage() {
    echo "Использование: $0 [опции]"
    echo "  -c <N>    создать N файлов (1.tmp, 2.tmp, ...)"
    echo "  -d        удалить все созданные файлы"
    echo "  -h        показать эту справку"
    exit 0
}

create_files() {
    local n=$1
    echo "Создание $n файлов..."
    for i in $(seq 1 $n); do
        touch "$i.tmp"
        echo "Создан файл $i.tmp"
    done
    echo "Создано $n файлов"
}

delete_files() {
    echo "Удаление файлов..."
    for i in $(seq 1 100); do
        if [ -f "$i.tmp" ]; then
            rm "$i.tmp"
            echo "Удалён файл $i.tmp"
        fi
    done
    echo "Удаление завершено"
}

if [ $# -eq 0 ]; then
    usage
fi

case "$1" in
    -c)
        if [ -z "$2" ] || [ "$2" -le 0 ]; then
            echo "Ошибка: укажите положительное число"
            usage
        fi
        create_files "$2"
        ;;
    -d)
        delete_files
        ;;
    -h|--help)
        usage
        ;;
    *)
        echo "Неизвестная опция: $1"
        usage
        ;;
esac
