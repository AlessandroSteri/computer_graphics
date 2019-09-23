function D_b = approx_biharmonic(M, k)
    [phi, lambda, S, A] = cg.dg.spectral_decomposition(M, k);
    D_b = zeros(M.n, M.n);
    lambda_square = diag(lambda)' .^ 2;
    for i=1:M.n
        for j=1+1:M.n % +1 so diagonal stay zero
            d_ij = sum(( (phi(i,:) - phi(j,:)) .^ 2 ) ./ lambda_square);
            D_b(i,j) = d_ij;
            D_b(j,i) = d_ij; % simetric
        end
    end
end
