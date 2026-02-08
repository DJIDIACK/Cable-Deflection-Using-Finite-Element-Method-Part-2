%Opération menant à la requête de Gauss
function matIntg = requeteGauss(npts)

matIntg=zeros(npts,2);
if npts==1
    matIntg(1,1)=0;
    matIntg(1,2)=2;
elseif npts==2
    matIntg(1,1)=-0.57735026918963;
    matIntg(1,2)=1;
    matIntg(2,1)= 0.57735026918963;
    matIntg(2,2)=1;
elseif npts==3
    matIntg(1,1)=-0.77459666924148;
    matIntg(1,2)= 0.55555555555556;
    matIntg(2,1)= 0;
    matIntg(2,2)= 0.88888888888888;
    matIntg(3,1)= 0.77459666924148;
    matIntg(3,2)= 0.55555555555556;
else
quit cancel;
disp('Erreur : Entrer un nombre valide');
end
end
            