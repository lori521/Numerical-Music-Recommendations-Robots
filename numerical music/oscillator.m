function x = oscillator(freq, fs, dur, A, D, S, R)
  x = 0;

  % crearea time vector
  t = 0:1/fs:dur-1/fs;

  % crearea undei sin cu formula data
  sin_wave = sin(2*pi*freq*t);

  % calculul nr de sample-uri pt fiecare
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  sustain_samples = length(t) - attack_samples - decay_samples - release_samples;

  %  calcularea punctelor 4, 5, 6, 7
  attack_env = linspace(0, 1, attack_samples);
  decay_env = linspace(1, S, decay_samples);
  sustain_env = S * ones(1, sustain_samples);
  release_env = linspace(S, 0, release_samples);

  % concatenarea pt envelope
  final_envelope = [attack_env, decay_env, sustain_env, release_env];
  final_envelope = [final_envelope, zeros(1, length(sin_wave) - length(final_envelope))];
  
  % formarea produsului Hadamard
  x = (sin_wave .* final_envelope)';

end
