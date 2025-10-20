function signal = apply_reverb(signal, impulse_response)
  % signal = 0;

  % semnalul este de tip mono
  impulse_response = stereo_to_mono(impulse_response);

  % calculez convolutia dintre semnal si impuls
  convolution = fftconv(signal, impulse_response);

  % normalizez 
  signal = convolution/ max(abs(convolution));
end
