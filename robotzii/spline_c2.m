function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	n = length(x);
	% nr de intervale de tip xi, xi+1
	nr_of_interv = n - 1;
	% nr de coef
	nr_of_coef = 4*nr_of_interv;
	A = sparse(nr_of_coef, nr_of_coef);
	b = zeros(nr_of_coef, 1);

	% TOOD 1: si(xi) = yi, i = 0 : n - 1
	% aplic formula pe fiecare interval
	row = 1;
	% incep de la 1 nu de la 0 
	for i = 1 : nr_of_interv
		col = 4*(i-1) + 1;
		% pt a_i
		A(row, col) = 1;
		b(row) = y(i);
		row = row + 1;
	endfor

	% ma sigur ca s-au format ultimii indici care nu vor intra in for cum trebuie folosind conditia de mai jos
	% TODO 2: s_n-1(xn) = yn
	dist = x(n) - x(n-1);
	col = 4 * (nr_of_interv - 1) + 1;
	% setez a_(n-1)
	A(row,col) = 1;
	% setez b_(n-1) * dist
	A(row,col + 1) = dist;
	% setez c_(n-1) * dist^2
	A(row,col + 2) = dist^2;
	% setez d_(n-1) * dist^3
	A(row,col + 3) = dist^3;
	b(row) = y(n);
	row = row + 1;


	for i = 1 : nr_of_interv - 1
		dist = x(i+1) - x(i);

		% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
		% formez A complet
		col = 4*(i-1)+1;
		% a_i
		A(row, col) = 1;
		% b_i*dist
		A(row, col+1) = dist;
		% c_i*dist^2
		A(row, col+2) = dist^2;
		% d_i*dist^3
		A(row, col+3) = dist^3;
		% -a_(i+1)
		A(row, col+4) = -1;
		b(row) = 0;
		row = row + 1;

		% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
		% formarea derivatelor de ordinul 1
		col = 4*(i-1)+2;
		A(row, col) = 1;
		A(row, col+1) = 2*dist;
		A(row, col+2) = 3*dist^2;
		A(row, col+4) = -1;
		b(row) = 0;
		row = row + 1;


		% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
		% formarea derivatelor de ordinul 2
		col = 4*(i-1)+3;
		A(row, col) = 2;
		A(row, col + 1) = 6*dist;
		A(row, col+4) = -2;
		b(row) = 0;
		row = row + 1;


	endfor

	% TODO 6: s0''(x0) = 0
	A(row, 3) = 2;
	b(row) = 0;
	row = row + 1;

	% TODO 7: s_n-1''(x_n) = 0
	dist = x(n)-x(n-1);
	col = 4*(nr_of_interv-1)+3;
	A(row, col) = 2;
	A(row, col+1) = 6*dist;
	b(row) = 0;

	% Solve the system of equations
	coef = A\b;
end