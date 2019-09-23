function [N] = least_square(M, anchors)
    %L = laplacian_op(Q);
     L = cg.mesh.graph_laplacian(M);
     
    [~, indexes] = ismember(anchors, M.VERT, 'rows');
    A = sparse(1:length(anchors), indexes, 1, length(anchors), M.n);

    %N = [];
    N = M;
    N.VERT = zeros(M.n,3);
    b = [zeros(M.n, 3);anchors];
    N.VERT = [L;A] \ b;
end
