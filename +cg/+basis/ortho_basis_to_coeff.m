function c = ortho_basis_to_coeff(B_orth, v)
    n = size(B_orth,2);
    ONE = ones(n,1);
    v_tiled = ONE * v;
    c = dot(v_tiled',B_orth,2);
end