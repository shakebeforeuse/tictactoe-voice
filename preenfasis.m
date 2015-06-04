function [ y ] = preenfasis( y, a )
    y = filter([1 -a], 1, y);
end

