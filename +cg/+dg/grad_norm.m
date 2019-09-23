function [n] = grad_norm(M, f)
    
    f_u = f(M.TRIV(:, 2)) - f(M.TRIV(:, 1));
    f_v = f(M.TRIV(:, 3)) - f(M.TRIV(:, 1));

    [e21 e31 E F G det_g] = cg.dg.eEFGdet_g(M);

    n = ( (f_u.^2) .* G ) - ( 2 .* f_u .* f_v .* F ) + ( (f_v.^2) .* E );
    n = (n ./ det_g) .^ (1/2);
end
