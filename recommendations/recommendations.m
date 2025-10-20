function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.

  % citirea matricei
  mat = read_mat(path);

  % procesarea cu ajutorul functiei preprocess
  preprocessed_mat = preprocess(mat, min_reviews);

  % folosirea svd
  [U S V] = svds(preprocessed_mat, num_features);
  V = V';
  [n m] = size(V);

  % sortarea temelor
  sim = zeros(1, m);
  for i = 1: m 
    sim(i) = cosine_similarity(V(:, liked_theme), V(:,i));
  endfor

  % extragere index
  [~, idx] = sort(sim, 'descend');
  recoms = idx(2:num_recoms+1);
end
