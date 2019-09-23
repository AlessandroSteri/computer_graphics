function [f_color] = f_to_color(f)
    f_color = cg.utils.normalize(f);
    f_color = round(1 + 255 * f_color);
end

