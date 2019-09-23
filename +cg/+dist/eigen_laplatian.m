function D_b = eigen_laplatian(M, k, kernel)
    [phi, lambda, S, A] = cg.dg.spectral_decomposition(M, k);
    D_b = zeros(M.n, M.n);
    lambda_kernel = kernel(diag(lambda)');
    for i=1:M.n
        for j=1+1:M.n % +1 so diagonal stay zero
            d_ij = sum(( (phi(i,:) - phi(j,:)) .^ 2 ) .* lambda_kernel);
            D_b(i,j) = d_ij;
            D_b(j,i) = d_ij; % simetric
        end
    end
    D_b = sqrt(D_b);
end
