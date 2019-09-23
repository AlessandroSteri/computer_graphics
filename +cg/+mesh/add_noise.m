function A = add_noise(M, variance, mean)
    A = M;
    A.VERT = A.VERT + sqrt(variance) * randn(size(A.VERT)) + mean;
end