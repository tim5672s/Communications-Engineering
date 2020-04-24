function[] = myWurzelNyquist()
%Parameter 
SPAN = 10;
SPS = 8;

%Definition t und t_neu
t = -SPAN/2:1/SPS:SPAN/2;
t_neu = -SPAN:1/SPS:SPAN;

%Erzeugen Wurzel-Nyquist-Impuls
    WNI = rcosdesign(0.5, SPAN, SPS);
%Faltung der impulse
    FWNI = conv(WNI,WNI);
%Graphen
    figure(1)
    plot(t, WNI);
    grid
    title('Wurzel-Nyquist-Impuls');
    xlabel('t/T');
    ylabel('Amplitude');
    saveas(gcf, 'Wurzel-Nyquist-Impuls.png');
    figure(2)
    plot(t_neu, FWNI);
    grid
    title('Impulsantwort des Gesamtsystems');
    xlabel('t/T');
    ylabel('Amplitude');
    saveas(gcf, 'Impulsantwort des Gesamtsystems.png');
end
