%% Declaring Variables 
c = [0, 0.1155, 0.3417, 0.1789, 0.1232, 0.0678, 0.0473, 0.0260, 0.0045, 0.002]; % creating an array for c 
r = [0, -2.1299, +1.6727, -2.5454, 0.6607, -2.0390, 2.1597, -1.0467, 1.8581, -2.3925]; % creating an array for radius

x = 0; %declaring a variable which will be used in the for loop
y = 0; %declaring a variable which will be used in the for loop

signal = 0; %creating a variable for signal
time = (0:1/44100:1); % time = 0-1 in steps of 1/44100

%% Calculating Amplitutde for 1 seconds

for y = time % assigning y the value of time ( from 0 to 1 in steps of 1/44100)

    k = 0; % creating a variable to be used with the for loop 
    
for k = 0:9 %k goes from 0 to 9 in steps of 1
    
    j(k+1) = c(k + 1) * cos(2*(pi)*k*494*y - r(k + 1));% goes through each  index of the 'c' array, 'r' array and 'k%  
                                                       %  Once it execute the equation, it will store the value in j with the index of k +1

end

    x = x +1; % x allows the loop to continue
    signal(x) = sum(j);  % sum of the signal when time = 0 - 1

end

%% funtions, working out the global max, the element of global max, local max, find peaks(local max) and check if there are any errors 
% between local max and find peaks

global_max = max(signal); % usuing matlab built in function to calculate the globol max 

local_max_values = local_max(signal, time); % call the local_max function to calculate the local maximum

find_peaks = findpeaks(signal); %calculating the local maximum using matlab built in function

errors = find_errors(find_peaks, local_max_values); % call the error function which compares my results with find peaks function

disp(['Errors = ' num2str(errors)]); % displaying the errors number

%% user input

time_user = input ('Enter a time value between 0 and 1: ');  %asking the user to input the time.
signal_user = 0; %creating a variable for signal 

if time_user >= 0 && time_user <= 1 % if the value entered is higher or equal to 0 and lower than or equal to 1 do the following

    x = 0; %declaring a variable which will be used in the for loop
    y = 0; %declaring a variable which will be used in the for loop
    
    for y = time;  % assigning y the value of time ( from 0 to 1 in steps of 1/44100)

        k = 0; % creating a variable to be used with the for loop 

    for k = 0:9; %k goes from 0 to 9 in steps of 1
        j(k+1) = c(k + 1) * cos(2*(pi)*k*494*y - r(k + 1)); % goes through each  index of the 'c' array, 'r' array and 'k%  
                                                            %  Once it execute the equation, it will store the value in j with the index of k +1

    end

        x = x +1; % x allows the loop to continue
        signal_user(x) = sum(j); % sum of the signal when time = 0 - 1

    end 

else %else display the following message 
    disp('Sorry but you can only enter a number between 0 - 1'); 
end

%% plotting the graph

plot (1:300, signal(1:300)); %plotting the signal versus time for the first 300 steps
hold on; % hold the graph

plot (50, global_max, 'r*'); % plotting the globol max
hold on; % hold the graph 

plot (65.5, local_max_values(1:1), 'b*'); % plotting the local max value

xlabel('Time (s)'), ylabel('Signal (Hz)'), title('Signal versus time for the first 300 steps'); %labeling the graph 

