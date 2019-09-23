function  A = calc_tot_surace(M)
    % Compute edges len
    e12 = sqrt(sum((M.VERT(M.TRIV(:, 1), :) - M.VERT(M.TRIV(:, 2), :)).^2, 2));
    e23 = sqrt(sum((M.VERT(M.TRIV(:, 2), :) - M.VERT(M.TRIV(:, 3), :)).^2, 2));
    e13 = sqrt(sum((M.VERT(M.TRIV(:, 1), :) - M.VERT(M.TRIV(:, 3), :)).^2, 2));
    % Half Peremeter
    P_half = (1/2) * sum([e12 e23 e13],2);
    % Compute the areas
    a = sqrt(P_half .* (P_half - e12) .* (P_half - e23) .* (P_half - e13));
    A = sum(a);
end
