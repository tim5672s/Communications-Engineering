function [] = reconstruction()

    T = 1;
    Fg = 1/T;
    Fs = 2*Fg;
    Ts = 1/Fs; 
    
    t = -5*T:0.01:5*T;
    t_h = -5*Ts:0.01:5*Ts;
    arg = t_h ./ Ts;
    h_t = sinc(arg);
    
    xre = conv(h_t,1);

    plot(arg,xre);
    grid
    title('Rekonstruiertes Signal mit doppelter Grenzfrequenz');
    xlabel('t/T');
    ylabel('Amplitude');
    saveas(gcf, 'reconstruction.png');



end
