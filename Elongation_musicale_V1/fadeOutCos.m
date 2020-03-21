function sFade = fadeOutCos(s, tDebOut, Fe)

    if nargin < 3
        Fe = 44100;
    end
    
    fade = ones(size(s));
    
    fade((tDebOut*Fe):end) = cos((pi/(2*(length(s)/Fe - tDebOut)))*(((tDebOut*Fe):length(s))/Fe - tDebOut));
    
    sFade = s.*fade;
end