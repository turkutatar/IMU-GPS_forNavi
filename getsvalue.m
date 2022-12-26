function [F,G]=getsvalue(x0,u,M,m,L, g, c, b, k,C,D,Ts)

[A, B] = f_inv_cart_pend_jacobian_complex_step(@f_inv_cart_pend, x0, u, M, m, L, g, c, b, k);
Hc = ss(A,B,C,D);
Hd = c2d(Hc, Ts, 'tustin');
F = Hd.a;
G = Hd.b;
end