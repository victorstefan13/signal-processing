function [reverse_signal] = reverse_signal_function(signal)
%reverse_signal is a function which reversing the signal.

k = []; % delcaring an empty array for k

reverse_signal = []; %vector to hold the revesed signal

for k = 1 : length(signal) % k goes from 1 to the end of the length of signal
    
   reverse_signal(k) = signal(length(signal)-k+1);  % reverse_signal at the index k will equal singal at the index of its length - k+1
                                                    % the last index of
                                                    % signal array

end
