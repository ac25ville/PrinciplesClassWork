-- Due: Wednesday, October 17, by 11:59pm.

-- Furthermore, everyone should adhere to the following guidelines to get full credit:

-- * Your submission must successfully load in Haskell Platform to
-- get any points. For example, executing:
--      $ ghci HW3_yourpawprint.hs
--    or
--      copy pasting the code to https://replit.com/languages/haskell
-- should not produce any errors. 

-- * Name all functions exactly as they appear in the
-- assignment. Grading will be partly automated, so incorrectly named functions are
-- likely to be counted as undefined functions.

-- * No late submissions---PLEASE START EARLY!

-- For each of the following questions, put your answer directly below the
-- question.

-- Plagiarism is prohibited, and any plagiarism will affect your overall grade as 0.


-- -- -- ---- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- ---- -- -- -- -- -- -- -- -- --  QUESTIONS  -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- ---- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 20 points  
-- 1. Given two lists of integers a and b sorted in ascending order, merge them into one large sorted list. 
-- Do not use built in fuctions.
-- Example
-- Input: [1,5,6] [-1,3,8]
-- Output: [-1,1,3,5,6,8]

-- mergesorted a b =
mergesorted a [] = a
mergesorted [] b = b
mergesorted (a:as) (b:bs) | a <= b = a:mergesorted as (b:bs) 
                          | otherwise = b:mergesorted (a:as) bs

-- tested on replit
-- main = print(mergesorted [1,5,6] [-1,3,8])
-- [-1,1,3,5,6,8]
-----------------------------------------------------

-- 20 points  
-- 2. Given a value and a list of numbers, return another list that contains all the values from
-- given list that are less than the value specified.
-- Example:
-- Input:  5 [1,-7,40,1,30]
-- Output: [1,-7,1]

-- filterList value list =
filterList value [] = []
filterList value (l:ls) | l < value = l:filterList value ls
                        | otherwise = filterList value ls


-- tested on replit
-- main = print(filterList 5 [1,-7,40,1,30])
-- [1,-7,1]
-----------------------------------------------------

-- 20 points  
-- 3. Given a list of integers, return a list of squared values. Use one of higher order functions.
-- Input: [1,2,3,4]
-- Output: [1,4,9,16]

listOfSquares [] = []
listOfSquares (n:ns) = n * n:listOfSquares ns

-- tested on replit
-- main = print(listOfSquares [1,2,3,4])
-- [1,4,9,16]
-----------------------------------------------------

-- 20 points
-- 4. Given a list, return the value of the middle element. If there are two middle elements, 
-- then return the second one.
-- Input: [1,2,3,4]
-- Output: 3
-- Input: [1,2,3]
-- Output: 2
-- Input: [1]
-- Output: 1

-- middleElement list =
middleElement [l] = l
middleElement list = middleElement(reverse(tail(list)))

-- tested odd length on replit
-- main = print(middleElement [1,2,3])
-- 2
-----------------------------------------------------
-- tested even length on replit
-- main = print(middleElement [1,2,3,4])
-- 3
-----------------------------------------------------

-- 20 points
-- 5. Given a list and a number n, remove all the occurences of n in the list. 
-- Input: 2 [1,2,3,4,2,5,2]
-- Output: [1,3,4,5]

-- removeElem n list = 
removeElem n [] = []
removeElem n (l:ls) | l == n = removeElem n ls
                    | otherwise = l:removeElem n ls

-- tested on replit
-- main = print(removeElem 2 [1,2,3,4,2,5,2])
-- [1,3,4,5]