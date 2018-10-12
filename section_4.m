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
    
for k = 0:9 % k goes from 0 to 9 in steps of 1
    
    j(k+1) = c(k + 1) * cos(2*(pi)*k*494*y - r(k + 1)); % goes through each  index of the 'c' array, 'r' array and 'k%  
                                                        %  Once it execute the equation, it will store the value in j with the index of k +1


end

    x = x +1; % x allows the loop to continue
    signal(x) = sum(j); % sum of the signal when time = 0 - 1

end


%% Reducing the noise

smoothinterval = 5; % ammount of samples in a group

n = floor(length(signal)/smoothinterval); % declering the number of groups

for k = 1:n %for each of the n groups

    signalgroup = signal( smoothinterval*(k-1)+1: smoothinterval*k ); % group the x values into groups
    timegroup = time( smoothinterval*(k-1)+1: smoothinterval*k ); % group the y values into groups

    signal_red(k) = mean(signalgroup); %get the mean value of the signal group and store it in signal_red 
    times(k) = mean(timegroup); %get the mean value of the time group and store it in signal_red 

end

%% reverse signal

reverse_signal = reverse_signal_function(signal); %call the reverse_signal function


%% Find errors

reverse_signal_flip = fliplr(signal); % use the built in function 'fliplr' to reverse the signal

errors = find_errors_flip(reverse_signal, reverse_signal_flip); % call the find_errors_flip function 

disp(['Errors = ' num2str(errors)]); % display the number of errors

%% Introduce echo

signal_echo = signal*0.7; % singal_echo is = to 70% of signal

%% Plot the echo

plot (time(1:200), signal(1:200)); % plot signal vs time of the first 200 steps
hold on % hold the graph

plot(times(1:50), signal_red(1:50),'r'); % plot signal vs time of the first of the reduced noise frequency for the first 50 steps
hold on; % hold the grpah

plot(time(150:200), signal_echo(150:200), 'g'); % plot signal_echo vs time of the first of the reduced noise frequency for steps 150 to 200

xlabel('Time (s) '), ylabel('Signal (Hz)'); % labeling the graph
legend('Revesed Signal', 'Reduced Frequency', 'Echo'); % creating a ledgend for the graph



