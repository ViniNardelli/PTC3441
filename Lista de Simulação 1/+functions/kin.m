function [wrelb] = kin(theta, L)
    arguments
        theta (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
        L (1,2) {mustBeNumeric, mustBeReal, mustBeFinite} = [0.5, 0.3]
    end
    t1 = theta(1) * pi / 180;
    t2 = theta(2) * pi / 180;
    t3 = theta(3) * pi / 180;
    
    L1 = L(1);
    L2 = L(2);
    
    wrelb = [cos(t1+t2+t3), -sin(t1+t2+t3), 0, L1*cos(t1)+L2*cos(t1+t2);
             sin(t1+t2+t3),  cos(t1+t2+t3), 0, L1*sin(t1)+L2*sin(t1+t2);
             0, 0, 1, 0;
             0, 0, 0, 1];
end

