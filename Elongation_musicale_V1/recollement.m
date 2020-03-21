function [tempsdeb , tempsfin] = recollement(Indicechanson , s , Nombrebridgeopti , Nombreverseopti , Indicepremierbridge , Indicepremierverse )

% On recolle en alternant entre bridge et verse au maximum
% Cette fonction renvoie deux vecteurs : les temps de début et de fin dans la chanson
% initiale des segments 

if Nombrebridgeopti<Nombreverseopti % On commence à rajouter le segment dont le nombre à ajouter est le plus petit
    k=Indicepremierbridge;
    ajout='verse';
else
    k=Indicepremierverse;
    ajout='bridge';
end

tempsdeb=s(Indicechanson).deb(1:k); % vecteur des temps de débuts de chaque partie de la chanson modifiée
tempsfin=s(Indicechanson).fin(1:k); % vecteur des temps de fin de chaque partie de la chanson modifiée

r=1;
while r<=min(Nombrebridgeopti,Nombreverseopti)+1 % On alterne entre bridge et verse 
    if strcmp(ajout,'bridge')
        tempsdeb=[tempsdeb;s(Indicechanson).deb(Indicepremierbridge)];
        tempsfin=[tempsfin;s(Indicechanson).fin(Indicepremierbridge)];
        ajout='verse';
    else
        tempsdeb=[tempsdeb;s(Indicechanson).deb(Indicepremierverse)];
        tempsfin=[tempsfin;s(Indicechanson).fin(Indicepremierverse)];
        ajout='bridge';
    end
    r=r+1;
end

if Nombrebridgeopti>r % On ajoute plusieurs fois le segment restant 
    for m=1:(Nombrebridgeopti-r)
        tempsdeb=[tempsdeb;s(Indicechanson).deb(Indicepremierbridge)];
        tempsfin=[tempsfin;s(Indicechanson).fin(Indicepremierbridge)];
    end
end

if Nombreverseopti>r
    for m=1:(Nombreverseopti-r)
        tempsdeb=[tempsdeb;s(Indicechanson).deb(Indicepremierverse)];
        tempsfin=[tempsfin;s(Indicechanson).fin(Indicepremierverse)];
    end
end

tempsdeb=[tempsdeb;s(Indicechanson).deb(k+1:end)];
tempsfin=[tempsfin;s(Indicechanson).fin(k+1:end)];

end