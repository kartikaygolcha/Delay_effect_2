%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Name: Part 2 Matlab Midterm Assessment 
% Q: Chorus
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

f1=1.2;
t=[0:1:length(x)]/Fs;
Mo1=1000;
D1=200;
assert(Mo1>D1);
M1=Mo1-D1 + D1*sin(2*pi*f1*t);       % Delay in sec     

f2=1.5;
Mo2=560;
D2=300;
assert(Mo2>D2);
M2=Mo2-D2 + D2*sin(2*pi*f2*t);        % Delay in sec  

M_delay=max([Mo1,Mo2]);               % Max Delay in samples
x=[zeros(M_delay,1);x;];              % Zero padding 
y_ff=zeros(length(x),1);              % Feedforward vector
y_fb=zeros(length(x),1);              % Feedback Vector 
G1=0.8;                               % gain
G2=0.9;

for i=[M_delay+1:1:length(x)]    
    Feed_1=round(M1(i-M_delay));                     % Delay Line 1
    Feed_2=round(M2(i-M_delay));                     % Delay Line 2
    y_ff(i)=x(i)+G1*x(i-Feed_1)+G2*x(i-Feed_2);      %feedforward
   
end
 
 y_ff=y_ff(M_delay+1:end);
 soundsc(y_ff,Fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 