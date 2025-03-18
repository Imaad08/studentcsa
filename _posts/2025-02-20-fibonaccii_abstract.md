---
toc: False
layout: post
title: Abstract Fibonaccii Hack
description: A Fibonacci algorithm that runs using an abstract parent class.
courses: {'csa': {'week': 25}}
type: ccc
comments: true
image: /images/data_structures/fibonacci.png
---

![abstract]({{site.baseurl}}/images/data_structures/fibonacci.png)

## Introduction

This notebook uses Class definitions, ArrayLists, and Hash Maps.   My hypothosis is these data structures are probably the most widely used in the Java language.

### Popcorn Hacks

- Provide some reasons why you agree with my hypothesis?

- Provide some data structures that you think might rival my hypothesis?

- Categorize data structure mentioned, tested by college board tested, widely used, fast.



```Java
/*
 * Creator: Nighthawk Coding Society
 * Mini Lab Name: Fibonacci sequence, featuring a Stream Algorithm
 * 
*/

import java.util.ArrayList;  
import java.util.HashMap;
import java.util.stream.Stream;

/* Objective will require changing to abstract class with one or more abstract methods below */
abstract class Fibo {
    String name;  // name or title of method
    int size;  // nth sequence
    int hashID;  // counter for hashIDs in hash map
    ArrayList<Long> list;   // captures current Fibonacci sequence
    HashMap<Integer, Object> hash;  // captures each sequence leading to final result

    /*
     Zero parameter constructor uses Telescoping technique to allow setting of the required value nth
     @param: none
     */
    public Fibo() {
        this(8); // telescope to avoid code duplication, using default as 20
    }

    /*
     Construct the nth fibonacci number
     @param: nth number, the value is constrained to 92 because of overflow in a long
     */
    public Fibo(int nth) {
        this.size = nth;
        this.list = new ArrayList<>();
        this.hashID = 0;
        this.hash = new HashMap<>();
        //calculate fibonacci and time mvc
        this.calc();
    }

    /*
     This Method should be "abstract"
     Leave method as protected, as it is only authorized to extender of the class
     Make new class that extends and defines calc()
     Inside references within this class would change from this to super
     Repeat process using for, while, recursion
     */
    protected abstract void calc();

    /*
     Number is added to fibonacci sequence, current state of "list" is added to hash for hashID "num"
     */
    public void setData(long num) {
        list.add(num);
        hash.put(this.hashID++, list.clone());
    }

    /*
     Custom Getter to return last element in fibonacci sequence
     */
    public long getNth() {
        return list.get(this.size - 1);
    }

    /*
     Custom Getter to return last fibonacci sequence in HashMap
     */
    public Object getNthSeq(int i) {
        return hash.get(i);
    }

    /*
     Console/Terminal supported print method
     */
    public void print() {
        System.out.println("Calculation method = " + this.name);
        System.out.println("fibonacci Number " + this.size + " = " + this.getNth());
        System.out.println("fibonacci List = " + this.list);
        System.out.println("fibonacci Hashmap = " + this.hash);
        for (int i=0 ; i<this.size; i++ ) {
            System.out.println("fibonacci Sequence " + (i+1) + " = " + this.getNthSeq(i));
        }
    }
}
```


```Java

public class FiboFor extends Fibo {

    public FiboFor() {
        super();
    }

    public FiboFor(int nth) {
        super(nth);
    }

    @Override
    protected void calc() {
        super.name = "FiboFor extends Fibo";
        long limit = this.size;
        // for loops are likely the most common iteration structure, all the looping facts are in one line
        for (long[] f = new long[]{0, 1}; limit-- > 0; f = new long[]{f[1], f[0] + f[1]})
            this.setData(f[0]);
    }

    /*
    Tester class method.
     */
    static public void main(int... numbers) {
        for (int nth : numbers) {
            Fibo fib = new FiboFor(nth);
            fib.print();
            System.out.println();
        }
    }
}

FiboFor.main(2, 5, 8);

```

    Calculation method = FiboFor extends Fibo
    fibonacci Number 2 = 1
    fibonacci List = [0, 1]
    fibonacci Hashmap = {0=[0], 1=[0, 1]}
    fibonacci Sequence 1 = [0]
    fibonacci Sequence 2 = [0, 1]
    
    Calculation method = FiboFor extends Fibo
    fibonacci Number 5 = 3
    fibonacci List = [0, 1, 1, 2, 3]
    fibonacci Hashmap = {0=[0], 1=[0, 1], 2=[0, 1, 1], 3=[0, 1, 1, 2], 4=[0, 1, 1, 2, 3]}
    fibonacci Sequence 1 = [0]
    fibonacci Sequence 2 = [0, 1]
    fibonacci Sequence 3 = [0, 1, 1]
    fibonacci Sequence 4 = [0, 1, 1, 2]
    fibonacci Sequence 5 = [0, 1, 1, 2, 3]
    
    Calculation method = FiboFor extends Fibo
    fibonacci Number 8 = 13
    fibonacci List = [0, 1, 1, 2, 3, 5, 8, 13]
    fibonacci Hashmap = {0=[0], 1=[0, 1], 2=[0, 1, 1], 3=[0, 1, 1, 2], 4=[0, 1, 1, 2, 3], 5=[0, 1, 1, 2, 3, 5], 6=[0, 1, 1, 2, 3, 5, 8], 7=[0, 1, 1, 2, 3, 5, 8, 13]}
    fibonacci Sequence 1 = [0]
    fibonacci Sequence 2 = [0, 1]
    fibonacci Sequence 3 = [0, 1, 1]
    fibonacci Sequence 4 = [0, 1, 1, 2]
    fibonacci Sequence 5 = [0, 1, 1, 2, 3]
    fibonacci Sequence 6 = [0, 1, 1, 2, 3, 5]
    fibonacci Sequence 7 = [0, 1, 1, 2, 3, 5, 8]
    fibonacci Sequence 8 = [0, 1, 1, 2, 3, 5, 8, 13]
    



```Java
public class FiboStream extends Fibo {

    public FiboStream() {
        super();
    }

    public FiboStream(int nth) {
        super(nth);
    }

    @Override
    protected void calc() {
        super.name = "FiboStream extends Extends";

        // Initial element of stream: new long[]{0, 1}
        // Lambda expression calculate the next fibo based on the current: f -> new long[]{f[1], f[0] + f[1]}
        Stream.iterate(new long[]{0, 1}, f -> new long[]{f[1], f[0] + f[1]})
            .limit(super.size) // stream limit
            .forEach(f -> super.setData(f[0]) );  // set data in super class
    }

    /*
    Tester class method.
     */
    static public void main(int... numbers) {
        for (int nth : numbers) {
            Fibo fib = new FiboFor(nth);
            fib.print();
            System.out.println();
        }
    }
}

FiboStream.main(2, 5, 8);
```

    Calculation method = FiboFor extends Fibo
    fibonacci Number 2 = 1
    fibonacci List = [0, 1]
    fibonacci Hashmap = {0=[0], 1=[0, 1]}
    fibonacci Sequence 1 = [0]
    fibonacci Sequence 2 = [0, 1]
    
    Calculation method = FiboFor extends Fibo
    fibonacci Number 5 = 3
    fibonacci List = [0, 1, 1, 2, 3]
    fibonacci Hashmap = {0=[0], 1=[0, 1], 2=[0, 1, 1], 3=[0, 1, 1, 2], 4=[0, 1, 1, 2, 3]}
    fibonacci Sequence 1 = [0]
    fibonacci Sequence 2 = [0, 1]
    fibonacci Sequence 3 = [0, 1, 1]
    fibonacci Sequence 4 = [0, 1, 1, 2]
    fibonacci Sequence 5 = [0, 1, 1, 2, 3]
    
    Calculation method = FiboFor extends Fibo
    fibonacci Number 8 = 13
    fibonacci List = [0, 1, 1, 2, 3, 5, 8, 13]
    fibonacci Hashmap = {0=[0], 1=[0, 1], 2=[0, 1, 1], 3=[0, 1, 1, 2], 4=[0, 1, 1, 2, 3], 5=[0, 1, 1, 2, 3, 5], 6=[0, 1, 1, 2, 3, 5, 8], 7=[0, 1, 1, 2, 3, 5, 8, 13]}
    fibonacci Sequence 1 = [0]
    fibonacci Sequence 2 = [0, 1]
    fibonacci Sequence 3 = [0, 1, 1]
    fibonacci Sequence 4 = [0, 1, 1, 2]
    fibonacci Sequence 5 = [0, 1, 1, 2, 3]
    fibonacci Sequence 6 = [0, 1, 1, 2, 3, 5]
    fibonacci Sequence 7 = [0, 1, 1, 2, 3, 5, 8]
    fibonacci Sequence 8 = [0, 1, 1, 2, 3, 5, 8, 13]
    


## Popcorn Hacks
Objectives of these hacks are ...

1. Understand how to fullfill abstract class requirements using two additional algoritms.
2. Use inheritance style of programming to test speed of each algorithm.  To test the speed, a.) be aware that the first run is always the slowest b.) to time something, my recommendation is 12 runs on the timed element, through out highest and lowest time in calculations.
3. Be sure to make a tester and reporting methods.

.85 basis for text based comparison inside of Jupyter Notebook lesson
```java
import java.util.ArrayList;

abstract class Fibo {
    protected int size;         
    protected String name;      
    private ArrayList<Long> data;  
    
    public Fibo() {
        this(5);
    }
    
    public Fibo(int nth) {
        this.size = nth;
        this.data = new ArrayList<>();
        this.name = "FiboBase";
    }
    
    protected abstract void calc();
    
    public ArrayList<Long> getData() {
        return this.data;
    }
    
    protected void setData(long value) {
        this.data.add(value);
    }
    
    public void print() {
        this.calc();
        System.out.println(name + " | size: " + size + " => " + data);
    }
}

public class FiboWhile extends Fibo {

    public FiboWhile() {
        super();
    }

    public FiboWhile(int nth) {
        super(nth);
    }

    @Override
    protected void calc() {
        super.name = "FiboWhile extends Fibo";

        long a = 0, b = 1;
        int count = 0;

        while (count < super.size) {
            super.setData(a);
            long temp = a + b;
            a = b;
            b = temp;
            count++;
        }
    }

    public static void main(String[] args) {
        main(2, 5, 8)
    }

    public static void main(int... numbers) {
        for (int nth : numbers) {
            Fibo fib = new FiboWhile(nth);
            fib.print();
            System.out.println();
        }
    }
}

```

## Hacks
Assign in each Team to build a Thymeleaf UI for portfolio_2025 using this example https://thymeleaf.nighthawkcodingsociety.com/mvc/fibonacci as basis.  Encorporate into Algorithms menu.

Since there are three teams, one team can do Fibo, others Pali and Factorial.  Assign this to people that are struggling for contribution and presentation to checkpoints.

.90 basis for FE presentation in Thymmeleaf to BE call in Spring
