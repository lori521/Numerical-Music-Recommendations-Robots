function signal = high_pass(signal, fs, cutoff_freq)
  % signal = 0;

  n = length(signal);

  % calculul transformatei fourier
  fourier = fft(signal);

  % calcularea tuturor frecventelor de semnal posibile
  all_freq = (0:n-1)*fs/n;

  % formare masca
  mask = all_freq >= cutoff_freq;
  half_fs = fs/2;
  half_mask_1 = mask .* (all_freq <= half_fs);
  half_mask_2 = mask(end:-1:1) .* (all_freq > half_fs);
  mask = half_mask_1 + half_mask_2;

  % produs intre transf fourier a semnalului si masca
  hadamard_prod = fourier .* mask';

  % calcul pt inversa transf fourier
  filtered_signal = ifft(hadamard_prod);

  % normalizarea semnalului 
  filtered_signal = filtered_signal / max(abs(filtered_signal));

  % returnarea semnalului
  signal = filtered_signal;
end