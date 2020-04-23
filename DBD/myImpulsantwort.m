function[h_t] = myImpulsantwort()

    T = 1;
    Fg = 1/T;
    Fs = 2*Fg;
    Ts = 1/Fs;     
    
    %Ts = 0,5 * T
    
    t = -5*Ts:0.01:5*Ts;
    arg = t ./ Ts;
    
    h_t = sinc(arg);
    
    plot(arg, h_t);
    grid ;
    grid minor;
    title('Impulsantwort h(t)');
    xlabel('t/T');
    ylabel('Amplitude h(t)');
    saveas(gcf, 'Impulsantwort_1d.png');
end