function s = AssemblageTrig(y1, y2, DT, Fe)
    %Assemble deux morçeaux avec fadein/fadeout
    
    % Durée des morçeaux
    t1 = length(y1)/Fe;
    t2 = length(y2)/Fe;
    
    % Paramètres des fade in and out
    tDebOut1 = t1 - DT; % on commence le fadeout du verse à la fin du verse ( avant les 4 secondes de marge)
    tFinIn2 = DT; % on finit le fadein du bridge au tout début de celui-ci (après les 4secondes de marges)
    
    % Fadein FadeOut
    y1FadeOut = fadeOutCos(y1, tDebOut1, Fe);
    y2FadeIn = fadeInSin(y2, tFinIn2, Fe);

    % Assemblage
    s = zeros(1, round(Fe*(t1 + t2 - DT)+1));
    s(1:length(y1FadeOut)) = y1FadeOut;
    s((length(s)-length(y2FadeIn)+1):length(s)) = s((length(s)-length(y2FadeIn)+1):length(s)) + y2FadeIn;

end