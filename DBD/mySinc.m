function[] = mySinc()


    %Variablen
    pi = 3.141;
    T = 1;
    Fg = 1/(2*T);
    Tg = 1/Fg;
    t = (-5*T:0.01:5*T);
    arg = t./T;
    
    %sinc Funktion
    figure(1)
    x_t = sinc(arg);
    plot(t,x_t)
    grid
    title('Sincfunction');
    xlabel('time');
    ylabel('Amplitude x(t)');
    saveas(gcf, 'mySincPlot.png');
    
    %Spektrum
    figure(2)
    f_y = fft(x_t);
    fr = -Fg/2:Fg/length(x_t):Fg/2-Fg/length(x_t);
    plot(fr, fftshift(abs(f_y)));
    grid
    title('Spektrum');
    xlabel('Frequenz [Hz]');
    ylabel('Amplitude X(f)');
    axis ([-0.02 0.02 0 120]);
    saveas(gcf, 'spektrumSinc.png');
    
    %Abtasten doppelte Grenzfrequenz
    figure(3)
    Fs = 2 * Fg;
    Ts = 1 / Fs;
    
    plot(t, x_t);
    hold    
    
    t2 = t(1:100:end);
    sample_x = sinc((t2)./T); %x_t(1:100:end);
    stem(t2,sample_x);
    grid
    
    title('Sincfunction und Abtastwerte');
    xlabel('time');
    ylabel('Amplitude x(t)');
    legend('Sincfunktion','Abtastwerte');
    saveas(gcf, 'Abtastung2fg.png');
    

end
