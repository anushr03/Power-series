% Anush Rathod
% 11/05/2021
% ECE 202, Project 1, Phase 1
% Project description - Power series expansion of A cos(wt)
% Phase1 - Getting a simple script working for approximating f(t) = 12cos(40t)
% using truncated power series sum with up to 6 non-zero terms

clear; clf;
format shortG;

% -------- Setting up values for t and n --------
t = linspace(0, 0.2, 400); %  time array, in sec
n = 0:2:10; % getting 6 even numbers between 0 to 10,

a = 12 .* 40.^n .* (-1).^(n/2)./factorial(n)

% ------ creating the functions to be plotted ------
% ft = 12cos(40t)

ft1 = a(1)*t.^n(1);
ft2 = ft1 + a(2)*t.^n(2);
ft3 = ft2 + a(3)*t.^n(3);
ft4 = ft3 + a(4)*t.^n(4);
ft5 = ft4 + a(5)*t.^n(5);
ft6 = ft5 + a(6)*t.^n(6);

% ------ plotting the functions --------

plot (t, ft1, t, ft2, t, ft3, t, ft4, t, ft5, t, ft6, 'Linewidth', 3);
xlabel ('time t (s)', 'Fontsize', 20)
ylabel ('f(t)', 'Fontsize', 20)
title ({'ECE 202, Project 1, Phase 1, Approximating f(t) = 12cos(40t)'...
    'using truncated power series sum with up to 6 non-zero terms'},...
    'Fontsize',24)
ylim([-15, 15])
grid on
set (gca,'GridAlpha', 0.4)
