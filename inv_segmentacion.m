function [ y ] = inv_segmentacion( segmentos, despl )
    y = [];
    if (~isempty(segmentos))
        y = segmentos(:, 1);
        for i = 2:size(segmentos, 2)
            y = vertcat(y, segmentos(end-despl:end, i));
        end
    end
end
