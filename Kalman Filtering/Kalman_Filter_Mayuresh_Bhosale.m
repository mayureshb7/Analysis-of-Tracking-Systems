% This Program is written by Mayuresh Bhosale that depicts Kalman Filter
% applied to 1-D and 2-D data

clc
clear all
close all
%1-D Data & Plot
Adata = importdata('1D-data.txt');
figure(1)
plot(Adata,'b');
xlabel('Number of Data Points');
ylabel('Position Reading');
title('1-D position data');
hold on

%Initializing
x_t = [0; 0]; %Position and Velocity Initialization
Q_t = [0 1]; %Dynamic Noise
Y_t = 0; %Measurement
R_t = 1; %Measurement Noise
S = [1 0; 0 1]; % State Covariance Matrix
Q_var = [0 0; 0 0.0001]; %Dynamic noise Covariance Matrix
R_var = 100000; %Measurement Covariance Matrix
Phi = [1 1; 0 1]; %State transition Matrix
M = [1 0]; %Observation Matrix
I = eye(2); %Identity matrix

%Equations for Kalman Filtering

for i = 1:height(Adata)
    %Predict next state
    x_tt1 = Phi*x_t;
    %Predict Next State Covariance
    S_tt1 = Phi*S*Phi'+Q_t;
    %Obtain Measurements
    Y_t = Adata(i);
    %Calculating Kalman Gain
    K_t = S_tt1*M'* inv(M*S_tt1*M' + R_var);
    %

end
