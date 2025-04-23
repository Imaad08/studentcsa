---
title: Study Review
comments: True
layout: post
type: ccc
---

# Review

## Frq Q1

### A
```java
public static int hailstoneLength(int n) {
    int count = 1;
    while (n > 1) {
        if (n % 2 == 0) {
            n = n / 2;
        } else {
            n = 3 * n + 1;
        }
        count++;
    }
    return count;
}
```
### B
```java
public static boolean isLongSeq(int n) {
    return hailstoneLength(n) > n;
}
```
### C
```java
public static double propLong(int n) {
    int count = 0;
    for (int i = 1; i <= n; i++) {
        if (isLongSeq(i)) {
            count++;
        }
    }
    return (double) count / n;
}
```
## Frq Q2

```java
public class GameSpinner {
    private int sectors;
    private int previousSpin = 0;
    private int currentLength = 0;

    public GameSpinner(int s) {
        sectors = s;
    }

    public int spin() {
        int newSpin = (int)(Math.random() * sectors) + 1;
        
        if (newSpin == previousSpin) {
            currentLength++;
        } else {
            previousSpin = newSpin;
            currentLength = 1;
        }
        return newSpin;
    }

    public int currentRun() {
        return currentLength;
    }
}
```

## Frq Q3

### A
```java
public void addReview(ProductReview prodReview) {
    reviewList.add(prodReview);

    String prodName = prodReview.getName();
    boolean found = false;
    
    for (String n : productList) {
        if (n.equals(prodName)) {
            found = true;
        }
    }

    if (!found) {
        productList.add(prodName);
    }
}
```

### B
```java
public int getNumGoodReviews(String prodName) {
    int numGoodReviews = 0;

    for (ProductReview prodReview : reviewList) {
        if (prodName.equals(prodReview.getName())) {
            String review = prodReview.getReview();
            if (review.indexOf("best") >= 0) {
                numGoodReviews++;
            }
        }
    }

    return numGoodReviews;
}
```

## Frq Q4

### A
```java
public Theater(int seatsPerRow, int tier1Rows, int tier2Rows) {
    theaterSeats = new Seat[tier1Rows + tier2Rows][seatsPerRow];
    
    for (int r = 0; r < tier1Rows + tier2Rows; r++) {
        for (int c = 0; c < seatsPerRow; c++) {
            if (r < tier1Rows) {
                theaterSeats[r][c] = new Seat(true, 1);
            } else {
                theaterSeats[r][c] = new Seat(true, 2);
            }
        }
    }
}
```

### B
```java
public boolean reassignSeat(int fromRow, int fromCol, int toRow, int toCol) {
    Seat toS = theaterSeats[toRow][toCol];
    if (!toS.isAvailable()) {
        return false;
    }

    Seat fromS = theaterSeats[fromRow][fromCol];
    if (toS.getTier() < fromS.getTier()) {
        return false;
    }

    toS.setAvailability(false);
    fromS.setAvailability(true);
    return true;
}
```
---

# Self-Assessment

## FRQ 1: Methods and Control Structures

### Part A: `hailstoneLength(int n)`
- **Score:** 3/3
- **Reflection:**I correctly implemented the hailstone sequence logic, using appropriate control structures and conditions

### Part B: `isLongSeq(int n)`
- **Score:** 2/2
- **Reflection:** The method accurately determines if the hailstone sequence length exceeds the starting value

### Part C: `propLong(int n)`
- **Score:** 3/3
- **Reflection:** The method calculates the proportion of numbers with long sequences correctly, using a loop and type casting

**Total Score:** 9/9

---

## FRQ 2: Class Design – `GameSpinner`

- **Score:** 8/9
- **Reflection:** The class design is solid, with proper encapsulation and logic for spinning and tracking runs. However, I initialized `previousSpin` to 0, which might not align with the intended behavior if 0 is not a valid spin result

---

## FRQ 3: Array/ArrayList – `ReviewAnalysis`

### Part A: `addReview(ProductReview prodReview)`
- **Score:** 4/4
- **Reflection:** The method adds reviews and updates the product list appropriately, checking for duplicates effectively

### Part B: `getNumGoodReviews(String prodName)`
- **Score:** 3/4
- **Reflection:** The method counts reviews containing "best" correctly. However, it might not account for case sensitivity or variations like "Best" or "BEST" 

**Total Score:** 7/8

---

## FRQ 4: 2D Array – `Theater`

### Part A: Constructor
- **Score:** 4/4
- **Reflection:** The constructor initializes the 2D array with the correct dimensions and assigns tiers properly based on row indices

### Part B: `reassignSeat(int fromRow, int fromCol, int toRow, int toCol)`
- **Score:** 4/5
- **Reflection:**The method reassigns seats correctly, checking for availability and tier constraints. However, it lacks validation for index bounds, which could lead to runtime errors if invalid indices are provided

**Total Score:** 8/9

---

## Overall Reflection
I feel confident about my solutions, especially in implementing control structures and class design. The minor issues identified, such as initialization values and input validation, are areas I can focus on to improve robustness. Paying closer attention to edge cases and input constraints will enhance the reliability of my code in future implementations

--- 


<script src="https://utteranc.es/client.js"
        repo="{{ site.github_username }}/{{ site.github_repo | default: site.baseurl | remove: "/" }}"
        issue-term="title"
        label="blogpost-comment"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>