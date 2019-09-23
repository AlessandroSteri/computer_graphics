function [F_dot_G] = inner_prod_on_mesh_vec_fields(M, F, G)
    F_dot_G = F .* G;
    F_dot_G = sum(sum(F_dot_G,2));
end
