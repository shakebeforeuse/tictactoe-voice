function [ tcc ] = cruces_por_cero( segmentos, ventana )
    switch ventana
        case 'rectangular'
            ventana = rectwin(size(segmentos, 1)-1);
        case 'hamming'
            ventana = hamming(size(segmentos, 1)-1);
        case 'hanning'
            ventana = hanning(size(segmentos, 1)-1);
    end
    
    tcc = mean(.5 * abs(sign(segmentos(2:end, :)) - sign(segmentos(1:end-1, :))) .* repmat(ventana, 1, size(segmentos, 2)));
end