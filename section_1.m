%% Declaring Variables 
c = [0, 0.1155, 0.3417, 0.1789, 0.1232, 0.0678, 0.0473, 0.0260, 0.0045, 0.002]; % c variable
r = [0, -2.1299, +1.6727, -2.5454, 0.6607, -2.0390, 2.1597, -1.0467, 1.8581, -2.3925]; % radius variable

t1=0.1; % first time
t2 = 0.4; % second time

k = 0; % variable for iteration 

%% Calculating Amplitutde for 0.1 seconds

for k = 0:9;
    
    x(k+1) = c(k + 1) * cos(2*(pi)*k*494*t1 - r(k + 1)); % goes through each  index of the 'c' array, 'r' array and 'k%  
                                                         %  Once it execute the equation, it will store the value in x with the index of k +1

end

singal_1 = sum(x); % sum of the equation when time = 0.1

%% Calculating  Amplitutde for 0.4 seconds 

for k = 0:9;
    
    y(k+1) = c(k + 1) * cos(2*(pi)*k*494*t2 - r(k + 1));  % goes through each  index of the 'c' array, 'r' array and 'k%  
                                                          %  Once it execute the equation, it will store the value in y with the index of k +1

end

signal_2 = sum(y); %sum of the equation when time = 0.4
