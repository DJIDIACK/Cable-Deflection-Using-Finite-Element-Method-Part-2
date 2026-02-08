%Opération menant au calcul de la valeur exacte des deux réactions aux
%appuis
function y=Val_React_Exact(w,L)
syms x
%
% Cette fonction fait le calcul de la solution exacte.
%
R0=(1/L)*int(w(x).*x,0,L);
RL=int(w(x),0,L)-R0;
y=[R0,RL];
end