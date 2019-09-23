% Builds a smooth colormap that is a gradient of the colors in color_matrix
%   from the first ROW to last ROW
%
% color_matrix: n*k, each row is list rgb colors
function [cmap] = build_linear_colormap(n_bins, color_matrix)
    number_of_colors = size(color_matrix, 1);

    assert(n_bins >= number_of_colors, "The number of colors can't be greater than the number of the bins in the gradient");

    if number_of_colors == 1
        assert (n_bins == 1 , "The number of bins can't be >1 if there is only one color in the gradient");
    end

    if  n_bins == number_of_colors
        number_of_colors
        cmap = color_matrix;
    else
        step_size = round(n_bins / (number_of_colors - 1));
        n_bins = (number_of_colors - 1) * step_size;

        cmap = zeros(n_bins, 3);
        for rgb = 1:size(color_matrix, 2)
            for step_color = 0:(number_of_colors - 2)
                c1 = color_matrix(step_color + 1, :);
                c2 = color_matrix(step_color + 2 , :);

                gradiente_colore = linspace(c1(rgb), c2(rgb), step_size);
                a = (step_color)*step_size + 1;
                b = (step_color + 1) * step_size;

                cmap(a : b, rgb) = gradiente_colore;
        end

        cmap;
    end
end
