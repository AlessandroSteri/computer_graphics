quantization = 0.1;
dom_u = [0 :quantization: 2*pi];
dom_v = [0 :quantization: 2*pi];
[U,V] = meshgrid(dom_u,dom_v);
dom_s = [U(:) V(:)];

dom_U = dom_s(:,1);
dom_V = dom_s(:,2);

sphere_x = cos(dom_U).*cos(dom_V);
sphere_y = sin(dom_U).*cos(dom_V);
sphere_z = sin(dom_V);

S =  [sphere_x sphere_y sphere_z];

cg.plot.cloud(S);

curve_i = find(cg.utils.round(sphere_y,2) == 0.01);

curve_x = sphere_x(curve_i);
curve_y = sphere_y(curve_i);
curve_z = sphere_z(curve_i);

d_u = dom_U(curve_i);
d_v = dom_V(curve_i);

