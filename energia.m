function [ E ] = energia( segmentos, ventana )
    switch ventana
        case 'rectangular'
            E = sum(segmentos .* repmat(rectwin(size(segmentos, 1)), 1, size(segmentos, 2))).^2;
        case 'hamming'
            E = sum(segmentos .* repmat(hamming(size(segmentos, 1)), 1, size(segmentos, 2))).^2;
        case 'hanning'
            E = sum(segmentos .* repmat(hanning(size(segmentos, 1)), 1, size(segmentos, 2))).^2;
    end
end