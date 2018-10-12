%% Declaring Variables

c = [0, 0.1155, 0.3417, 0.1789, 0.1232, 0.0678, 0.0473, 0.0260, 0.0045, 0.002]; % c variable
r = [0, -2.1299, +1.6727, -2.5454, 0.6607, -2.0390, 2.1597, -1.0467, 1.8581, -2.3925]; % radius variable

x = 0; %declaring a variable which will be used in the for loop
y = 0; %declaring a variable which will be used in the for loop

signal = 0; %creating a variable for signal
time = (0:1/44100:1); % time = 0-1 in steps of 1/44100

%% Calculating Amplitutde for 1 seconds

for y = time % assigning y the value of time ( from 0 to 1 in steps of 1/44100)

    k = 0; % creating a variable to be used for 
    
for k = 0:9 %k goes from 0 to 9 in steps of 1
    
    j(k+1) = c(k + 1) * cos(2*(pi)*k*494*y - r(k + 1));% goes through each  index of the 'c' array, 'r' array and 'k%  
                                                       %  Once it execute the equation, it will store the value in j with the index of k +1

end

    x = x +1; % x allows the loop to continue
    signal(x) = sum(j); % sum of the signal when time = 0 - 1

end

%% Plotting the graph

plot (time(1:1000), signal(1:1000)); % first 1000 steps 
xlabel('Time (s)'), ylabel('Signal (Hz)'), title('Signal versus time for the first 1000 steps'); %labeling the graph 
