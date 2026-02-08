%%Opération menant au calcul du vecteur constituant les erreurs
%%élémentaires
function  Err = ErrTotal(X, P, U, yEx, N)

    Err =sym(zeros(1,N));
for i=1:N-1
    Err(i) = ErrElem(X, P, U, yEx, i); %Vecteur constituant chaque erreur élémentaire de l'élément Ei
end
end