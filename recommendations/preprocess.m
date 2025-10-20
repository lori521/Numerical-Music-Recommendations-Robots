function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [n m] = size(mat);
  reduced_mat = [];

  % nr tuturor review-urilor de pe o linie este mai mic decat min_reviews atunci linia nu se adauga in reduced_mat
  for i = 1:n

    nr_of_rev = 0;
    for j = 1:m
      if (mat(i,j) != 0)
      nr_of_rev = nr_of_rev + 1;
      endif
    endfor
  
    if nr_of_rev >= min_reviews
    reduced_mat =[reduced_mat;  mat(i,:)];
    endif

  endfor
end
