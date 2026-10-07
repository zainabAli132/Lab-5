% ==========================================
% FACTS
% ==========================================

% Male Facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Female Facts
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent Facts
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% Brother Facts
brother(herb, homer).
brother(homer, herb).
brother(bart, lisa).
brother(bart, maggie).

% Sister Facts
sister(marge, patty).
sister(patty, marge).
sister(marge, selma).
sister(selma, marge).
sister(patty, selma).
sister(selma, patty).
sister(lisa, bart).
sister(maggie, bart).
sister(lisa, maggie).
sister(maggie, lisa).


% ==========================================
% RULES
% ==========================================

% Father Rule
father(X, Y) :- 
    parent(X, Y), 
    male(X).

% Mother Rule
mother(X, Y) :- 
    parent(X, Y), 
    female(X).

% Son Rule
son(X, Y) :- 
    parent(Y, X), 
    male(X).

% Daughter Rule
daughter(X, Y) :- 
    parent(Y, X), 
    female(X).

% Grandfather Rule
grandfather(X, Z) :- 
    parent(X, Y), 
    parent(Y, Z), 
    male(X).

% Aunt Rule
aunt(X, Y) :- 
    parent(Z, Y), 
    sister(X, Z).

% Uncle Rule
uncle(X, Y) :- 
    parent(Z, Y), 
    brother(X, Z).

% Cousin Rule
cousin(X, Z) :- 
    grandfather(Y, X), 
    grandfather(Y, Z), 
    X \= Z.

% Ancestor Rules
ancestor(X, Y) :- 
    parent(X, Y).

ancestor(X, Y) :- 
    parent(X, Z), 
    ancestor(Z, Y).
