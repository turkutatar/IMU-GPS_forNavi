clc
clearvars
close all

Fs = 1000;
Ts = 1/Fs;
load_system('CIP_LQR_Servo');
set_param('CIP_LQR_Servo', 'Solver', 'ode1', 'FixedStep', ['1/' num2str(Fs)]);


% Inverted Cart - Pendulum
m = 1;
M = 5;
L = 2;
g = 9.81;
b = 0.5;
c = 0.5;
k = 0;

% I will explain this line to you later!
[A, B] = f_inv_cart_pend_jacobian_complex_step(@f_inv_cart_pend, zeros(4,1), 0, M, m, L, g, c, b, k);
C = [1 0 0 0;
     0 1 0 0];
D = [0;0]; 

ns = size(A,1);

%% LQR Servo (DO NOT WORRY ABOUT HERE FOR NOW)
% Augment with an Integrator
Cp   = [1 0 0 0]; % Select x for reference following
Cr   = [0 1 0 0;0 0 1 0;0 0 0 1];
Cy   = [Cp; Cr];
Aaug = eye(ns+1)+[0 Cp; zeros(4,1) A]*Ts;
Baug = [0; B]*Ts;
Q = diag([10 10 1 1 0]);
R = 0.01;

GG = dlqr(Aaug, Baug, Q, R);
% damp(eig(Aaug-Baug*GG));

gz = GG(:,1)
gy = GG(:,2)
gr = GG(:,3:5)

%% Observer Design
% ATTENTION STUDENTS!
% In the simulation only the plant is in continuous-time
% All the control and measurements are in discrete-time
% So you need to design a discrete-time observer
% Look in MATLAB Help. The answer is there!
% Here is how you start, i.e. by descretizing the controller
Hc = ss(A,B,C,D);
Hd = c2d(Hc, Ts, 'tustin');
F = Hd.a;
G = Hd.b;
H = C;
N = D;

% Your code goes here!! (H observer design)
% K=place(F',H',[0.90, 0.91,  0.92, 0.93]).'
% eig(F-K*H)

%LQR DESİGN 
Q=diag([1e-5 1e-5 1e-8 1e-8]);
R = diag([1e-2 1e-2]);

K=dlqr(F',H',Q,R)';

load_system('CIP_LQR_Servo');
set_param('CIP_LQR_Servo/Measurement Noise','Variance', mat2str(diag(R)));