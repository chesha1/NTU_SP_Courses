syms lambda
x1 = [0;0;0;0];
x2 = [0;0;1;1];
x3 = [0;0;1;2];
x4 = [1;1;1;1];
x5 = [2;2;2;4];
x6 = [1;2;4;4];
x7 = [1;2;1;2];
x8 = [2;3;3;3];
x9 = [4;4;4;4];
xbar = zeros(4,1);
for i=1:1:9
    xbar = xbar + eval('x' + string(i));
end
xbar = xbar ./ 9;
csum = zeros(4,4);
for i=1:1:9
    temp = eval('x' + string(i)) - xbar;
    csum = csum + temp * temp';
end
iden = eye(4,4);
c = csum ./ 8;
eqn = lambda^4 - (97*lambda^3)/12 + (2335*lambda^2)/288 - (543*lambda)/256 + 641/4608 == 0;
S = solve(eqn,lambda);
result = double(S);
[v,d] = eig(c);
v1 = v(:,1);v2 = v(:,2);v3 = v(:,3);v4 = v(:,4);
b=[1;1;0;0];
bnew=(b'*v2)*v2 + (b'*v3)*v3 + (b'*v4)*v4;
disp(bnew);