N=10;
alpha=linspace(-(N-1)/2,(N-1)/2,100)';
M=[-(N-1)/2:1:(N-1)/2];
y_out=alpha-M;
kt=M;
rt=reshape(M,[1,1,N])
D = bsxfun(@rdivide,bsxfun(@minus,alpha(:),rt),bsxfun(@minus,M(:).',rt)) %//'
D(:,1:numel(M)+1:numel(M)*numel(M)) =1;
Hout = prod(D,3);
plot(Hout);