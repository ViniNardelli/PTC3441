function isHomTransfR = mustBeHomTransfR(T, tol)
%Check if the matrix T is a right-handed homogeneous transformation
    arguments (Input)
        T (4, 4) {mustBeNumeric, mustBeReal, mustBeFinite}
        tol (1, 1) {mustBeNumeric, mustBeReal, mustBeFinite, mustBePositive} = 1E-6
    end

    R = T(1:3, 1:3); % Rotation matrix

    % Check if the last row of T is [0 0 0 1]
    if ~(norm(T(4, :) - [0 0 0 1]) < tol)
        error("A última linha da matriz tem um erro. T = %s", mat2str(T, 3));
    end
    
    % Check if the determinant of the rotation matrix is 1 (right-handed)
    if ~(det(R) - 1 < tol)
        error("O determinante da matriz de rotação não é 1. T = %s", mat2str(T, 3));
    end
    
    % Check if the rotation matrix is orthogonal
    if ~(norm(R' * R - eye(3)) < tol)
        error("A matriz de rotação não é ortogonal. T = %s", mat2str(T, 3));
    end
    
    % Check if norm of the rotation matrix rows are 1
    if ~(norm(R(1, :)) - 1 < tol)
        error("A linha 1 da matriz de rotação não tem norma 1. T = %s", mat2str(T, 3));
    end

    if ~(norm(R(2, :)) - 1 < tol)
        error("A linha 2 da matriz de rotação não tem norma 1. T = %s", mat2str(T, 3));
    end

    if ~(norm(R(3, :)) - 1 < tol)
        error("A linha 3 da matriz de rotação não tem norma 1. T = %s", mat2str(T, 3));
    end

    
    % Check if norm of the rotation matrix columns are 1
    if ~(norm(R(:, 1)) - 1 < tol)
        error("A coluna 1 da matriz de rotação não tem norma 1. T = %s", mat2str(T, 3));
    end

    if ~(norm(R(:, 2)) - 1 < tol)
        error("A coluna 2 da matriz de rotação não tem norma 1. T = %s", mat2str(T, 3));
    end

    if ~(norm(R(:, 3)) - 1 < tol)
        error("A coluna 3 da matriz de rotação não tem norma 1. T = %s", mat2str(T, 3));
    end

    isHomTransfR = true;

end
