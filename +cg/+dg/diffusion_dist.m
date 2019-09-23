function D_b = diffusion_dist(M, k, t)
    [phi, lambda, S, A] = cg.dg.spectral_decomposition(M, k);
    D_b = zeros(M.n, M.n);
    kernel = @(x) exp(-2 * x * t);
    t
    lambda_kernel = kernel(diag(lambda)');
    for i=1:M.n
        for j=1+1:M.n % +1 so diagonal stay zero
            d_ij = sum(( (phi(i,:) - phi(j,:)) .^ 2 ) .* lambda_kernel);
            D_b(i,j) = d_ij;
            D_b(j,i) = d_ij; % simetric
        end
    end
end
