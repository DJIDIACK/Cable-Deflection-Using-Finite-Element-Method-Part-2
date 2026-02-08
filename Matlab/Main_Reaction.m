%Opération menant à l'exportation des valeurs des réactions 
% aux appuis vers un tableau excel par Intégration Excate 
% pour 2, 4, 8, 10, 20 et 100 éléments
%--------------------------------------------------------------------------
clear all, close all, clc
%--------------------------------------------------------------------------
%Exprimons la valeur explicite des variables
%--------------------------------------------------------------------------
w0=1; 
k=8; 
L=input('entrez la longeur du câble : ');
T=input('entrez la tension du câble : ');
syms x
w(x)=input('entrez le type de chargement : ');  %w0.*(1-k*x).*exp(-k*x);
%Définir le nombre d'élément du cable
N1=2;
N2=4;
N3=8;
N4=10;
N5=20;
N6=100;
%--------------------------------------------------------------------------
%Appelle de la fonction Maillage
%--------------------------------------------------------------------------
[X1, P1] = Maillage(L, N1); [X2, P2] = Maillage(L, N2); [X3, P3] = Maillage(L, N3);
[X4, P4] = Maillage(L, N4); [X5, P5] = Maillage(L, N5); [X6, P6] = Maillage(L, N6);
%--------------------------------------------------------------------------
%Appelle de la fonction Réaction par Intégration Exacte comparé à la valeur
%exacte
%------------------------------------------------------------------
[R1] = double(Cal_React(w,X1,T,P1));
[R2] = double(Cal_React(w,X2,T,P2)); 
[R3] = double(Cal_React(w,X3,T,P3));
[R4] = double(Cal_React(w,X4,T,P4)); 
[R5] = double(Cal_React(w,X5,T,P5)); 
[R6] = double(Cal_React(w,X6,T,P6));
[Re] = double(Val_React_Exact(w,L));
%--------------------------------------------------------------------------
%Exportation des valeurs des réactions aux appuis vers un tableau excel
%--------------------------------------------------------------------------
values = {'R1', R1(1), R2(1), R3(1) , R4(1), R5(1) , R6(1), Re(1) ; 'R2', R1(2), R2(2), R3(2) , R4(2), R5(2) , R6(2), Re(2)};
headers = {'Réactions', 'N=2','N=4','N=8','N=10', 'N=20', 'N=100','Val Exact'};
xlswrite('Réactions_EF.xlsx',[headers; values]);
