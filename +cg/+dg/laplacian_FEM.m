function [S,A] = laplacian_FEM(M)

    % Stiffness
    %  vertex to coord
    VT = @(i) M.VERT(M.TRIV(:,i),:);

    % coord to oriented edge
    e_ij = @(i,j) VT(j)-VT(i);

    % compute cot
    normalize =  @(e) e ./ (sqrt(sum(e.^2,2))*[1 1 1]);
    % this ads to S(b,c) anf S(c,b) so index in M.TRIV(:,b) and M.TRIV(:,c)
    cot_abc = @(a,b,c) (-1/2) * cot(acos( sum(normalize(e_ij(a,b)) .* normalize(e_ij(a,c)), 2) ));

    % to index
    indices_i = @(i) M.TRIV(:,i);

    a_32 = cot_abc(1,2,3);
    a_31 = cot_abc(2,3,1);
    a_12 = cot_abc(3,1,2);

    % S_32 = sparse(indices_i(3), indices_i(2), a_32, M.n, M.n) + sparse(indices_i(2), indices_i(3), a_32, M.n, M.n);
    % S_31 = sparse(indices_i(3), indices_i(1), a_31, M.n, M.n) + sparse(indices_i(1), indices_i(3), a_31, M.n, M.n);
    % S_12 = sparse(indices_i(1), indices_i(2), a_12, M.n, M.n) + sparse(indices_i(1), indices_i(2), a_12, M.n, M.n);
    % S = S_32 + S_31 + S_12;
    % I = [indices_i(3); indices_i(3); indices_i(1); indices_i(2); indices_i(1); indices_i(1)];
    % J = [indices_i(2); indices_i(1); indices_i(2); indices_i(3); indices_i(3); indices_i(2)];
    % v = [a_32; a_31; a_12; a_32; a_31; a_12]

    I = [indices_i(1); indices_i(2); indices_i(3); indices_i(3); indices_i(2); indices_i(1)];
    J = [indices_i(2); indices_i(3); indices_i(1); indices_i(2); indices_i(1); indices_i(3)];
    v = [a_12;         a_32;         a_31;         a_32;         a_12;         a_31];

    S = sparse(I, J, v);
    S = S-sparse(1:M.n,1:M.n,sum(S));

    % Mass
    A = cg.dg.voronoi_areas(M);
    A = cg.utils.spdiag(A);
end
