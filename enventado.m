function [ segmentos_enventados ] = enventado( segmentos, ventana )
    switch ventana
        case 'rectangular'
            segmentos_enventados = segmentos .* repmat(rectwin(size(segmentos, 1)), 1, size(segmentos, 2));
        case 'hamming'
            segmentos_enventados = segmentos .* repmat(hamming(size(segmentos, 1)), 1, size(segmentos, 2));
        case 'hanning'
            segmentos_enventados = segmentos .* repmat(hanning(size(segmentos, 1)), 1, size(segmentos, 2));
    end
end
