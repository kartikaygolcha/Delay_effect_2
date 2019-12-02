%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Name: Part 2 Matlab Midterm Assessment 
% Q: Comb Filter
% Developer: Kartikay Golcha
% UUN: s2002343
% Date :18/11/2019
% University: University of Edinburgh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;

%read in our WAV file, and store sample rate in Fs
[x,Fs]=audioread('piano.wav');
x = 0.5*sum(x,2);                          %stereo to mono

M=0.5;                                     %  Delay in sec     
M_delay=floor(M*Fs);                       % Delay in samples
x=[zeros(M_delay,1);x];                    % Zero padding 
y_ff=zeros(length(x),1);                   % Feedforward vector
y_fb=zeros(length(x),1);                   % Feedback Vector 
G=0.7;                                     % gain;

for i=[M_delay+1:length(x)]
    y_ff(i)=x(i)+G*x(i-M_delay);      %feedforward
    y_fb(i)=x(i)-G*y_fb(i-M_delay);   %feedback
end
 
 %Removing padded zeros
 
y_ff=y_ff(M_delay+1:end);
y_fb=y_fb(M_delay+1:end);
 
 %soundsc(y_fb,Fs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 