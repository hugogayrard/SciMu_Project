function [Indicepremierverse , Indicepremierbridge , Tbridge, Tverse] = dureebridgeverse(Indicechanson,s)

% % Cette fonction renvoie l'indice du premier verse/bridge dans la chanson et leurs durée

k=1;
while or(strcmp(char(s(Indicechanson).seg(k)),'verse'),k==length(s(Indicechanson).seg))==0
    k=k+1;
end
Indicepremierverse=k; % Indice du premier verse dans la chanson
Tverse=s(Indicechanson).fin(k)-s(Indicechanson).fin(k-1); % Durée d'un 'verse'
k=1;
while or(strcmp(char(s(Indicechanson).seg(k)),'bridge'),k==length(s(Indicechanson).seg))==0
    k=k+1;
end
Indicepremierbridge=k; % Indice du premier bridge dans la chanson
Tbridge=s(Indicechanson).fin(k)-s(Indicechanson).fin(k-1); % Durée d'un 'bridge'
end