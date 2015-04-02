% May, R. M. (1976). Simple mathematical models with
% very complicated dynamics. Nature, 261(5560), 459-467.

% X_t+1 = a*X_t*(1-X_t)

a = 0.1:0.0001:4;
iters = 10000;
n_comp = 100;
min_val = -1e4;
max_val = 1e4;
% could vectorize xn and compute all at once i.e.
%xn = rand(size(a))
%xn = a.*xn.*(1-xn)

pts = zeros(length(a), iters);
for i=1:length(a)
    xn = rand(1);
    for x=1:iters
        xn = a(i)*xn*(1-xn);
        if xn < min_val || xn > max_val
            x = 0;
            break
        end
        pts(i, x) = xn;
    end
    if (x == iters) % it didn't blow up
        series = pts(i,end-n_comp+1:end);
        [period, pts] = isperiodic(series);
        res(i).a = a(i);
        res(i).period = period;
        res(i).pts = pts;
    end
end

%figure
%hold on
%for i=1:length(res)
%    plot(res(i).a, res(i).pts)
%end