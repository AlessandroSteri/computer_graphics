function [cmap] = errorbands(bins)
    w = [1 1 1];
    grey = [0.9 0.9 0.9];
    red_light = [0.8 0.2 0.2];
    r = [0.6 0 0];
    green_light = [0.4 0.8 0.4];
    g = [0.2 0.6 0.2];
    cmap = build_colormap(bins, 100, [w, grey; green_light, g; red_light, r]);
end
