function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  % se citeste matricea folosind functia csvread fara prima coloana si prima linie
  mat = csvread(path, 1, 1);
end

