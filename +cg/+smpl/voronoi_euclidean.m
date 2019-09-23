function f = voronoi_euclidean( V, S )
% V(S,:) gets coordinates of indexes in S
[~,f] = min(pdist2(V,V(S,:)), [], 2); % operates on dim 2, reduce point x to argmin of distances to point in sample S aka to its region

end
