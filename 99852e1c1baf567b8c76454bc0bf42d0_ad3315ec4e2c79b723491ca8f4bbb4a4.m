clc
clear all
close all

% Motor characteristics:
km=; % Motor constant (N.m/A)
Ra=; % Armature resistance (Ohms)
V=; % Input voltage (V)

% Solar panel characteristics:
m=; % Mass (kg)
L=; % Length (m)
w=; % Width (m)
I=; % Mass moment of inertia about pivot point (kg.m^2), based on m and L.

g=; % Gravitational acceleration (m/s^2)

% Worm-gear characteristics:
N=; % Gear ratio

% Wind/drag force characteristics:
v_wind=; % Wind speed (m/s)
Cd=; % Drag coefficient
rho=; % Mass density of air (kg/m^3)

% Nonlinear model coefficients:
B1=;
B2=;
B3=;
B4=;
B5=;

% Definition of the nominal configuration about which to linearize:
theta_bar=*pi/180; % Nominal solar panel angle (degrees converted to rads)
v_bar=; % Nominal source solve (V) - computed based on nominal solar panel angle

% Linearized model coefficients:
C1=;
C2=;
C3=;
C4=;