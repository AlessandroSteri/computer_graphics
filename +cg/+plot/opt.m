function [out] = opt(handle)
    axis equal
    ax = gca;
    ax.Clipping = 'off';
    material(handle, [0.35, 0.5, 0.15])
    light
    lighting gouraud
    camlight head
    axis off
end
