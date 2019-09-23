function [norm_f] = fit_to_colormap(f, cmap)
    norm_f = round(1 + (size(cmap, 1)-1) * minmax_norm(f));
end
