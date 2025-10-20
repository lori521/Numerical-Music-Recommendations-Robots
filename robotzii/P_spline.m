function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
	n = length(x_interp);
	nr_of_interv = n-1;

	% parcurg tot x_interp
	for i = 1:n
		x_i = x_interp(i);

		% gasesc intervalul in care se incadreaza x_i
		for j = 1:nr_of_interv
			if x_i >= x(j) && x_i <= x(j+1)
				break;
			endif
		endfor

		% extrag coeficientii intervalului respectiv
		a_i = coef(4*(j-1)+1);
		b_i = coef(4*(j-1)+2);
		c_i = coef(4*(j-1)+3);
		d_i = coef(4*(j-1)+4);

		% trec in interval valoarea polinomului in x_i
		y_interp(i) = a_i + b_i*(x_i - x(j)) + c_i*(x_i - x(j))^2 + d_i*(x_i - x(j))^3;
	endfor
	
end