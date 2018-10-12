function [local_max_y,local_max_x] = local_max(signal, time)
%local_max this function will allow us to find the local maximum values of
%our signal

local_max_y = []; %vector to store the y-values of local maxima
local_max_x = []; %vector to store the x-values of local maxima

for j = 2:length(time)-1 %j goes from 2 to the last index of the time array - 1
    
    if(signal(j)>=signal(j-1) && signal(j)>=signal(j+1)) % if singal at the index of j is greater then or equal to signal at the index of j -1 
                                                         % and if singal at the index of j is greater then or equal to signal at the index of j +1
                                                         
        
        local_max_y = [local_max_y signal(j)]; %max y is the highest point in the y axis
        
        local_max_x = [local_max_x time(j)]; % max x is the highest point in the x axis. 
        
    end
    
end

end

