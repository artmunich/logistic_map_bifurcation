function [ res ] = logistic_map_convergence( a, iters, n_comp )
%LOGISTIC_MAP_CONVERGENCE Find convergence and periodicity for
%   logistic map w/ parameters [a]^n_i=1 and one(!!) random initial
%   condition for each a

% May, R. M. (1976). Simple mathematical models with
% very complicated dynamics. Nature, 261(5560), 459-467.

% X_t+1 = a*X_t*(1-X_t)

if (nargin < 3)
    n_comp = 1024;
end
if (nargin < 2)
    iters = 50000;
end

% could vectorize xn and compute all at once i.e.
xn = rand(size(a));

pts = zeros(length(a), iters);
pts(:,1) = rand(size(a));
for x=2:iters
    pts(:,x) = a'.*pts(:,x-1).*(1-pts(:,x-1));
end

%figure
%hold on
for i=1:length(a)
    series = pts(i,end-n_comp+1:end);
    if (~isfinite(series(end) ))
        continue; % it blew up
    end
    [period, ps] = isperiodic(series);
    %plot(a(i), [ps]);
    res(i).a = a(i);
    res(i).period = period;
    res(i).pts = ps;
end

end

