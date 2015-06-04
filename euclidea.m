function [ dist ] = euclidea( x, y )
    dist = sqrt(sum((x-y).^2));
end
