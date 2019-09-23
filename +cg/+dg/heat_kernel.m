function K_t = heat_kernel(M, k, t)
    [phi, lambda, ~, ~] = cg.dg.spectral_decomposition(M, k);
    K_t = phi * exp(- lambda * t) * phi';
end

