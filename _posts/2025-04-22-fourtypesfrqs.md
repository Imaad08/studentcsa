---
title: Four Types of Frqs
comments: True
layout: post
type: ccc
---

## My Take on the Four Types of AP CSA FRQs

As I’ve been preparing for the AP Computer Science A exam, I’ve noticed that the free-response questions (FRQs) tend to follow the same four types every year. Getting a solid grasp on each type has helped me feel more confident going into practice exams. Here’s how I understand each one and what I’ve learned from working through them:

### 1. Methods and Control Structures

This type of FRQ is all about writing methods that use conditionals and loops. I usually see questions where I have to complete a method that uses an `if` statement, a `for` loop, or something similar. It’s really about thinking logically and understanding flow control.

**What I Focus On:**
- Making sure I understand what the method is supposed to return
- Getting the loop boundaries right
- Watching for off-by-one errors

**One I Practiced:**  
I had to write a method that counted how many times a specific number appeared in an array. It helped me get comfortable with loop syntax and conditions.

**What Helps:**  
I always double-check data types and loop conditions before moving on. That saves me from simple mistakes.

### 2. Class Design

Class design FRQs test how well I understand object-oriented programming. These questions usually ask me to write a full class with fields, constructors, and methods. It’s more about structure and design than complex logic.

**What I Focus On:**
- Using private variables and writing clean constructors
- Keeping methods simple and readable
- Remembering to include `get` and `set` methods if needed

**One I Practiced:**  
I had to create a `Book` class with a constructor and a method to compare two books. It reminded me how important it is to follow encapsulation rules.

**What Helps:**  
I always start by writing down what instance variables the class needs before I touch the code.

### 3. Arrays and ArrayLists

This type of FRQ deals with manipulating arrays or `ArrayList`s. These are usually the ones where I have to remove elements, count specific values, or reorganize the data. They really test whether I can think through how to loop and update a list safely.

**What I Focus On:**
- Choosing the right type of loop for the job
- Being careful not to skip elements when removing from a list
- Writing test cases in my head as I code

**One I Practiced:**  
I wrote a method that removed all strings with fewer than five characters from an `ArrayList<String>`. It helped me understand how to safely modify lists while looping.

**What Helps:**  
If I need to remove things while looping, I either use an iterator or loop from the end to avoid messing up the index order.

### 4. 2D Arrays

2D array FRQs are all about navigating grids with nested loops. These questions feel a bit more visual to me—I have to picture a table or grid in my head and figure out how to move through it correctly.

**What I Focus On:**
- Writing neat nested loops that go through rows and columns properly
- Making sure I don’t mix up my row and column indices
- Understanding what each question wants me to find or count

**One I Practiced:**  
I wrote a method that counted how many zeros were in a 2D array. Drawing the grid out helped a lot.

**What Helps:**  
Whenever I get stuck, I sketch a mini grid on paper to keep track of what’s happening. It makes nested loops way easier to handle.

### Final Thoughts

Each FRQ type targets a different skill, but they’re all connected. Practicing them over time has made the patterns feel more natural, and I’ve learned how to write clearer, more efficient code. I’ve also realized that formatting, spacing, and clean logic really do matter—not just for readability but for scoring points too.

I still make mistakes sometimes, but understanding the structure of each FRQ has made a huge difference. Now, when I see a new question, I can usually tell which type it is and how to start. That’s been a game-changer in how I approach the AP CSA exam.
