function b_vor = voronoi(M, k, seed)
    [~, S] = cg.smpl.fps(M.VERT, k, seed);
    v_regions = cg.smpl.voronoi_euclidean(M.VERT, S);
    b_vor = ind2vec(v_regions')';
end