close all;

X_raw = load("../Datasets/adult.txt");
K = 10;
n=size(X_raw,1)

X = normalize(X_raw, 1);
X = X./repmat(sqrt(sum(X.^2,2)),1, size(X,2));
label=kmeans(X,K);