function A = calc_tri_areas(M)

    A = zeros(size(M.TRIV,1),1);

    e31 = M.VERT(M.TRIV(:,3),:) - M.VERT(M.TRIV(:,1),:);
    e21 = M.VERT(M.TRIV(:,2),:) - M.VERT(M.TRIV(:,1),:);

    % computes dot product
    E = sum(e21 .* e21, 2);
    F = sum(e21 .* e31, 2);
    G = sum(e31 .* e31, 2);

    % g = [ E F;
    %       F G ];

    det_g = (E .* G) - (F.^2);

    A = 1/2 * (det_g .^ (1/2) );

end
