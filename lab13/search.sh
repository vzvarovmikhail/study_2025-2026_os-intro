#!/bin/bash

input_file=""
output_file=""
pattern=""
case_sensitive=""
show_numbers=""

usage() {
    echo "Использование: $0 [опции]"
    echo "  -i <файл>       входной файл"
    echo "  -o <файл>       выходной файл"
    echo "  -p <шаблон>     шаблон для поиска"
    echo "  -C              учитывать регистр (по умолчанию не учитывает)"
    echo "  -n              показывать номера строк"
    echo "  -h              показать эту справку"
    exit 0
}

while getopts "i:o:p:Cnh" opt; do
    case $opt in
        i) input_file="$OPTARG" ;;
        o) output_file="$OPTARG" ;;
        p) pattern="$OPTARG" ;;
        C) case_sensitive="-C" ;;
        n) show_numbers="-n" ;;
        h) usage ;;
        *) echo "Неизвестная опция: -$OPTARG"; usage ;;
    esac
done

if [ -z "$input_file" ] || [ -z "$pattern" ]; then
    echo "Ошибка: необходимо указать -i и -p"
    usage
fi

if [ ! -f "$input_file" ]; then
    echo "Ошибка: файл $input_file не найден"
    exit 1
fi

grep_cmd="grep"

if [ "$case_sensitive" = "-C" ]; then
    grep_cmd="$grep_cmd -C"
else
    grep_cmd="$grep_cmd -i"
fi

if [ "$show_numbers" = "-n" ]; then
    grep_cmd="$grep_cmd -n"
fi

echo "Поиск шаблона '$pattern' в файле $input_file..."
if [ -n "$output_file" ]; then
    $grep_cmd "$pattern" "$input_file" > "$output_file"
    echo "Результат записан в $output_file"
else
    $grep_cmd "$pattern" "$input_file"
fi
