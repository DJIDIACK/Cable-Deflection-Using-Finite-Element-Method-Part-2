%Opération menant à l'exportation des valeurs des réactions 
% aux appuis vers un tableau excel par Gauss et Intégration Excate pour 4
% éléments (A définir)
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
N=input('entrez le nombre d element : ');
h=L/N;
npts=[1 2 3];
%--------------------------------------------------------------------------
%Appelle de la fonction Maillage
%--------------------------------------------------------------------------
[X, P] = Maillage(L, N);
%--------------------------------------------------------------------------
%Appelle de la fonction Réaction par Gauss et Intégration Exacte comparé à
%la valeur exacte
%--------------------------------------------------------------------------
[R1] = double(Cal_React_Gauss(w,X,T,P,npts(1)));
[R2] = double(Cal_React_Gauss(w,X,T,P,npts(2))) ;
[R3] = double(Cal_React_Gauss(w,X,T,P,npts(3)));
[R4] = double(Cal_React(w,X,T,P));
[Re]=double(Val_React_Exact(w,L));
%--------------------------------------------------------------------------
%Exportation des valeurs des réactions aux appuis vers un tableau excel
%--------------------------------------------------------------------------
values = {'R1', R1(1), R2(1), R3(1) , R4(1), Re(1) ; 'R2', R1(2), R2(2), R3(2) , R4(2), Re(2)};
headers = {'Réactions', 'npts=1','npts=2','npts=3','Intég Exact', 'Val Exact'};
xlswrite('Réactions_Gauss.xlsx',[headers; values]);


