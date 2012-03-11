function test_convergence(a, T, u0, scheme, scheme_name, hs, k_of_h)

    e = zeros([1 length(hs)]);

    for i = 1:length(hs)
        h = hs(i);
        M = round(1/h);
        h = 1/M;
        k = k_of_h(h);
        N = ceil(T/k);
        k = T/N;
        x = (0:M)/M;
        u = u0(x);
        for n = 1:N
            u = scheme(u, a, k, h);
        endfor
        e(i) = sqrt(h) * norm((u0(mod(x - a*T, 1)) - u)(1:end-1), 2);
    endfor

    p = polyfit(log(hs), log(e), 1);
    plot(log(hs), log(e), "o", log(hs), p(1)*log(hs) + p(2));
    title(["convergence plot for " scheme_name]);
    legend("L2error vs h", [num2str(exp(p(2))) " * h^" num2str(p(1))], "location", "northwest");
    xlabel("log(h)");
    ylabel("log(L2error)");

endfunction