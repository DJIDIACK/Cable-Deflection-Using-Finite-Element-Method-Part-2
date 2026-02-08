function uu = u_x(x,X,P,i)
%calcule de u en fonction de x telle que :
%
%   On a x(u) = N1*X(1)+N2*X(2); 
%   Avec  p(u) =finverse(y, u) Inversion de la variable u en x
%   D'où u(x) = p(x)
%      
syms u 
y = N1(u)*X(P(i,1))+N2(u)*X(P(i,2));
p(u) =finverse(y, u);
uu=p(x);
end