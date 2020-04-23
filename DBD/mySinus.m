function [] = mySinus()
    
    pi = 3.141;
    k = 1;
    t = (0 : 0.01 : k*2*pi);
    y = 2*sin(t);
    
    figure(1)
    plot(t,y);
    title('2*Sinus(2*k*pi)')
    xlabel('t');
    ylabel('Amplitude');
    saveas(gcf, 'mysinus.png');
    
    figure(2)
    histogram(y);
    title('Histogramm der Amplituden des Sinus');
    xlabel('Amplituden');
    ylabel('Anzahl');
    saveas(gcf, 'histogramm sinus.png');
    

end

