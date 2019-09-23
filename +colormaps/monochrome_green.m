function [cmap] = monochrome_green(monochrome_bins, concentration)
    gre_very_light = [0.9 1 0.9];
    gre_ligth = [ 0.45 1  0.45];
    g = [0 1 0];
    gre_dark = [0.1 0.6 0.1];
    gre_very_dark = [0 0.6 0];
    white = [1 1 1];

    cmap = build_monochrome(monochrome_bins, 50, concentration, gre_very_light, gre_ligth, g, gre_dark, gre_very_dark, white);
end
