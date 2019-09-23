function [D] = geodesic(M, srcs)
    if nargin == 1
        srcs = 1:M.n;
    end

    % To Graph
    v1 = M.TRIV(:,1);
    v2 = M.TRIV(:,2);
    v3 = M.TRIV(:,3);


    % all edges of the trimesh as edges of the graph
    E = [v1 v2; v2 v3; v3 v1;v2 v1; v3 v2; v1 v3];
    E = unique(E,'rows');
    a = E(:,1);
    b = E(:,2);
    a_coord = M.VERT(a,:);
    b_coord = M.VERT(b,:);
    p = 2; %use L_2 inside triangle
    d = ( sum( abs(a_coord - b_coord) .^ p, 2 ) ) .^ (1/p);

    G = graph(a,b,d);

    %src = 2819;

    D = distances(G, srcs)';
    % cg.plot.mesh(M, ds)
end
