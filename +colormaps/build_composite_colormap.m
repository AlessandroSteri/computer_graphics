% Builds a composite colormap (it is not a unique gradient)
%
% The columns of color_matrix determines the colors gradient in each band (can by any length)
% The rows of color_matrix determines the number of bands
%
% colormatrix: n*k, n: number of color bands, k: 3 * (number of colors in a band)
function [cmap] = build_composite_colormap(number_of_repetitions, gradient_bins, color_matrix)
    assert (size(color_matrix, 2) >= 1)

    cmap = [];
    for i = 1:size(color_matrix, 1)
        color_band = color_matrix(i,:);
        % organize a row of colors into a matrix t * 3
        colors = reshape(color_band', 3, size(color_band, 2) / 3)';
        cmap = [cmap; build_linear_colormap(gradient_bins, colors)];
    end
    cmap = repmat(cmap, number_of_repetitions, 1);
end
