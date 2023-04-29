clear;clc;
syms lambda
a=[1,2;1,4;2,2];
[U,S,V] = svd(a);
iden = eye(2,2);
det = det(a'*a-lambda*iden);
eqn = lambda^2 - 30*lambda + 44 == 0;
solve(eqn,lambda)
