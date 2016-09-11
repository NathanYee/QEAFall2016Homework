function env = extract_envelope(x)
    smoothing_window_length = 200;
    % extract unsmoothed envelope
    tmp_env = (abs(hilbert(x)));
    % smooth the envelope
    env = conv(tmp_env, ones(smoothing_window_length,1));
    % normalize a little
    env = env'/max(env)*max(x);
    env = env(smoothing_window_length:end);
    
end