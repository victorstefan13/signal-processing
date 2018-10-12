function [errors] = find_errors(find_peaks,local_max_values)
%find_erros will check to see if there are any erros between
%local_max_values function and find_peaks function

errors = 0; % set the error variable to 0

if(find_peaks ~= local_max_values) %if find_peaks is NOT equal to local_max_values
    
        errors = errors + 1;   %increment errors by one     
    
end

