function [ g, x, y ] = minimax( m, jugador )
    g = ganador(m);
    x = -1;
    y = -1;
    
    if (g == inf)
        if (jugador == 1)
            g = -inf;
            for i=1:3
                for j=1:3
                    if (m(i, j) == 0)
                        mc = m;
                        mc(i, j) = jugador;

                        puntos = minimax(mc, -1*jugador);

                        if (puntos > g)
                            g = puntos;
                            x = i;
                            y = j;
                        end
                    end
                end
            end
        else
            for i=1:3
                for j=1:3
                    if (m(i, j) == 0)
                        mc = m;
                        mc(i, j) = jugador;

                        puntos = minimax(mc, -1*jugador);

                        if (puntos < g)
                            g = puntos;
                            x = i;
                            y = j;
                        end
                    end
                end
            end
        end
    end
end

