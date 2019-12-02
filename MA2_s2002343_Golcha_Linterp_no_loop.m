  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Name: Part 2 Matlab Midterm Assessment 
% Q: Lagrange Interpolation no loop
% Developer: Kartikay Golcha
% UUN: s2002343
% Date :18/11/2019
% University: University of Edinburgh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MA2_s2002343_Golcha_Linterp_no_loop(4,100,2)
function lagrange_inter=MA2_s2002343_Golcha_Linterp_no_loop(N,Q,fmode)
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

rt=reshape(M,[1,1,N]);
D = bsxfun(@rdivide,bsxfun(@minus,alpha(:),rt),bsxfun(@minus,M(:).',rt));
D(:,1:numel(M)+1:numel(M)*numel(M)) =1;
temp = prod(D,3);

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