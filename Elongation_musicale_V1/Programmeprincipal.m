clear all

% 1 - Caractéristiques voulues

Tvoulu=240; % Temps de chanson voulu (secondes)
DT = 4; % Durée de la transition

% 2 - Ouverture de la segmentation des chansons pour un album

list = dir('\\data-pfe\pveillard2017\Projet élongation musicale\seglab\The Beatles\01_-_Please_Please_Me\*') % Sélection d'un album des Beatles 
j=0;
for i=1:length(list)
    [filepath,name,ext] = fileparts(list(i).name);
    if strcmp(ext,'.lab') % On ne sélectionne que les fichiers .lab
        j=j+1;
        filid=fopen(list(i).name);
        C = textscan(filid, '%f64%f64%s');
        s(j).song=list(i).name;  % s est une structure contenant le nom de la chanson, la durée de chaque segment et son attribut pour chaque chanson de l'album
        s(j).deb=C{1,1};
        s(j).fin=C{1,2};
        s(j).seg=C{1,3};
    end
end

% 3 - Ouverture de la chanson dont l'on veut modifier la durée

[Fn,Pn] = uigetfile('\\data-pfe\pveillard2017\Projet élongation musicale\seglab\The Beatles\01_-_Please_Please_Me\*.mp3');
FichierListe=[Pn Fn];
[y,Fe] = audioread(FichierListe);
T=length(y)/Fe;

Indicechanson=14; %Indice de cette chanson dans l'album (et donc dans s)
Tchanson=s(Indicechanson).fin(end);

% 4 - Calcul de la durée d'un 'verse' et d'un 'bridge'

[Indicepremierverse , Indicepremierbridge , Tbridge, Tverse] = dureebridgeverse(Indicechanson , s);

% 5 - Optimisation de la composition musicale pour se rapprocher du temps voulu en ajoutant verse et bridge
      % On trouve le nombre de bridge et le nombre de verse à rajouter pour
      % se rapprocher du temps voulu

[Nombrebridgeopti , Nombreverseopti , Differenceminimale] = composition(Tchanson , Tverse , Tbridge , Tvoulu);

% 6 - Recollement pour obtenir la chanson modifiée
      % On recolle en alternant entre bridge et verse au maximum


[tempsdeb , tempsfin] = recollement(Indicechanson , s , Nombrebridgeopti , Nombreverseopti , Indicepremierbridge , Indicepremierverse);

% 7 - On enleve l'intro: durée inférieure à la durée de transition = problème
tab=[tempsdeb(2:end) , tempsfin(2:end)];  % Tableau des transitions du morceau final

% 8 - Assemblage !
sTrig = AssemblageTotalTrig(y, tab, DT, Fe);
sTriangle = AssemblageTotal(y, tab, DT, Fe);

% 9 - Enregistrement du son
audiowrite('parfaittrig.wav',sTrig,Fe); % Clipping apparait ici
audiowrite('parfaittriangle.wav',sTriangle,Fe);

% 10 - Moments des transitions (vérifier à l'écoute)
transitions = cumsum(tab(:, 2) - tab(:, 1));
