close all
clear all
clc

VT_M = @(M,i) M.VERT(M.TRIV(:,i),:);
E_M_ij = @(M,i,j) VT_M(M,j) - VT_M(M,i);

MESHES.bun000 = 'bun000.off';
MESHES.bunny = 'bunny.off';
MESHES.cat0 = 'cat0.off';
MESHES.cat_partial = 'cat_partial.off';
MESHES.sphere = 'sphere.off';
MESHES.tr_reg_000 = 'tr_reg_000.off';
MESHES.tr_reg_002 = 'tr_reg_002.off';
MESHES.tr_reg_010 = 'tr_reg_010.off';
MESHES.bun045 = 'bun045.off';
MESHES.deadpool = 'deadpool.off';
MESHES.torus = 'torus.off';
MESHES.tr_reg_001 = 'tr_reg_001.off';
MESHES.tr_reg_003 = 'tr_reg_003.off';
MESHES.tr_reg_031 = 'tr_reg_031.off';
MESHES.flat_505030 = 'flat_505030.off';
MESHES.flat_505030_ccw = 'flat_505030_ccw.off';


load_plot = @(M) cg.plot.mesh(cg.io.load_off(M));