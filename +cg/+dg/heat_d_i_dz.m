function d = heat_d_i_dz(M,k, dz)
%dz is dirac at z, integer of the index
    [phi, lambda, ~, ~] = cg.dg.spectral_decomposition(M, k);
    d = phi(dz,:)';
end