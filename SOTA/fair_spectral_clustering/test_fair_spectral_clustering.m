X_raw = load("../Datasets/adult.txt");
Color = load("../Datasets/adult_Color.txt");
K =10;

% Normalization and Standardization
X = normalize(X_raw, 1);
X = X./repmat(sqrt(sum(X.^2,2)),1, size(X,2));

% Contruct Similarity Matrix
distances = squareform(pdist(X));  
sigma = max(distances(:));
order = 2;
tmp = distances.^order/sigma;
W = exp(-tmp);

tic;label = Fair_SC_normalized(W, K, Color);toc;
% label = load('bank_FSCN.txt');
Y = label2binary(label);
Y'*Y
bal = calcBAL(label, Color, K);
min(bal)
sse = calcSSE(X', label)
ncut=calNcut(X,K,W,label)
%rcut=calRcut(X,K,W,label)