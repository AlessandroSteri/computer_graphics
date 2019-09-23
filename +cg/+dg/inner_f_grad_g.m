function I_f_Dg = inner_f_grad_g(M,f,g)
    [S,A] = cg.dg.calc_LB_FEM(M);
    I_f_Dg = f'*S*g;
end