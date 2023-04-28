function [crela] = tmult(brela, crelb)
    arguments
        brela {functions.mustBeHomTransfR}
        crelb {functions.mustBeHomTransfR}
    end
    
    crela = crelb * brela;
end

