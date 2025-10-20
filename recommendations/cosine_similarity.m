function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.

  % copie pt A si B
  copy_of_a = A;
  copy_of_b = B;

  % normele la care se imparte in formula
  norm_a = norm(A);
  norm_b = norm(B);

  % calculez produsul scalar
  prod_a_b = dot(copy_of_a, copy_of_b);

  % aplicarea formulei
  similarity =  prod_a_b / (norm_a * norm_b);
end

