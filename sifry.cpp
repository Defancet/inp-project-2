#include <stdlib.h>
#include <stdio.h>

int plus_(int diff) {
    return 96 + (diff - 122);
}

int minus_(int diff) {
    return 122 - (96 - diff);
}

void print_array(size_t s, unsigned char *array) {
    for (size_t i = 0; i < s - 3; i++) printf("%c", array[i]);
    printf("\n");
}

int main() {
    unsigned char array[] = "xkalut00";
    unsigned char plus = array[1] - 96, minus = array[2] - 96;

    for (size_t i = 0; i < sizeof(array) - 1; i++) {
        if (!(i % 2)) {
            array[i] = array[i] + plus;
            if (array[i] > 122) array[i] = plus_(array[i]);
        } else {
            array[i] = array[i] - minus;
            if (array[i] < 97) array[i] = minus_(array[i]);
        }
    }
    print_array(sizeof(array), array);
    return 1;
}
