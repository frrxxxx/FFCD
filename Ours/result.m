close all;

X_raw = load("../Datasets/elliptical.txt");
Color = load("../Datasets/elliptical_Color.txt");
K = 2;
sigma=1.0;
n=size(X_raw,1)
[F, v] = SensCNVT(Color);

% Standardization and Normalization

X = normalize(X_raw, 1);
X = X./repmat(sqrt(sum(X.^2,2)),1, size(X,2));
distM=squareform(pdist(X));
tmp = distM / (2 * sigma ^2);
W = exp(-tmp);
W(logical(eye(size(W))))=0;
%labels=Color;
labels = randsrc(n,1,1:K);

p1 =0.7;
tic;
t1=clock;
[it,label] = facd(labels, K,W, F,v', p1);

BAL = calcBAL(label, Color, K)';
bal=min(BAL)

filename='elliptical_FFSCCD.txt';
dlmwrite("elliptical_FFSCCD.txt",label)
Draw(X_raw,label);

%label2 = spectralcluster(W,K,'Distance','precomputed','LaplacianNormalization','symmetric');
%filename='2d-4c-no4_SC.txt';
%dlmwrite("2d-4c-no4_SC.txt",label)

%Draw(X_raw,label2);



