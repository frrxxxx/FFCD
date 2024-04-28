data_with_labels = load("flame.txt");
data = data_with_labels(:, 1:2);
labels = data_with_labels(:, 3);
k = 2;

sensitive = labels;
n = size(data, 1);

% converting sensitive to a vector with entries in [h] and building F %%%
sens_unique=unique(sensitive);
h = length(sens_unique);
sens_unique=reshape(sens_unique,[1,h]);

sensitiveNEW=sensitive;

temp=1;
for ell=sens_unique
    sensitiveNEW(sensitive==ell)=temp;
    temp=temp+1;
end
    
F=zeros(n,h-1);

for ell=1:(h-1)
    temp=(sensitiveNEW == ell);
    F(temp,ell)=1; 
    groupSize = sum(temp);
    F(:,ell) = F(:,ell)-groupSize/n;
end
%%%%

scale = 1;
tmp = squareform(pdist(data,'squaredeuclidean'))/(2*scale^2);
A = exp(-tmp); %similarity matrix

D = diag(sum(A,2));

L = (D^-0.5)*A*(D^-0.5);
Z = null(F');
%%============
% L : k eignvecter = Y
%A = A + lamda * (Y*Y')


L = Z' * L * Z;
L = (L + L') / 2;
% select the largest eigenvectors
[eig_vecs,eig_vals] = eig(L);
[~,sort_index] = sort(diag(eig_vals),'descend');
X = eig_vecs(:,sort_index(1:k));
H = Z * X;

% Y = X./repmat(sqrt(sum(X.^2,2)),1,k);
% 
% result_labels = kmeans(Y,k)
% draw(data,result_labels);

% tr(L) + lamda *||A - Y*Y'||

Y = H./repmat(sqrt(sum(H.^2,2)),1,k); Y*Y'
% figure,plot(Y(:,1),Y(:,2),'ro'),title('Data points after map'),grid on;

for i = 1:100
    L = (D^-0.5)*A*(D^-0.5) + 0.01 * (Y * Y');
    L = Z' * L * Z;
    L = (L + L') / 2;
    % select the largest eigenvectors
    [eig_vecs,eig_vals] = eig(L);
    [~,sort_index] = sort(diag(eig_vals),'descend');
    X = eig_vecs(:,sort_index(1:k));
    H = Z * X;
    Y = H./repmat(sqrt(sum(H.^2,2)),1,k);
end

L = (D^-0.5)*A*(D^-0.5) + 0.01 * (Y * Y'); % fair normalized similarity matrix
[eig_vecs,eig_vals] = eig(L);
[~,sort_index] = sort(diag(eig_vals),'descend');
X = eig_vecs(:,sort_index(1:k));
Y = X./repmat(sqrt(sum(X.^2,2)),1,k);

result_labels = kmeans(Y,k);
draw(data,result_labels);