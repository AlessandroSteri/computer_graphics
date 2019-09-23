function [INT_f, f_T] = integral_of_funct(M, f)

    % computes the area elements
    A = cg.dg.calc_tri_areas(M);

    % computes f for each vertex of each triangle
    f_x1 = f(M.TRIV(:, 1));
    f_x2 = f(M.TRIV(:, 2));
    f_x3 = f(M.TRIV(:, 3));

    % f of the trianfle
    f_T = sum([f_x1 f_x2 f_x3], 2) .* A * (1/3);

    % integral of f
    INT_f = sum(f_T);
end

