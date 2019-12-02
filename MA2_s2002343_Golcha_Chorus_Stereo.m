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
x_st=zeros(length(x),2);

f1=[2 0.2] ;
t=[0:1:length(x)]/Fs;
t1=[t;t];
Mo1=[100 200];
D1=([20 40]);
ww=f1'.*t1;
M1=(Mo1-D1)' + D1'.*sin(2*pi*ww);       % Delay in sec     

f2=[10 0.5];
Mo2=[60 80];
D2=[30 25];
M2=Mo2'-D2' + D2'.*sin(2*pi*f2'.*t);       % Delay in sec  

M_delay=max([Mo1,Mo2]);    ;            % Max Delay in samples
x=[zeros(M_delay,1);x;];          % Zero padding 
M1=[zeros(2,M_delay),M1];
M2=[zeros(2,M_delay),M2];
y_ff=zeros(length(x),1);           % Feedforward vector
y_fb=zeros(length(x),1);           % Feedback Vector 
G1=[0.8 0.4];                               % gain;
G2=[0.9 0.1];

for i=[M_delay+1:1:length(x)]    
    Feed_1=round(M1(1,i));
    Feed_2=round(M2(1,i));
    Feed_11=round(M1(2,i));
    Feed_22=round(M2(2,i));
    x_st(i,1)=x(i)+G1(1)*x(i-Feed_1)+G2(1)*x(i-Feed_2);      %feedforwar
    x_st(i,2)=x(i)+G1(2)*x(i-Feed_11)+G2(2)*x(i-Feed_22);      %feedforward
   
end
 
 x_st=x_st(M_delay+1:end,:);
 soundsc(x_st,Fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 