%% Test fonction assemblage total
[Fn,Pn] = uigetfile('*.mp3');
FichierListe=[Pn Fn];
[y,Fe] = audioread(FichierListe);

% Durée de la transition
DT = 4;

% tableau des transitions (correspond à 4 morçeaux de 'Please', des
% Beatles : verse-bridge-verse-outro)
tab = [7.709, 35.120; 62.671, 80.151; 35.120, 62.671; 108.016, 118.939];

% Assemblage !
sTrig = AssemblageTotalTrig(y, tab, DT, Fe);
sTriangle = AssemblageTotal(y, tab, DT, Fe);

% enregistrement du son
audiowrite('4morceauxTrig.wav',sTrig,Fe);
audiowrite('4morceauxTriangle.wav',sTriangle,Fe);

%moments des transitions (vérifier à l'écoute)
transitions = cumsum(tab(:, 2) - tab(:, 1));