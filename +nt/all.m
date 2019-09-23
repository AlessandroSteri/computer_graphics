function [Grad, lapl, Div] = all(M,f)
    f = f';
    F = M.TRIV';
    X = M.VERT';
    
    n = size(X,2);
    m = size(F,2);

    % all vertex coord
    XF = @(i)X(:,F(i,:));
    Na = cross( XF(2)-XF(1), XF(3)-XF(1) );
    amplitude = @(X)sqrt( sum( X.^2 ) );
    A = amplitude(Na)/2;
    normalize = @(X)X ./ repmat(amplitude(X), [3 1]);
    N = normalize(Na);
    
    I = []; J = []; V = []; % indexes to build the sparse matrices
    for i=1:3
        % opposite edge e_i indexes
        s = mod(i,3)+1;
        t = mod(i+1,3)+1;
        % vector N_f^e_i
        wi = cross(XF(t)-XF(s),N);
        % update the index listing
        I = [I, 1:m];
        J = [J, F(i,:)];
        V = [V, wi];
    end
    
    dA = spdiags(1./(2*A(:)),0,m,m);
    GradMat = {};
    for k=1:3
        GradMat{k} = dA*sparse(I,J,V(k,:),m,n);
    end
    Grad = @(u)[GradMat{1}*u, GradMat{2}*u, GradMat{3}*u]';
    
    dAf = spdiags(2*A(:),0,m,m);
    DivMat = {GradMat{1}'*dAf, GradMat{2}'*dAf, GradMat{3}'*dAf};

    Div = @(q)DivMat{1}*q(1,:)' + DivMat{2}*q(2,:)' + DivMat{3}*q(3,:)';

    % Laplacian operator as the composition of grad and div.
    Delta = DivMat{1}*GradMat{1} + DivMat{2}*GradMat{2} + DivMat{3}*GradMat{3};
    cota = @(a,b)cot( acos( dot(normalize(a),normalize(b)) ) );
    I = []; J = []; V = []; % indexes to build the sparse matrices
    Ia = []; Va = []; % area of vertices
    for i=1:3
        % opposite edge e_i indexes
        s = mod(i,3)+1;
        t = mod(i+1,3)+1;
        % adjacent edge
        ctheta = cota(XF(s)-XF(i), XF(t)-XF(i));
        % ctheta = max(ctheta, 1e-2); % avoid degeneracy
        % update the index listing
        I = [I, F(s,:), F(t,:)];
        J = [J, F(t,:), F(s,:)];
        V = [V, ctheta, ctheta];
        % update the diagonal with area of face around vertices
        Ia = [Ia, F(i,:)];
        Va = [Va, A];
    end
    % Aread diagonal matrix
    Ac = sparse(Ia,Ia,Va,n,n);
    % Cotan weights
    Wc = sparse(I,J,V,n,n);
    % Laplacian with cotan weights.
    DeltaCot = spdiags(full(sum(Wc))', 0, n,n) - Wc;
    
    %Check that the Laplacian with cotan weights is actually equal to the composition of divergence and gradient.
    fprintf('Should be 0: %e\n', norm(Delta-DeltaCot, 'fro')/norm(Delta, 'fro'));
    lapl = Delta*f(:);
    %lapl = clamp(lapl, -3*std(lapl), 3*std(lapl));
end