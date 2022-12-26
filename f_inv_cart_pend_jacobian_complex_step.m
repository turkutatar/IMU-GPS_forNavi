function [A, B] = f_inv_cart_pend_jacobian_complex_step(f, x0, u0, MM, mm, L, g, c, b, k)
% Computes the jacobian of f (function handle) around the point x0, u0
% and returns the A and B matrices for the state-space representation
% using the complex step method
% IMPORTANT NOTE
% If transpose operation is conducted in the function
% it needs to be A.'
% NOT A' (i.e. not hermitian but regular transpose)

%complx step derivative araştır


N  = length(x0);
f0 =  f(x0, u0, MM, mm, L, g, c, b, k);
M  = length(f0);
jacf = zeros(M,N);

for m = 1:M
    gradfm = zeros(N,1);
    tol = 1e-9; % Used in order to check inconsistency
    h = sqrt(eps);
    for n = 1:N
        xc = complex(x0);
        xc(n) = xc(n) + 1i*h;
        fc = f(xc, u0, MM, mm, L, g, c, b, k);
        gradfm(n)   = imag(fc(m))/h;
        
        real_fc = real(fc(m));
        reldif = max(abs(f0(m)-real_fc)./max(1,abs(f0(m))));
        if  reldif > tol
            disp('Complex step generates inconsistent function value')
        end
    end
    jacf(m,:)   = gradfm';
end
A = jacf;

N  = length(u0);
f0 =  f(x0, u0, MM, mm, L, g, c, b, k);
M  = length(f0);
jacf = zeros(M,N);

for m = 1:M
    gradfm = zeros(N,1);
    tol = 1e-9; % Used in order to check inconsistency
    h = sqrt(eps);
    for n = 1:N
        uc = complex(u0);
        uc(n) = uc(n) + 1i*h;
        fc = f(x0, uc, MM, mm, L, g, c, b, k);
        gradfm(n)   = imag(fc(m))/h;
        
        real_fc = real(fc(m));
        reldif = max(abs(f0(m)-real_fc)./max(1,abs(f0(m))));
        if  reldif > tol
            disp('Complex step generates inconsistent function value')
        end
    end
    jacf(m,:)   = gradfm';
end
B = jacf;


