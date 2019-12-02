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
M1=Mo1-D1 + D1*sin(2*pi*f1*t);       % Delay in sec     

f2=1.5;
Mo2=560;
D2=300;
M2=Mo2-D2 + D2*sin(2*pi*f2*t);        % Delay in sec  

M_delay=max([Mo1,Mo2]);               % Max Delay in samples
x=[zeros(M_delay,1);x;];              % Zero padding 
M1=[zeros(1,M_delay),M1;];              % Zero padding for Delay Line
M2=[zeros(1,M_delay),M2;];              % Zero padding for Delay Line
y_ff=zeros(length(x),1);              % Feedforward vector
y_fb=zeros(length(x),1);              % Feedback Vector 
G1=0.8;                               % gain;
G2=0.9;

for i=[M_delay+1:1:length(x)]    
    y_ff(i)=x(i)+G1*my_interpolate(4,i,M1,x)+G2*my_interpolate(4,i,M2,x);      %feedforward
end
 
 y_ff=y_ff(M_delay+1:end);
 soundsc(y_ff,Fs);
 
 function my_interpolate=my_interpolate(N,i,M,x);
 if N==1
     my_interpolate=x(i-round(M(i)));
 elseif N==2
     alpha=M(i)-floor(M(i))-1/2;
     x1=x(i-floor(M(i)));
     x2=x(i-floor(M(i))+1);
     my_interpolate=-1*(alpha-1/2)*x1+(alpha+1/2)*x2;
     
 elseif N==4   
 
     alpha=M(i)-floor(M(i))-1/2;
     x1=x(i-floor(M(i)));
     x2=x(i-floor(M(i))+1);
     x3=x(i-floor(M(i))-1);
     x4=x(i-floor(M(i))+2);
     p1=(alpha-1/2)*(alpha+1/2)*(alpha-3/2)/(-6);
     p2=(alpha-1/2)*(alpha+3/2)*(alpha-3/2)/2;
     p3=(alpha+1/2)*(alpha+3/2)*(alpha-3/2)/(-2);
     p4=(alpha-1/2)*(alpha+1/2)*(alpha+3/2)/6;
     my_interpolate=p1*x1+p2*x2+p3*x3+p4*x4;
 end
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 