%Opération menant au calcul de l'erreur sur le gradient sur le champ de la
%solution par Intégration de Gauss
function Errg=Erreurg_Gauss(N,w,X,T,P,npts)

[U] = Cal_Sol_Gauss(w,X,T,P,npts);

gradient=zeros(N,1);
for i=1:N
gradient(i)=(U(i)-U(i+1))/(X(P(i,1))-X(P(i,2))); % gradient du champ solution
end

gradient_m=zeros(N+1,1);
gradient_m(1)=gradient(1);
gradient_m(N+1)=gradient(N);
for i=2:N
gradient_m(i)=(gradient(i-1)+gradient(i))/2; % gradient moyen sur le noeud i
end

Delta_gm=zeros(N+1,1);
Delta_gm(1)=gradient(1)-gradient_m(1);
Delta_gm(N+1)=gradient(N)-gradient_m(N+1);
for i=2:N
Delta_gm(i)=max(gradient(i-1)-gradient_m(i),gradient(i)-gradient_m(i)); %Ecart maximal du gradient de l'élément et le gradient moye
end

Errg=zeros(N+1,1);
for i=1:N+1
    Errg(i)=abs(Delta_gm(i)/gradient_m(i)); %Erreur sur le gradient
end