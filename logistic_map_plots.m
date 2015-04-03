%a=[0:0.01:2.9 3:0.0001:3.44949 3.450:0.0001:3.54409 3.545:0.0001:3.56995 3.570:0.0001:3.82843];

% Single value
a = [0.1:0.01:2.9];
res = logistic_map_convergence(a);

f = figure
hold on
for i=1:length(res)
    if (res(i).period > 0)
        plot(res(i).a, [res(i).pts])
    end
end

title('Logistic map convergence');
xlabel('a');
ylabel('final value');
saveas(f, 'l0_convergence.png');


% Bifurcations
a = [2.9:0.0001:3.6];
res = logistic_map_convergence(a);

figure
hold on
for i=1:length(res)
    if (res(i).period > 0)
        plot(res(i).a, [res(i).pts])
    end
end
title('Logistic map bifurcations');
xlabel('a');
ylabel('x');
saveas(f, 'l1_bifurcation.png');

% Everything
% Actually, there is extremely rapid period-doubling
% (ratios of successive bifurcation intervals approaching
%  feigenbaum constant), but we'll just throw all those points up
% there and call it a day

a = 2.5:0.0001:4;
res = logistic_map_convergence(a, 10000, 100);

figure
hold on
for i=1:length(res)
    plot(res(i).a, [res(i).pts])
end
title('Logistic map bifurcation diagram');
xlabel('a');
ylabel('x');
saveas(f, 'l2_entire.png');

