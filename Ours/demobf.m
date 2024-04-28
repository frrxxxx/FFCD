close all;

X_raw = load("../Datasets/subsampled_adult.txt");
Color = load("../Datasets/subsampled_adult_Color.txt");
K = 10;
sigma=1.0;
n=size(X_raw,1)
[F, v] = SensCNVT(Color);

% Standardization and Normalization

X = normalize(X_raw, 1);
X = X./repmat(sqrt(sum(X.^2,2)),1, size(X,2));
distM=squareform(pdist(X));
tmp = distM / (2 * sigma ^2);
S= exp(-tmp);
S(logical(eye(size(S))))=0;
%labels=Color;

tic;
label = spectralcluster(S,K,'Distance','precomputed','LaplacianNormalization','symmetric');
toc;

Y = label2binary(label);

YY = Y'*Y;
FYYY = F'*Y/YY;
AW = 0;
for i = 1:size(FYYY, 2)
    tmp = YY(i, i) * ws_distance(FYYY(:, i), v);
    AW = AW + tmp;
end
BAL = calcBAL(label, Color, K)'
bal=min(BAL)
AW = AW/size(X,1)
SSE = calcSSE(X', label)
ncut=calNcut(X,K,S,label)


