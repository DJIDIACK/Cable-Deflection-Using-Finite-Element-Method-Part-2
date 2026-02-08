%Opération menant au calcul de la valeur absolue de l'erreur élémentaire
function  y = ErrElem(X, P, U, yEx, i)
 syms x
 m=(U(i+1)-U(i))/(X(P(i,2))-X(P(i,1)));
 b=U(i)-m.*X(P(i,1));
 
 yEf = m.*x+b ;

y = abs(yEx - yEf);
end