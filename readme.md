
# Welcome to the Stalin Sort Repo :clipboard:

![poster](stalin-sort.jpeg)

## What is Stalin Sort? :question:

### Introduction

Stalin Sort is an efficient sorting algorithm, serving as a systematic method for placing the elements of a random access file or an array in order. Stalin Sort is also know as the best sorting algorithm of all times becasue of it's AMAZING capacity of always ordering an array with an O(n) performance.

### How it works?

It's simple, all you need to do is iterate through the array checking if its elements are in order, any element that itsn't in order you pull out, in another words, you send it to Gulag.

### Step-by-step example

1. (1 2 5 3 5 7) -> (**1** 2 5 3 5 7) Here the algorithm stores the first of element of the array
2. (**1** 2 5 3 5 7) -> (1 **2** 5 3 5 7) Now it will compare the stored element with the second one, if this is bigger than the stored, it replaces the stored element by this
3. (1 **2** 5 3 5 7) -> (1 2 **5** 3 5 7) Repeats step 2
4. (1 2 **5** 3 5 7) -> (1 2 **5** 5 7) Since 4th element is smaller then the 3rd one that is just eliminated
5. (1 2 **5** 5 7) -> (1 2 5 **5** 7) Equal elements are preserved
6. **(1 2 5 5 7)** Ordered array!

### Pseudocode implementation

Have in mind that this pseudocode is just an example, we strongly encourage you to code a different approach. 

```
FUNCTION stalinSort(A : list OF sortable items)
    n := length(A)
    bigger := 0
    B SET empty list

    FOR i := 0 TO n NOT inclusive DO
        IF A[i] >= bigger THEN
          bigger := A[i]
          B.push(A[i])
        END IF
    END FOR

    RETURN B
END FUNCTION
```

## Want to help? :raised_hands:

Please check the [CONTRIBUTING.md](./CONTRIBUTING.md)

### Give this Project a Star! :star:

## About

> Stalin sort began first as a Hacktoberfest 2018 repo

Hacktoberfest is a program organised by Digital Ocean and Github, where you can easily win a T-Shirt just by making 5 pull requests in the month of October to any open source projects on Github.
