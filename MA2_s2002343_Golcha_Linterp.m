  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Name: Part 2 Matlab Midterm Assessment 
% Q: Lagrange Interpolation
% Developer: Kartikay Golcha
% UUN: s2002343
% Date :18/11/2019
% University: University of Edinburgh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MA2_s2002343_Golcha_Linterp(4,200,2)

function lagrange_inter=MA2_s2002343_Golcha_Linterp(N,Q,fmode)
%Check which fmode it will belong for ourput vector
if fmode==1
    alpha=linspace(-1/2,1/2,Q)';
else
    alpha=linspace(-(N-1)/2,(N-1)/2,Q)';
end

 %Defining Vectors
y_out=zeros(Q,N); 
temp=ones(Q,N);

%Values of Different Basis functions
M=[-(N-1)/2:1:(N-1)/2];
y_out=alpha-M;

for i=1:1:length(M)
   temp_1=y_out;                %temp store
   temp_1(:,i)=[];              
   M_temp=M;
   M_temp(i)=[];
   temp(:,i)=prod(temp_1,2)/prod(M(i)-M_temp,2); 
end
if(fmode==2)
plot (temp);
xlabel("Alpha");
ylabel("Amplitude");
title_str = sprintf("Langrange Interpolation Basis Functions for N= %d ", N);
title(title_str);
legend(num2str((-(N-1)/2:(N-1)/2)'));
else    
lagrange_inter=temp    ;
end
end