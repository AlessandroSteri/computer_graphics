function [cmap] = monochrome_red(monochrome_bins, concentration)
    red_very_light = [1 0.9 0.9];
    red_ligth = [1 0.45 0.45];
    r = [1 0 0];
    red_dark = [0.6 0.1 0.1];
    red_very_dark = [0.6 0 0];
    white = [1 1 1];

    cmap = build_monochrome(monochrome_bins, 50, concentration, red_very_light, red_ligth, r, red_dark, red_very_dark, white);
end

