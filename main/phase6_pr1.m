% Anush Rathod
% 11/17/2021
% ECE 202, Project 1, Phase 6
% Power series expansion of A cos(wt)
% Phase1 - approximating f(t) = 12cos(40t) using truncated power series sums
% with upto 6 non-zero terms 
% Phase 2 - Refining the output
% Phase 3 - Making the script robust
% Phase 4 - Making the script more efficient by using FOR loop to plot
% function
% phase 5 - Adding user defined inputs
% phase 6 - Answering various questions regarding Taylor Series

clear; clf;
format shortG;

% -------- Setting up values for t and n --------

tmin = input("Enter the start time in ms: ");   % start time
tmax = input("Enter the end time in ms: "); % end time 
N = input("Enter the number of points for the graph: ");    % intervals
tms = linspace(tmin, tmax, N+1); %  time array, in ms
t = tms/1000; % converting the time array, in sec

% initializing variables
A = 12; % amplitude
w = 40; % angular frequency, in rad/s
term = input("Enter the total number of non_zero terms - "); % number of non_zero terms

n = 0:2:(term-1)*2; % getting 6 even numbers starting from 0,
a = A .* w.^n .* (-1).^(n/2)./factorial(n); % calculating coefficient
                                            % a_n for each index n

coef_table = table(n.', a.', 'VariableNames', {'Index n','coefficient a_n'}) 
% making a table for the index with the corresponding value of a_n

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
% ------ phase 3 old script for checking purposes and a new check ------
% ft = 12cos(40t)
if term == 6
    ft1 = a(1)*t.^n(1);
    ft2 = ft1 + a(2)*t.^n(2);
    ft3 = ft2 + a(3)*t.^n(3);
    ft4 = ft3 + a(4)*t.^n(4);
    ft5 = ft4 + a(5)*t.^n(5);
    ft6 = ft5 + a(6)*t.^n(6);
    check_phases = sum(abs(f-ft6)) % should be 0
end

diff = abs(A*cos(w*t) - f); % array of difference between the actual function
                             % and the function we have
average_deviation = sum(diff)/length(diff) % finding the std deviation
                                           % by summing the array and
                                           % dividing by array's length

% ------ graph attributes --------

ax=gca;
ax.FontSize = 16;

xlabel ('time t (ms)', 'Fontsize', 20)
ylabel ('f(t)', 'Fontsize', 20)

s1 = sprintf('Approximating f(t) = %ucos(%ut)', A, w);
s2 = sprintf('using truncated sum up to %u non-zero terms', term);
s3 = sprintf('of standard deviation of %g', average_deviation);

title ({'ECE 202, Project 1, Phase 6,' s1,...
    s2, s3}, 'Fontsize',24)
legend (p, "up to n = "+n, 'Fontsize', 20, 'Location', 'northeastoutside')
ylim([-1.25*A 1.25*A])
grid on
set (gca,'GridAlpha', 0.5)

% As I look at the graph for phase5, its still similar to the graph for
% phase2, phase3 and phase4, with similar graph line and axis limits. 
% Thus the visual check is correct.

% ------- Phase 6 Answers -------
% a) the smallest number of non-zero terms is 11. Using 11 gives me an avg
% deviation of less that 0.05. 

% b) by plotting 400 terms, the avg deviation was 0.031715 and with 800
% terms the avg deviation was 0.031309. The values are still extremely
% close to one another, thus verifying the condition that doubling the no.
% of terms being plotted will not change the avg deviation by a lot.

% c) I believe that the deviation will get higher once the initial times
% becomes -200. I think so because then the total deviation will add up
% from the left and the right side. That is from -200 to 0 and from 0 to
% 200.

% d) My prediction was wrong. The avg deviation was pretty similar to the
% avg deviation in (a) and (b). I think the reason for this was because it
% is a cos function, the graph will be a mirror image from -200 to 0 and 0
% to 200. This could be the reason why the avg deviation did not really
% change from parts (a) and (b)

% e) I think the avg deviation will increase because the Taylor series will
% then start expanding from t0=200ms and not t0=0. 

% f) After 200ms, the graph did not plot properly and it seems like it is
% going to a very high number. I think the number of non zero terms was not
% enough and therefore the graph looks like that with a very high avg
% deviation number. I think the significance of choosing t0=0 is so that we
% can get the expansion of the Taylor series with less number of non-zero
% terms

% g) The lowest number of non-zero terms is 22 here. It seems to be exactly
% double of the non-zero terms in (a). So by doubling the end time, the
% number of non-zero terms also seems to double.