function [ver] = mustBeHomTransfR(T)
%Check if the matrix T is a right-handed homogeneous transformation
    arguments
        T (4, 4) {mustBeNumeric, mustBeReal, mustBeFinite}
    end
    ver = true;
    
    % Check if the last row of T is [0 0 0 1] 
    ver = ver && all(T(4, :) == [0, 0, 0, 1]);
    
    % Check if the determinant of the rotation matrix is 1 (right-handed)
    ver = ver && det(T(1:3, 1:3)) == 1;
    
    % Check if the rotation matrix is orthogonal
    ver = ver && all(eye(3) == T(1:3, 1:3)*T(1:3, 1:3)', 'all');
    
    % Check if norm of the rotation matrix rows are 1
    ver = ver && norm(T(1, 1:3)) == 1;
    ver = ver && norm(T(2, 1:3)) == 1;
    ver = ver && norm(T(3, 1:3)) == 1;
    
    % Check if norm of the rotation matrix columns are 1
    ver = ver && norm(T(1:3, 1)) == 1;
    ver = ver && norm(T(1:3, 2)) == 1;
    ver = ver && norm(T(1:3, 3)) == 1;
end

