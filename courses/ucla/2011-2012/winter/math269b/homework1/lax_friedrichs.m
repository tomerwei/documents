function u = lax_friedrichs(u, a, k, h)
    % (1/k)*(v^{n+1}_m - (1/2)*(v^n_{m+1} + v^n_{m-1})) ...
    %     + (a/(2*h))*(v^n_{m+1} - v^n_{m-1}) = 0
    u = ((1 - a*k/h)/2)*[u(2:end) u(2)] ...
      + ((1 + a*k/h)/2)*[u(end-1) u(1:end-1)];
endfunction