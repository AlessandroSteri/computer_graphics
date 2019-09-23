function [grad local_grad] = gradient(M, f)

    % compute local gradient (in the parameter domain: n by 2 matrix)
    f_21 = f(M.TRIV(:, 2)) - f(M.TRIV(:, 1));
    f_31 = f(M.TRIV(:, 3)) - f(M.TRIV(:, 1));
    local_grad =  [ f_21 , f_31 ];

    % Global Gradient

    % Edges
    % [e21 e31 E F G det_g] = cg.dg.eEFGdet_g(M)
    e21 = M.VERT(M.TRIV(:,2),:) - M.VERT(M.TRIV(:,1),:);
    e31 = M.VERT(M.TRIV(:,3),:) - M.VERT(M.TRIV(:,1),:);

    % computes dot product
    E = sum(e21 .* e21, 2);
    F = sum(e21 .* e31, 2);
    G = sum(e31 .* e31, 2);

    det_g = (E .* G) - (F.^2);

    % Jacobian * inverse(g):
    % J * g^-1 = [ J_ginv_x_1 J_ginv_x_2;
    %              J_ginv_y_1 J_ginv_y_2;
    %              J_ginv_z_1 J_ginv_z_2 ]
    % where x, y, z are edges coordinates, 1 is the column [G -F]' and 2 is the column [-F E]'

    X = 1;
    Y = 2;
    Z = 3;

    J_ginv_x_1 = ((e21(:,X) .* G) + (e31(:,X) .* -F) ) ./ det_g;
    J_ginv_y_1 = ((e21(:,Y) .* G) + (e31(:,Y) .* -F) ) ./ det_g;
    J_ginv_z_1 = ((e21(:,Z) .* G) + (e31(:,Z) .* -F) ) ./ det_g;

    J_ginv_x_2 = ((e21(:,X) .* -F) + (e31(:,X) .* E) ) ./ det_g;
    J_ginv_y_2 = ((e21(:,Y) .* -F) + (e31(:,Y) .* E) ) ./ det_g;
    J_ginv_z_2 = ((e21(:,Z) .* -F) + (e31(:,Z) .* E) ) ./ det_g;


    grad_x = sum([J_ginv_x_1 .* f_21 J_ginv_x_2 .* f_31], 2);
    grad_y = sum([J_ginv_y_1 .* f_21 J_ginv_y_2 .* f_31], 2);
    grad_z = sum([J_ginv_z_1 .* f_21 J_ginv_z_2 .* f_31], 2);

    grad = [ grad_x grad_y grad_z ];

end
