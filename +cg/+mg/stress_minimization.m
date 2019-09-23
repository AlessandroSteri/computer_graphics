function [Z] = stress_minimization(X, dists, tol, lr)
% (X,d_x) --f--> (f(X), L2)
    
    ONE = ones(X.n,1);
    % Initialize Z with a random configuration
    lb = min(min(X.VERT));
    ub = max(max(X.VERT));
    Z = rand(X.n, 3) * (ub - lb) + lb;
    D_x = dists(X);
    sigma_old = [Inf];
    it = 1;
    
    while true
        D_z = cg.dist.l2(Z);
        
        B_z = - D_x ./ D_z;
        % Avoid NaN
        B_z(1:(X.n + 1):end) = 0;
        
        diag_B_z = - sum(B_z, 2);
        B_z = B_z + diag(diag_B_z);

        %B_z = B_z + diag(cg.utils.sum_row(D_x ./ D_z));
        
        
        
        V = (X.n * eye(X.n)) - ( ONE * ONE' );
        Z = Z - 2*lr*( (V*Z) - (B_z*Z) );
        s =  sum(sum(triu(D_x) .^2)); % diagonal is ok cause is always zero by def of dist
        sigma_Z = trace(Z' * V * Z) - (2*trace(Z'*B_z*Z)) + s;
        
        [nanrows, nancols] = find(isnan(Z));
        Z(nanrows, nancols) = 0;

        TMP = X;
        TMP.VERT = Z;
        cg.plot.mesh(TMP);
        drawnow
        if abs(sigma_Z - sigma_old) < tol
            break;
         end;
        sigma_old(end+1) = sigma_Z;
        it = it +1;
        %plot(1:it,sigma_old)
    end;
end