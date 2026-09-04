#!/bin/bash

ALPHABET="abcdefghijklmnopqrstuvwxyz"
ALPHABET_UPPER="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

random_letter() {
    local idx=$((RANDOM % 26))
    echo -n "${ALPHABET:$idx:1}"
}

random_letter_upper() {
    local idx=$((RANDOM % 26))
    echo -n "${ALPHABET_UPPER:$idx:1}"
}

LENGTH=${1:-20}
USE_UPPER=${2:-0}

echo "Генерация случайной последовательности длиной $LENGTH..."

if [ "$USE_UPPER" -eq 1 ]; then
    for i in $(seq 1 $LENGTH); do
        random_letter_upper
    done
else
    for i in $(seq 1 $LENGTH); do
        random_letter
    done
fi

echo ""

echo ""
echo "=== Разные варианты ==="

echo -n "Строчные: "
for i in $(seq 1 15); do
    random_letter
done
echo ""

echo -n "Заглавные: "
for i in $(seq 1 15); do
    random_letter_upper
done
echo ""

echo -n "Смешанные: "
for i in $(seq 1 20); do
    if [ $((RANDOM % 2)) -eq 0 ]; then
        random_letter
    else
        random_letter_upper
    fi
done
echo ""

