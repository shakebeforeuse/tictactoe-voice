function [ gana ] = ganador( matriz )
    gana = inf;
    
    posibilidades = [sum(matriz) sum(matriz, 2)' ...
        sum([matriz(1, 1) matriz(2, 2) matriz(3, 3)]) ...
        sum([matriz(1, 3) matriz(2, 2) matriz(3, 1)])];
    
    ind = find(abs(posibilidades) == 3);
    
    if (~isempty(ind))
        gana = posibilidades(ind(1)) / 3;
    else
        if (nnz(matriz) == 9)
            gana = 0;
        end
    end
end