function [ segmentos ] = segmentacion( y, tam_segmento, despl )
    segmentos = buffer(y, tam_segmento, tam_segmento-despl, 'nodelay');
end

