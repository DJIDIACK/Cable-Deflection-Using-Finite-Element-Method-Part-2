function x = x_u(u,X,P,i)
%calcule de x en fonction de u telle que :
%   
%   x = <N1 N2>{X(1) X(2)}
%
%   x = N1*X(1)+N2*X(2);              
%         
x = N1(u)*X(P(i,1))+N2(u)*X(P(i,2));
end