clc;
clear;
close all;

%% REMOTE PATIENT MONITORING SYSTEM

% Time / Patient readings
t = 1:20;

% Simulated Heart Rate sensor data
HeartRate = [72 75 78 80 76 82 79 85 88 92 ...
             95 98 105 110 115 108 100 90 82 78];

% Simulated SpO2 sensor data
SpO2 = [98 98 97 97 98 97 96 97 96 95 ...
        95 94 93 92 91 90 92 94 96 97];

% Simulated Temperature sensor data
Temperature = [36.5 36.6 36.6 36.7 36.7 36.8 36.8 36.9 37.0 37.0 ...
               37.1 37.2 37.3 37.4 37.6 37.8 37.7 37.4 37.1 36.9];

%% DISPLAY SENSOR DATA

disp('===== REMOTE PATIENT MONITORING =====');

for i = 1:length(t)

    fprintf('\nReading %d\n',i);
    fprintf('Heart Rate  : %d BPM\n',HeartRate(i));
    fprintf('SpO2        : %d %%\n',SpO2(i));
    fprintf('Temperature : %.1f C\n',Temperature(i));

    % Patient condition checking
    if HeartRate(i) > 100
        disp('ALERT: High Heart Rate');

    elseif HeartRate(i) < 60
        disp('ALERT: Low Heart Rate');

    elseif SpO2(i) < 94
        disp('ALERT: Low SpO2');

    elseif Temperature(i) > 37.5
        disp('ALERT: High Temperature');

    else
        disp('Status: NORMAL');
    end

end

%% HEART RATE GRAPH

figure;
plot(t,HeartRate,'-o','LineWidth',1.5);
title('Heart Rate Monitoring');
xlabel('Reading Number');
ylabel('Heart Rate (BPM)');
grid on;

%% SpO2 GRAPH

figure;
plot(t,SpO2,'-o','LineWidth',1.5);
title('SpO2 Monitoring');
xlabel('Reading Number');
ylabel('SpO2 (%)');
grid on;

%% TEMPERATURE GRAPH

figure;
plot(t,Temperature,'-o','LineWidth',1.5);
title('Body Temperature Monitoring');
xlabel('Reading Number');
ylabel('Temperature (C)');
grid on;

%% PATIENT MONITORING DASHBOARD

figure;

subplot(3,1,1);
plot(t,HeartRate,'-o');
title('Heart Rate');
ylabel('BPM');
grid on;

subplot(3,1,2);
plot(t,SpO2,'-o');
title('SpO2');
ylabel('%');
grid on;

subplot(3,1,3);
plot(t,Temperature,'-o');
title('Temperature');
xlabel('Reading Number');
ylabel('C');
grid on;

sgtitle('IoT Remote Patient Monitoring Dashboard');

%% FINAL RESULT

abnormal = 0;

for i = 1:length(t)

    if HeartRate(i) > 100 || HeartRate(i) < 60 || ...
       SpO2(i) < 94 || Temperature(i) > 37.5

        abnormal = abnormal + 1;
    end

end

disp(' ');
disp('===== FINAL RESULT =====');

fprintf('Total Readings    : %d\n',length(t));
fprintf('Abnormal Readings : %d\n',abnormal);

if abnormal > 0
    disp('ALERT: Abnormal reading detected!');
    disp('Notification sent to healthcare professional.');
else
    disp('Patient status: NORMAL');
end