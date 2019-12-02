%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Name: Part 2 Matlab Midterm Assessment 
% Q: Vibrato
% Developer: Kartikay Golcha
% UUN: s2002343
% Date :18/11/2019
% University: University of Edinburgh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;

%read in our WAV file, and store sample rate in Fs
[x,Fs]=audioread('Cath_short_clip.wav');
x = 0.5*sum(x,2);                  %stereo to mono

f=2;
t=[0:1:length(x)]/Fs;
Mo=100;
M=Mo*(1+sin(2*pi*f*t)) ;           % Delay in sec     
M_delay=2*Mo           ;           % Max Delay in samples
x=[zeros(M_delay,1);x;];           % Zero padding 
y_ff=zeros(length(x),1);           % Feedforward vector
y_fb=zeros(length(x),1);           % Feedback Vector 
G=0.8;                               % gain;

for i=[M_delay+1:1:length(x)]    
    Feed=round(M(i-M_delay));
    y_ff(i)=x(i-Feed);      %feedforward
end
 
 y_ff=y_ff(M_delay+1:end);
 soundsc(y_ff,Fs);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 