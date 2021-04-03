% data set of n
n = 0:127;
% frequencies and phase shifts
omega = [0.17*pi, 2.4*pi, -1.6*pi, 0.125*pi, 0.125*pi, 0.32*pi, 0.02*pi, pi, 1.02*pi, 0.98*pi, 1, 0.3];
phi = [0, 0, 0, 0, 1.4, 0, 0, 0, 0, 0, 0, 0.3];
for i = 1:12
    % cosine function
    xi = cos(omega(i)*n + phi(i));
    % save and retrieve
    savetxt = ['x',num2str(i),'[n].mat'];
    save(savetxt, 'xi');
    clear xi;
    load(savetxt, 'xi');
    % show the desired elements of the functions
    a = [i, xi(7), xi(12), xi(112), xi(128)];
    disp(a);
    % plot the discrete function
    figure();
    stem(n, xi);
    xlabel('n');
    ystr = ['x',num2str(i),'[n]'];
    ylabel(ystr);
    title([ystr, ' vs n']);
    grid on
    axis tight
    % find fundamental period
    [pks,locs] = findpeaks(xi,n);
    bool = 0;
    for a = 2:length(pks)
        if(pks(1) == pks(a))
            disp([ystr, ' is periodic']);
            fund_per = locs(a)-locs(1);
            fp_dsp = ['Fundamental Period of ', ystr, ' is: ', num2str(fund_per)];
            disp(fp_dsp);
            bool = 1;
            break;
        end
    end
    if(bool == 0)
        disp([ystr, 'is not periodic']);
    end
    bool = 0;
end
