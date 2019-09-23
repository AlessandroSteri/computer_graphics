cg.init
M = cg.io.load_off('cat0.off');
A1 = cg.dg.calc_tri_areas(M);
A2 = cg.dg.area_elements(M);
A3 = scripts.calc_tri_areas(M);

all(cg.utils.round(A1,10) == cg.utils.round(A2,10))
all(cg.utils.round(A2,10) == cg.utils.round(A3,10))
