clear all

% 1 - Caractéristiques voulues

Tvoulu=240; % Temps de chanson voulu (en secondes)
DT = 4; % Durée de la transition
Fe=44100; % Fréquence d'échantillonage

% 2 - Importation de la matrice de probabilités correspondant à l'artiste

load('matriceBeatles.mat', 'M')  % La matrice M est la matrice de probabilité de l'artiste
listseg = {'silence', 'intro', 'verse', 'bridge', 'break', 'refrain', 'outro'}; % Liste des segmentations de la matrice

% 3 - Ouverture de la segmentation de la chanson dont l'on souhaite modifier la longueur

album='01_-_Please_Please_Me'; % Album
chanson='02_-_Misery.lab'; % Chanson

C = textscan(fopen(strcat('C:\Users\Pierre\Desktop\COURS SCIENCE ET MUSIQUE\Projet élongation musicale\seglab\The_Beatles\',album,'\',chanson)), '%f64%f64%s');
listetemps=[0; C{1,2}(1:end)]; % Liste contenant le temps de passage entre chaque segment de la chanson
listesegments=C{1,3}; % Liste contenant les segments de la chanson (dans l'ordre)

for k=1:length(listesegments)
    listesegments(k)=listseg(rang(listseg,listesegments(k)));  % La liste des segments est modifiée pour remplacer par exemple 'brisgea' par 'bridge'
%     listetemps(k)=listetemps(k+1)-listetemps(k);
    plotsegments(k)=rang(listseg,listesegments(k))
end

% 4 - Algorithme renvoyant la nouvelle structure de la chanson

nouvellelistesegments = AlgoChoix(Tvoulu,M,listetemps,listesegments) % nouvellelistesegments est une matrice contenant sur chaque ligne le segment ainsi que son temps de début et de fin dans la chanson initiale

% 3 - Ouverture de la chanson dont l'on veut modifier la durée

% [y,Fe] = audioread(uigetfile('\\data-pfe\pveillard2017\Projet élongation musicale\seglab\The_Beatles\01_-_Please_Please_Me\*.mp3'));
% T=length(y)/Fe; % Durée totale de la chanson

% 8 - Assemblage

% sTrig = AssemblageTotalTrig(y, nouvellelistesegments, DT, Fe);
% sTriangle = AssemblageTotal(y, nouvellelistesegments, DT, Fe);

% 9 - Enregistrement du son

% audiowrite('parfaittrig.wav',sTrig,Fe); % Clipping apparait ici
% audiowrite('parfaittriangle.wav',sTriangle,Fe);

% 10 - Moments des transitions (vérifier à l'écoute)

% transitions = cumsum(tab(:, 2) - tab(:, 1));

% 11 - Affichage

figure(1)
listesegments=string(listesegments);
y=[1 2 3 4 5 6 7];
plot(plotsegments)
set(gca,'yticklabel',[' ' listseg].')

save('listesegments1','listesegments')
