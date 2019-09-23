function HKS = heat_kernel_signature(M, k, timestamps)
    HKS = zeros(M.n, length(timestamps));
    for i = 1:length(timestamps)
        K_t = cg.dg.heat_kernel(M, k, timestamps(i));
        HKS(:, i) = diag(K_t);
    end
end


