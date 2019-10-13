% This demo shows calculation of vessel tortuosity index (VTI) for a simulated sinusoidal curve.
% Amplitude and frequency of the curve can be adjusted to obtain more curve and compare the result.
% This is an example and in real applications VTI value is generally much smaller for vessels (VTI < 10).

% Please cite the following paper if you are using this code :)
% Khansari, et al. "Method for quantitative assessment of retinal vessel tortuosity in % optical coherence 
% tomography angiography applied to sickle cell retinopathy." Biomedical optics express 8.8 (2017):3796-3806.

% written by Maz M. Khansari (summer 2017)
% maziyar.khansari@gmail.com

%% create a sinusoidal wave
clearvars, close, clc

amp = 2; % apmlitude
x = (0:1/50:5); % time
f = 1; % frequency
y = amp*sin(2*pi*f*x); % sinusoidal wave

%% compute tortuosity of the simulated wave 
% note is_show = 1, hence a plot will be generated in which yellow circles show critical points, 
% red circles show inflection points, blue lines are connecting adjacent inflection points to 
% calculate local distance measure. Dashed black lines show tangent lines to the curve at every
% pixel. Standard deviation of angel difference between each line and
% x-axis was used in VTI formula.
[VTI, sd, mean_dm, num_inflection_pts, num_cpts, l_arch, l_cord] = vessel_tortousity_index(x,y,1);
fprintf('VTI: %2.2f\n', VTI)
fprintf('centerline length: %2.2f\n', l_arch)
fprintf('mean distance measure: %2.2f\n', mean_dm)
fprintf('centerline chord length: %2.2f\n', l_arch)
fprintf('number of critical points: %2.2f\n', num_cpts)
fprintf('number of inflection points: %2.2f\n', num_inflection_pts)

%% add legend & title
hold on
h = zeros(3, 1);
h(1) = plot(NaN,NaN,':k','LineWidth',2);
h(2) = plot(NaN,NaN,'or','LineWidth',2);
h(3) = plot(NaN,NaN,'og','markers',10,'LineWidth',2);  
lgd = legend(h,'Tangent lines','Inflection points','Critical points');
title(lgd,'VESSEL TORTUOSITY INDEX (VTI)')
title('Simulated Sinusoidal Curve & Parameters Used for VTI Calculation')
