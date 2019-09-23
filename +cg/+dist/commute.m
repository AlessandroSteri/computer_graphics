function D = commute(M, k)
    kernel = @(x) x .^ -1;
    D = cg.dist.eigen_laplatian(M,k, kernel);
end
