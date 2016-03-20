//
//  main.cpp
//  SortMethodTest
//
//  Created by 王林 on 16/3/17.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#include <iostream>
#include <stdio.h>

using namespace std;

//print function
void printArray(int array[], int number){
    if (array == NULL || number <= 0) {
        cout << "数据有误!" << endl;
        return;
    }

    for (int i = 0; i < number; i++) {
        cout << array[i] << " ";
    }
    cout << endl;
}

//swap function
void swapTwoNumber(int &number1, int &number2){
    int temp = number1;
    number1 = number2;
    number2 = temp;
}


#pragma mark - 插入排序
//1.直接插入排序,Straight Insertion Sort
void StraightInsertionSort(int array[], int number, int dk){
    if (array == NULL || number < 0 || dk < 1) {
        return;
    }

    for (int i = dk; i < number; i++) {
        if (array[i] < array[i - dk]) {
            swapTwoNumber(array[i], array[i - dk]);
            int j = i - dk;
            while (j > 0 && array[j - dk] > array[j]) {
                swapTwoNumber(array[j - dk], array[j]);
                j -= dk;
            }
        }
    }
}

//2.shell排序, ShellSort
void ShellSort(int array[], int number){
    if (array == NULL || number < 0) {
        return;
    }
    int dk = number / 2;
    while(dk >= 1){
        StraightInsertionSort(array, number, dk);
        dk = dk/2;
    }
}

#pragma mark - 选择排序
//1.简单选择排序
static bool isInputCorrect = true;
int SelectMinNumber(int array[], int startIndex, int endIndex, int number){
    if (array == NULL || startIndex < 0 || endIndex < 0 || startIndex > endIndex || number < 0 || startIndex > number || endIndex > number) {
        isInputCorrect = false;
        return 0;
    }
    isInputCorrect = true;
    int minMumber = array[startIndex];
    if (startIndex == endIndex) {
        return minMumber;
    }

    for (int i = startIndex + 1; i < endIndex; i++) {
        if (array[i] < minMumber) {
            minMumber = array[i];
        }
    }
    return minMumber;
}

int SelectMinKey(int a[], int i, int n)
{
    int k = i;
    for(int j=i ;j< n; ++j) {
        if(a[k] > a[j])
            k = j;
    }
    return k;
}

void SimpleSelectSort(int array[], int number){
    if (array == NULL || number < 0) {
        return;
    }

    int minKey;
    for (int i = 0; i < number; i++) {
        minKey = SelectMinKey(array, i, number);
        if (minKey != i) {
            swapTwoNumber(array[i], array[minKey]);
        }
    }
}


#pragma mark - 交换排序
//1.冒泡排序, bubbleSort
void bubbleSort(int array[], int number){
    if (array == NULL || number < 0) {
        return;
    }

    for (int i = 0; i < number - 1; i++) {
        for (int j = 0; j < number - 1 - i; j++) {
            if (array[j] > array[j + 1]) {
                swapTwoNumber(array[j], array[j + 1]);
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    int a[10] = {2,18,3,9,8,120,23,5,90,14};
    printArray(a, 10);
    bubbleSort(a, 10);
    printArray(a, 10);
    return 0;
}
