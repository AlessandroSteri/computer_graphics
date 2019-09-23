function d = heat_d_i(M,k, u_0)
% u_0 column vector size(M.n,1) with init heat condition
    [phi, ~, ~, ~] = cg.dg.spectral_decomposition(M, k);
    d = phi \ u_0;
    
end