function [INT_f, f_T] = integral_of_f_voronoi(M,f)
    A_vor = cg.dg.voronoi_areas(M);
    f_T = A_vor .* f;
    INT_f = sum(f_T);
end
