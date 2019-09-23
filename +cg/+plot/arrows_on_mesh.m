function [out] = arrows_on_mesh(M, vectors)
    b = cg.utils.baricenter(M);
    out = quiver3(b(:, 1), b(:, 2), b(:, 3), vectors(:, 1), vectors(:, 2), vectors(:, 3), 'MarkerFaceColor', 'r',  'Color', 'r' );
end
