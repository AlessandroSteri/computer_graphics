function [out] = arrows(source, vectors, varargin)
    out = quiver3(source(:, 1), source(:, 2), source(:, 3), vectors(:, 1), vectors(:, 2), vectors(:, 3), 'MarkerFaceColor', 'r',  'Color', 'r' );
end
