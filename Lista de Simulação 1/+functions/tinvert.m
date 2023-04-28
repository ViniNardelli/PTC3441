function [arelb] = tinvert(brela)
    arguments
        brela {functions.mustBeHomTransfR}
    end
    R_T = brela(1:3, 1:3)';
    O = brela(1:3, 4);
    arelb = [R_T, -R_T*O;
             0, 0, 0, 1];
end

