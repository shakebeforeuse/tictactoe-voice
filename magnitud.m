function [ M ] = magnitud( segmentos, ventana )
    switch ventana
        case 'rectangular'
            M = abs(sum(segmentos .* repmat(rectwin(size(segmentos, 1)), 1, size(segmentos, 2))));
        case 'hamming'
            M = abs(sum(segmentos .* repmat(hamming(size(segmentos, 1)), 1, size(segmentos, 2))));
        case 'hanning'
            M = abs(sum(segmentos .* repmat(hanning(size(segmentos, 1)), 1, size(segmentos, 2))));
    end
end