function [ elemFi ] = Vect_elem_Fe(w,X,P,i)
%calcule le second membre élémentaire Fi dans l'élément Ei
%       par intégration exacte
%               Fi
%       |---------------|
%       -1              1
syms x
xi=[X(P(i,1));X(P(i,2))]; %coordonées de l'élément Ei
u = u_x(x,X,P,i); %Appelle de la fonction u(x)

C=int(N1(u)*w(x),xi(1),xi(2));
D=int(N2(u)*w(x),xi(1),xi(2));

elemFi = [C ; D]; % Vecteur de l'élément numéro Ei
end