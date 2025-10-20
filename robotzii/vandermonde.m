function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients

    %x si y trebuie sa fie vectori coloana
    x = x(:);
    y = y(:);
    
    % gradul polinomului
    n = length(x) - 1;
    
    % constr matricea Vandermonde fiecare element se ridica la putere
    vandermonde = x.^(0:n);
    
    % rezolva sist V * coef = y
    coef = vandermonde \ y;
end
