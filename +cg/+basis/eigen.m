function B_eig = eigen(M,k)
    [B_eig, ~, ~, ~] = cg.dg.spectral_decomposition(M, k);
    %B_eig = phi';
end