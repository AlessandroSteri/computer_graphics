function [cmap] = testcolormap(n_bins)
    r = [1 0 0];
    g = [0 1 0];
    black = [0 0 0];
    w = [1 1 1];
    b = [0 0 1];

    % cmap = build_colormap(n_bins, b, g, g, g, r, g, g, g ,black, g, g,g , black, g, g, g, r, g, g,g ,b);
    cmap = build_colormap(n_bins, b, g, g, r);
end
