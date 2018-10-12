function [errors] = find_errors_flip(reverse_signal,reverse_signal_flip)
%find_errors_flip will check to see if there are any erros between
%reverse_signal_function and fliplr function

errors = 0;

if(reverse_signal ~= reverse_signal_flip) %if revese_signal is NOT equal to reverse_signal_flip
    
        errors = errors + 1; %increment errors by one          
    
end
