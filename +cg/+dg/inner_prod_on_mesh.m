function [f_dot_g] = inner_prod_on_mesh(M,f,g)
    A_vor = cg.dg.voronoi_areas(M);
    % point-wise implementation of def:
    % f' * diag(A) * g
    f_dot_g = sum(f .* A_vor .* g); % faster
    % f_dot_g = f' * diag(A_vor) * g; % slower
end

