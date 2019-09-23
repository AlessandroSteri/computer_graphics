function HKS = hks(M, k, T)
%HKS Summary of this function goes here
%   Detailed explanation goes here

    % Initialize HKS
    HKS = zeros(M.n, length(T));
    % For each value of time, compute the diagonal of the heat kernel
    for i = 1:length(T)
        t = T(i);
        % Compute the heat kernel
        K = meshproc.heat_kernel(M, k, t);
        HKS(:, i) = diag(K);
    end

end

