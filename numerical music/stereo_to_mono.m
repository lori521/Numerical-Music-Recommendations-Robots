function mono = stereo_to_mono(stereo)
  mono = stereo;

  % calculeaza media pe fiecare linie
  mono = mean(stereo, 2);

  % Normalize
  mono = mono / max(abs(mono));
end