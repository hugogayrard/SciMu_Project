function [Nombrebridgeopti , Nombreverseopti , Differenceminimale] = composition(Tchanson , Tverse , Tbridge , Tvoulu)

% On trouve le nombre de bridge et le nombre de verse � rajouter pour
% se rapprocher du temps voulu

Nombreversemax=round(Tchanson/Tverse); % Nombre maximal de 'verse' � ne pas d�passer
Nombrebridgemax=round(Tchanson/Tbridge); % Nombre maximal de 'bridge' � ne pas d�passer

Differenceminimale=Tvoulu-Tchanson;
for Nombreverse=0:Nombreversemax
    for Nombrebridge=0:Nombrebridgemax
        Difference=Tvoulu-Tchanson-(Nombreverse*Tverse+Nombrebridge*Tbridge);
        if and(Difference<Differenceminimale,Difference>=0)
            Differenceminimale=Difference;  % Difference de temps entre le temps voulu et le temps effectif
            Nombreverseopti=Nombreverse;
            Nombrebridgeopti=Nombrebridge;
        end
    end
end
end