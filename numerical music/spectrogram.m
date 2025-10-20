function [S f t] = spectrogram(signal, fs, window_size)
  S = 0;
  f = 0;
  t = 0;

  % extrag nr de semnale
  n = length(signal);
  % calcularea numarului de ferestre
  nr_of_windows = floor(n/window_size);

  % formarea spectogramei cu dimensiunile corecte
  S = zeros(window_size, nr_of_windows);

  % pentru fiecare fereastra se aplica transformata Hann
  for i = 1 : nr_of_windows
    inc = (i - 1) * window_size + 1;
    sf =  i * window_size;
    window = signal(inc:sf);

    transf_hann = window .* hanning(window_size);

    % se formeaza transformata fourier
    fourier = fft(transf_hann, 2 * window_size);

    % se adauga pe coloana specifica a spectogramei
    S(:, i) = abs(fourier(1:window_size));
  endfor

  % calculul vectorului de frecventa
  f = (0:window_size-1)' * (fs / (2 * window_size));

  % calculul vectorului de timp
  t = (0:nr_of_windows-1)' * (window_size / fs);
end