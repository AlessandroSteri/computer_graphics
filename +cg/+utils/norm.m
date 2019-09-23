function [nA] = normr(A);
    nA = bsxfun(@rdivide,A,sqrt(sum(A.^2,2)));
    nA(~isfinite(nA)) = 1; % Use 0 to match output of @Shai's solution, Matlab's norm()
end
