function [trels] = where_robot(theta,trelw,srelb,L)
    arguments
        theta (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
        trelw {functions.mustBeHomTransfR}
        srelb {functions.mustBeHomTransfR}
        L (1,2) {mustBeNumeric, mustBeReal, mustBeFinite} = [0.5, 0.3]
    end
    wrelb = functions.kin(theta, L);
    brels = functions.tinvert(srelb);
    
    wrels = functions.tmult(wrelb, brels);
    trels = functions.tmult(trelw, wrels);
end

