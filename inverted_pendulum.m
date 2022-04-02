clc; close all; clear;


m = 0.1; %en kg
l = 0.1; % en m
J = m*l^2;
g = 9.8;
c = 0.01;

%SS: 
%choose X = (x1 =, x2 =) et express Xd = (x1d =, x2d =)
% X = (x1 = theta; x2 = thetad)
% Xd = (x1d = thetad = x2; x2d = thetadd = (1/J)(u+mglsin(x1)-c|x2|x2))
% output y = theta = x1

%simulink

%EQUILIBRIUM: Xd = 0
%donc x2 = 0 et u+mglsin(x1) = 0 et donc sin(x1) = -u/mgl
%for u = 0 : (sin(x1) = 0 ; x2 = 0) -> (x1 = 0(pi); x2 = 0)
%for any u: (sin(x1) = -u/mgl ; x2 = 0) -> u0 = -mglsin(x1)

%LINEARIZED: 
% A = df/dX = (0 1; mglcos(x1)/J  ?)
% ? -c|x2|x2 = -csign(x2)x2² donc en derivant on a ? = -(2c/J)sign(x2)x2

% B = df/du = (0 ; 1/J)
% C = dh/dX = (1  0)
% D = dh/du = (0) 

%around X0 = (0; 0), u0 = -mglsin(0) = 0 et y0 = 0
%A = (0 1; mgl/J  0) unstable ?
%B = (0; 1/J)

%around X0 = (pi; 0), u0 = -mglsin(pi) = 0 et y0 = 0
%A = (0 1; -mgl/J  0) stable ?
%B = (0; 1/J)

%controllability
%Mc = [B, AB]
%Mc = ctrb(A, B)
%controllable = able to control the states (vitesse et position)

%pole place
%around X0 = (0;0), u0 = 0 et y0 = 0 
%Xd = AX + Bu,     Xtilde = X
%y = CX + Du,      ytilde = y
%K = place(A, B, [.....])

%around any X0 = (a;0), u0 = -mglsin(a) et y0 = a
%X_tilde_d = AXtilde + Butilde,     Xtilde = X-X0
%ytilde = CXtilde + Dutilde,      utilde = u-u0
%K = place(A, B, [.....])


A = [0 1;
     m*g*l/J 0;]

B = [0; 
     1/J;]

K = place(A, B, [-1 -2])
