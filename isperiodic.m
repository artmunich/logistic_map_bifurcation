function [ period, pts ] = isperiodic( x )
%ISPERIODIC Is there a cycle in x?
%   Return period if so (or 0 otherwise),
%   and pts if periodic (or empty vector)
x = x';
% Naiive cycle detection don't plan to have a ton of points.
% Approximate also
apx = 1e-8; % numbers w/in this delta are equal
            % obv this can be a problem when we have chaotic processes

period = 0;
pts = x';
            
for i=1:floor(length(x)/2)
    s = max(abs(x - circshift(x, i)) - apx, 0);
    if (sum(s) == 0)
        period = i;
        pts = x(1:i);
        break
    end
end
end

