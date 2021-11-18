% Q1:- Factorial of a number
% Factoral rules
% If input is 0, then factoral is 1
factorial(0,1). 
factorial(X,R) :-  
    % num must be greater than 0
   	X > 0, 
    % n - 1
    % multiply N in decreasing order
   	X1 is X-1, 
   	factorial(X1,R1),
    % multiply new R
   	R is X * R1.

/** <examples>
?- fact(8,R) ;
?- fact(0,R) .
*/

% Q2:- Check if an element X is occurring N times in a list L
% Occurrence rules
% If empty string
occurrence_check(_, [], 0) .
% If num is different than H, recursively call occurrence
occurrence_check(Num, [H|T], X) :- 
    dif(Num,H), 
    occurrence_check(Num, T, X) .
% Increment occurrence of num if equal to h and call occurence again
occurrence_check(Num, [H|T], X) :- 
    Num = H, 
    occurrence_check(Num, T, X1), 
    X is X1 + 1 .

/** <examples>
?- occurrence_check(z, [a,b,c,a,a,w,a,f,r,e], 0).
*/

% Q3:- Eliminate consecutive duplicates of list elements.
% Compress rules & description
% compress(L1,L2) :- the list L2 is obtained from the list L1 by
%    compressing repeated occurrences of elements into a single copy
%    of the element.
%    (list,list) (+,?)
% If empty list
compress([],[]).
% If single element
compress([X],[X]).
% Move through list, If member already Exists in new list then do not add to the new list, otherwise add
compress([X,X|Xs],Zs) :- compress([X|Xs],Zs).
compress([X,Y|Ys],[X|Zs]) :- X \= Y, compress([Y|Ys],Zs).

/** <examples>
?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
*/

% Q4-A:- Reverse a list w/o accumulator.
% Reverse w/o accumulator rules

rev_NA([],[]).
rev_NA([X|Xs], R) :- rev_NA(Xs, RevXs), append(RevXs, [X], R).

/** <examples>
?- No examples exist as this function does not work.
*/

% Q4-B:- Reverse a list w/ accumulator.
% Reverse w/ accumulator rules and description
% my_reverse(L1) :- L1 is reversed
%    (list) X=(-list)

my_reverse(L1) :- my_rev(L1,[]).

my_rev([],L2) :- print(L2).
my_rev([X|Xs],Acc) :- my_rev(Xs,[X|Acc]).

/** <examples>
?- my_reverse([a,b,c,d]).
*/

% Q4-C:- Find out whether a list is a palindrome
% Palindrome check rules
% palindrome(L) :- L is a palindrome list
%    (list) (?)

palindrome(L) :- reverse(L,L).

/** <examples>
?- palindrome([a,b,a]).
*/

% Q5:- Establish family tree

% Facts

male(zidane).
male(figo).
male(salah).
male(ronaldo).
male(donic).

female(abby).
female(mia).
female(rose).
female(serena).
female(julie).

parent(rose, doncic).
parent(salah, doncic).
parent(ronaldo, julie).
parent(serena, julie).
parent(figo, serena).
parent(mia, serena).
parent(zidane, salah).
parent(zidane, ronaldo).
parent(abby, salah).
parent(abby, ronaldo).

% Rules
% father,child
father(X, Y) :- parent(X,Y), male(X).
% mother,child
mother(X, Y) :- parent(X,Y), female(X).
% grandfather,grandchild
grandfather(X,Y) :- male(X), father(X,Z), parent(Z,Y). 
% grandmother,grandchild
grandmother(X,Y) :- female(X), mother(X,Z), parent(Z,Y).
% brother, sibling
brother(X,Y) :- 
    male(X), 
    mother(M,X), 
    mother(M,Y),
    father(F,X),
    father(F,Y).
% sister, sibling
sister(X,Y) :-
    female(X), 
    mother(M,X), 
    mother(M,Y),
    father(F,X),
    father(F,Y).
    
/** <examples>
?- father(zidane, ronaldo),
   mother(mia, serena),
   grandfather(figo, julie),
   grandmother(abby, julie),
   brother(salah, ronaldo).
   There are no examples of sister in the given tree.
*/