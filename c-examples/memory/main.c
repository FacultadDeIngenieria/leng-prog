#include <stdio.h>
#include <stdlib.h>

typedef struct { int id; int qty; } item_t;

item_t item0 = { 1, 1 };

void printItem(const char* name, const item_t* item) {
    printf("Item '%s' value: %d, %d, address: %p\n", name, item->id, item->qty, item);
}

int main() {
    // a goes into the stack
    int a = 10;
    printf("address of a: %p\n", &a);

    // item goes into the stack
    item_t item1 = { 2, 10 };


    // item2 goes into the stack
    // But the pointed to Item goes into the heap

    item_t* item2 = malloc(sizeof(item_t));
    item2->id = 3;
    item2->qty = 20;

    // item3 points to the same memory that item2
    item_t* item3 = item2;

    item1.qty += 1;
    item1.qty += 1;
    item2->qty += 1;
    item3->qty += 1;

    // print again

    printItem("item0", &item1);
    printItem("item1", &item1);
    printItem("item2", item2);
    printItem("item3", item3);
    printf("\n");

    // I need to free the memory allocated from the heap !!!
    free(item2);

    printItem("item3", item3);
    printf("\n");

    item_t* item4 = malloc(sizeof(item_t));

    item4->id = 3;
    item4->qty = 20;
    printItem("item2", item2);
    printItem("item3", item3);
    printItem("item4", item4);

    free(item4);
}
