function [cmap] = monochrome_blue(monochrome_bins, concentration)
    blu_very_light = [0.9 0.9 1 ];
    blu_ligth = [ 0.45 0.45 1 ];
    b = [0 0 1];
    blu_dark = [0.1 0.1 0.6];
    blu_very_dark = [0 0 0.6];
    white = [1 1 1];

    cmap = build_monochrome(monochrome_bins, 50, concentration, blu_very_light, blu_ligth, b, blu_dark, blu_very_dark, white);
end
