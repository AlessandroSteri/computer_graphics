function D = heat_diffusion(M, k, t)
    kernel = @(x) exp(-2 * x * t);
    D = cg.dist.eigen_laplatian(M,k, kernel);
end
