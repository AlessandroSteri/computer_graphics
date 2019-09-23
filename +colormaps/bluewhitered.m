function [cmap] = bluewhitered(n_bins)
    r = [1 0 0];
    w = [1 1 1];
    b = [0 0 1];

    cmap = build_linear_colormap(n_bins, [b; w; r]);
end

