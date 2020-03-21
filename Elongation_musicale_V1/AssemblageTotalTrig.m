function s = AssemblageTotalTrig(y, tab, DT, Fe)
    % Fonction qui r�alise l'assemblage des mor�eaux de chansons de y
    % rang�s � priori dans l'ordre voulu dans un tableau tab (n ligne * 2
    % colonne), avec les temps de d�but et de fin des mor�eaux � assembler.
    % DT est la dur�e de transition entre chaque mor�eau.

    clear i;
    
    % Nombre de mor�eaux
    nbM = size(tab, 1);
    
    % Morceau initial - pas besoin de transition avant
    s = y(round(tab(1, 1)*Fe+1):round((tab(1,2) + DT)*Fe+1));
    
    for i = 2:(nbM-1)
        y2 = y(round((tab(i, 1) - DT)*Fe+1):round((tab(i,2) + DT)*Fe+1));
        s = AssemblageTrig(s, y2, DT, Fe);
        
        clear y2; % Au cas o� le mor�eau d'apr�s est plus court et �viter ainsi de rajouter des valeurs du mor�eau pr�c�dent
    end
    
    % Mor�eau final - pas besoin de transition apr�s
    y2 = y(round((tab(end, 1) - DT)*Fe+1):(tab(end,2)*Fe+1));
    s = AssemblageTrig(s, y2, DT, Fe);
end