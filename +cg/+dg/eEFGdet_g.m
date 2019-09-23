function [e21 e31 E F G det_g] = eEFGdet_g(M)
    e31 = M.VERT(M.TRIV(:,3),:) - M.VERT(M.TRIV(:,1),:);
    e21 = M.VERT(M.TRIV(:,2),:) - M.VERT(M.TRIV(:,1),:);

    % computes dot product
    E = sum(e21 .* e21, 2);
    F = sum(e21 .* e31, 2);
    G = sum(e31 .* e31, 2);

    det_g = (E .* G) - (F.^2);
end
