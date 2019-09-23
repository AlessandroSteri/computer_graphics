% Builds a colormaps.
%
% Each band is a gradient determined by the ROW of the globalGradient_bins_x_bandsGradient matrix
% The COLUMNS of the matrix determine how this gradient changes across bands
% (The gradient is present even across bands.)
%
% globalGradient bins: number of bands of colors
% gradient binds: resolution of each band
%
% cmap = build_colormap(256, 1, [r; w]);
% -> a colormap made by a single unique gradient of 256 bins
%    This gradient goes from red to white
%    In a equivalent form: build_colormap(1, 256, [r, w]);
%
% cmap = build_colormap(2, 50, [w, bl; r, b]);
% -> a colormap made by two bands (no gradient between bands, since #bands_bin = #colors in band)
%    The first band goes from white to black, the second from red to blue
%
%    If the number of global_bins would have been greater, the blue would have become black smoothly,
%    and so the black to the blue
%
% cmap = build_colormap(50, 25, [[r, g, b]; [w, w, w]; [b, g, r];]);
% -> a colormap made by 50 bands, each one with 25 bins of resolution
%      The first band goes from red to green to blue
%      In the middle bar the colors vanish
%      The last band goes from  blu to green to red
%
%      The gradient between bands changes smoothly (e.g. r -> w -> b)
%
% cmap = build_colormap(20, 50, [w, bl, bl; w, w, bl; w, w, w]);
% -> 20 bands, in each band 50 bins
%    All bands have a gradient from white to black
%    Across bands the black portion is not uniform, but decreases
%
% Optionally, there is the possibility to repmat the colormap varargin times
function [cmap] = build_colormap(globalGradient_bins, bandsGradient_bins, globalGradient_x_bandsGradient, varargin)
    repetitions = 1;
    if length(varargin) > 0
        repetitions = varargin{1};
    end
    % rows: determines the gradient in each band
    composite_matrix = build_linear_colormap(globalGradient_bins, globalGradient_x_bandsGradient);

    % put things togheter to create bands in which the color goes from the start to final gradient
    cmap = build_composite_colormap(1, bandsGradient_bins, composite_matrix);

    cmap = repmat(cmap, repetitions, 1);
end
