% Anush Rathod
% 11/15/2021
% ECE 202, Project 1, Phase 2
% Power series expansion of A cos(wt)
% Phase1 - approximating f(t) = 12cos(40t) using truncated power series sums
% with upto 6 non-zero terms  
% Phase 2 - Refining the output

clear; clf;
format shortG;

% -------- Setting up values for t and n --------
tms = linspace(0, 200, 400); %  time array, in ms
t = tms/1000; % converting the time array in sec
n = 0:2:10; % getting 6 even numbers between 0 to 10,
a = 12 .* 40.^n .* (-1).^(n/2)./factorial(n); % calculating coefficient
                                                % a_n for each index n

coef_table = table(n.', a.', 'VariableNames', {'Index n','coefficient a_n'}) 
% making a table for the index with  the corresponding value of a_n

% ------ creating the functions to be plotted ------
% ft = 12cos(40t)

ft1 = a(1)*t.^n(1);
ft2 = ft1 + a(2)*t.^n(2);
ft3 = ft2 + a(3)*t.^n(3);
ft4 = ft3 + a(4)*t.^n(4);
ft5 = ft4 + a(5)*t.^n(5);
ft6 = ft5 + a(6)*t.^n(6);

% ------ plotting the functions --------
plot([0,200], [0,0], 'k', 'LineWidth', 1)
hold on
p1 = plot (tms, ft1, tms, ft2, tms, ft3, tms, ft4, tms, ft5, 'Linewidth', 2);
% plotting the first five functions
p2 = plot (tms, ft6, 'Linewidth', 4);
% plotting the last function
hold off

ax=gca;
ax.FontSize = 16;
xlabel ('time t (ms)', 'Fontsize', 20)
ylabel ('f(t)', 'Fontsize', 20)
title ({'ECE 202, Project 1, Phase 2, Approximating f(t) = 12cos(40t)'...
    'using truncated sums with up to 6 non-zero terms'},...
    'Fontsize',24)
legend ([p1; p2], "up to n = "+n, 'Fontsize', 20, 'Location', 'northeastoutside')
ylim([-15, 15])
grid on
set (gca,'GridAlpha', 0.5)