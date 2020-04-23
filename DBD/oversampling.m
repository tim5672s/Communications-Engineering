function[] = oversampling()
    T = 1;
    t = -5*T:0.01:5*T;
    Ts = 0.5*T;
    
    %Quellensignal
    y = t/T;
    x = sinc(y);
    
    %Impulsantwort
    z = t/Ts;
    h_t = sinc(z);
    
    %4fache Abtastfrequenz
    t2 = t(1:50:end);
    sample_x = sinc((t2)./T);
    
    %Graphen
    figure(1)
    plot(t,x);
    hold
    stem(t2,sample_x);
    title('Quellensignal und 4-fach Abtastung');
    xlabel('t');
    ylabel('Amplitude');
    legend('Quellensignal','Abtastung');
    grid
    saveas(gcf, 'Quelle4malSample.png');
    
    
    %Rekonstruktion
    figure(2)
    x_samples = sample_x(1, 10:12);
    x_samples = upsample(x_samples, 50);
    
    xre = conv(x_samples, h_t);
    erg = xre(1,50:1050);
    plot(t,x);
    hold
    plot(t,erg);
    grid 
    grid minor
    title('Quellensignal und Rekonstruiertes Signal mit 4-fachGrenzfrequenz');
    xlabel('t/T');
    ylabel('Amplitude');
    legend('Quellensignal','rekonstruiertes Signal')
    saveas(gcf, 'QuelleRekonstr.png');

    %Fehler
    figure(3)
    e_abs = x-xre(1,50:1050);
    plot(t,e_abs);
    title('Absolute Fehler der Signalkonstruktion');
    xlabel('t/T');
    ylabel('Fehler Absolut');
    grid
    grid minor
    axis([-1 1 -0.05 0.05])
    saveas(gcf, 'AbsolutFehler.png');
    
    
    
    


end