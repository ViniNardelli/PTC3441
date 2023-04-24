function [crela] = tmult(brela, crelb)
    arguments
        brela {mustBeHomTransfR}
        crelb {mustBeHomTransfR}
    end
    
    crela = crelb * brela;
end

