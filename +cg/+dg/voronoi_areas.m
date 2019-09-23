function [A_vor] = voronoi_areas(M)

    A_vor = zeros(M.n, 1);

    % computes the area elements
    A = cg.dg.calc_tri_areas(M);

    %find voronoi area of each vertex
    for i=1:M.m
        A_vor(M.TRIV(i,1:3)) = A_vor(M.TRIV(i,1:3)) + A(i)/3;
    end
end

