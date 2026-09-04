#include <stdio.h>
#include <stdlib.h>

int main() {
    int num;
    printf("Введите число: ");
    scanf("%d", &num);

    if (num > 0) {
        printf("Число %d больше нуля\n", num);
        exit(1);
    } else if (num < 0) {
        printf("Число %d меньше нуля\n", num);
        exit(2);
    } else {
        printf("Число равно нулю\n");
        exit(0);
    }
}
