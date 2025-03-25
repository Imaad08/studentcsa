---
title: Sorting/Searching Algorithms - Sorting Homework
description: A homework on sorting algorithms for AP Computer Science students.
categories: ['Sorting/Searching Algorithms']
courses: {'csse': {'week': 20}, 'csp': {'week': 20}, 'csa': {'week': 20}}
permalink: /sortingTTG/sorting/hw/
comments: True
---

# HOMEWORK
- Choose one sorting algorithm (Bubble, Selection, Insertion, or Quick Sort)
<br><br>
- Create a small visualization or step-by-step explanation of how your chosen algorithm sorts the array: [42, 17, 29, 8, 35]
<br><br>
- Calculate how many comparisons and swaps your algorithm needs to sort this array
<br><br>
- **What is the best case and worst case time complexity of your chosen algorithm?**

# bubble sort


```Java
import java.util.Arrays;

public class BubbleSortExample {
    public static void main(String[] args) {
        int[] arr = {42, 17, 29, 8, 35};
        
        bubbleSort(arr);
        
        System.out.println("Sorted array: " + Arrays.toString(arr));
    }
    
    public static void bubbleSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            boolean swapped = false;
            for (int j = 0; j < n - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }
            if (!swapped) {
                break;
            }
        }
    }
}

```

<img width="492" alt="Image" src="https://github.com/user-attachments/assets/e230d18a-221b-45ed-bb93-3f5b88825e5c" />

<img width="384" alt="Image" src="https://github.com/user-attachments/assets/708940d7-a8f8-43cc-9f1f-7d75c8efc8c1" />


For the array [42, 17, 29, 8, 35], Bubble Sort does the following:

- Pass 1: 4 comparisons, 4 swaps

- Pass 2: 4 comparisons, 1 swap

- Pass 3: 4 comparisons, 1 swap

- Pass 4: 4 comparisons, 0 swaps

If we perform exactly 4 passes (the typical n-1 passes for an array of length 5):

- Total comparisons = 4 + 4 + 4 + 4 = 16

- Total swaps = 4 + 1 + 1 + 0 = 6

Worst Case Time Complexity: 
O(n^2)

- Occurs when the array is in reverse order or when every pass needs to do a swap.

Best Case Time Complexity: 
O(n)

- Occurs if the array is already sorted, because you only need one pass to confirm no swaps happen, and then the algorithm ends.
