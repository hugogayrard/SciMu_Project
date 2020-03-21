%% Test fadeIn, fadeOut
clear;

% Paramètres
T = 10;
Fe = 44100;

tFinIn = 1;
tDebOut = 1.5;

% Initialisation
t = linspace(0, T, Fe*T);
s = ones(size(t));

% Calcul des filtres à appliquer

% Filtres trigo
sFadeInSin = fadeInSin(s, tFinIn, Fe);
sFadeOutCos = fadeOutCos(s, tDebOut, Fe);

% Filtres triangles
sFadeIn = fadeIn(s, tFinIn, Fe);
sFadeOut = fadeOut(s, tDebOut, Fe);

% Plot des filtres
figure(1)
plot(t, sFadeInSin, t, sFadeOutCos);
legend('Fade In  trigo', 'Fade Out trigo')

figure(2)
plot(t, sFadeIn, t, sFadeOut);
legend('Fade In  triangle', 'Fade Out triangle')
