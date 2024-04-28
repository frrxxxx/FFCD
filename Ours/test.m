close all;

X_raw = load("../Datasets/creditcard.txt");
label= load("../label/creditcard_VFC.txt");
K = 5;
sigma=1.0;
n=size(X_raw,1)
X =normalize(X_raw, 1);
X = X./repmat(sqrt(sum(X.^2,2)),1, size(X,2));
W = exp(-squareform(pdist(X))/ (2 * sigma ^2));
W(logical(eye(size(W))))=0;

sse=calcSSE(X',label)

ncut=calNcut(X,K,W,label)