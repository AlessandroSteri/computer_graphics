function D = approx_biharmonic(M, k)
    kernel = @(x) x .^ -2;
    D = cg.dist.eigen_laplatian(M,k, kernel);
end
