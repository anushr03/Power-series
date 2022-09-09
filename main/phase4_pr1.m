% Anush Rathod
% 11/17/2021
% ECE 202, Project 1, Phase 4
% Power series expansion of A cos(wt)
% Collaborator - Ritvik Verma (Lines 37-54)
% Phase1 - approximating f(t) = 12cos(40t) using truncated power series sums
% with upto 6 non-zero terms
% Phase 2 - Refining the output
% Phase 3 - Making the script robust
% Phase 4 - Making the script more efficient by using FOR loop to plot
% function

clear; clf;
format shortG;

% -------- Setting up values for t and n --------
tmin = 0;   % start time 
tmax = 200; % end time 
N = 400;    % intervals
tms = linspace(tmin, tmax, N+1); %  time array, in ms
t = tms/1000; % converting the time array, in sec

% initializing variables
A = 12; % amplitude
w = 40; % angular frequency, in rad/s
term = 6; % number of non_zero terms

n = 0:2:(term-1)*2; % getting 6 even numbers starting from 0,
a = A .* w.^n .* (-1).^(n/2)./factorial(n); % calculating coefficient
                                                % a_n for each index n

coef_table = table(n.', a.', 'VariableNames', {'Index n','coefficient a_n'}) 
% making a table for the index with  the corresponding value of a_n

% ------ Creating the functions to be plotted and plotting ------

f = zeros(1,1+N); % inititializing an array of zeros with same dimensions as
                  % time of array. Will store the function values 
p = zeros(term, 1); % array to help keep track of plots

plot([tmin,tmax], [0,0], 'k', 'LineWidth', 1)
hold on
for i = 1:term
    f = f + a(i)*t.^n(i);
    if i ~= term
        p(i) = plot (tms, f, 'Linewidth', 2);
    else
        p(term) = plot (tms, f, 'Linewidth', 4); % plotting the last
                                                      % with twice the 
                                                      % thickness
    end
end
hold off
% ------ cphase 3 old script for checking purposes ------
% ft = 12cos(40t)

ft1 = a(1)*t.^n(1);
ft2 = ft1 + a(2)*t.^n(2);
ft3 = ft2 + a(3)*t.^n(3);
ft4 = ft3 + a(4)*t.^n(4);
ft5 = ft4 + a(5)*t.^n(5);
ft6 = ft5 + a(6)*t.^n(6);

check_phases = sum(abs(f-ft6)) % should be 0

% ------ graph attributes --------

ax=gca;
ax.FontSize = 16;

xlabel ('time t (ms)', 'Fontsize', 20)
ylabel ('f(t)', 'Fontsize', 20)

s1 = sprintf('Approximating f(t) = %ucos(%ut)', A, w);
s2 = sprintf('using truncated sum up to %u non-zero terms', term);

title ({'ECE 202, Project 1, Phase 4,' s1,...
    s2}, 'Fontsize',24)
legend (p, "up to n = "+n, 'Fontsize', 20, 'Location', 'northeastoutside')
ylim([-1.25*A 1.25*A])
grid on
set (gca,'GridAlpha', 0.5)