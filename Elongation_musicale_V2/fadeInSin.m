function sFade = fadeInSin(s, tFinIn, Fe)

    if nargin < 3
        Fe = 44100;
    end
    
    fade = ones(size(s));
    fade(1:(tFinIn*Fe)) = sin((pi/(2*tFinIn))*(1:(tFinIn*Fe))/Fe);
    
    sFade = s.*fade;
end