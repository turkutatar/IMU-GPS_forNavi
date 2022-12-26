function xdot = f_inv_cart_pend(x, F, M, m, L, g, c, b, k)

% Inverted Cart Pendulum
A = [1 0 0 0;
 0 1 0 0;
 0 0 M+m m*L*cos(x(2));
 0 0 m*L*cos(x(2)) m*L^2+m*L^2/3];

b = [x(3);
     x(4);
     m*L*sin(x(2))*x(4)^2-b*x(3)-k*x(1)+F;
     m*g*L*sin(x(2))-c*x(4);];
 
xdot=A\b; 