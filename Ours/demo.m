close all;

X_raw = load("../Datasets/elliptical.txt");
Color = load("../Datasets/elliptical_color.txt");
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
t2=clock;
time=etime(t2,t1)
toc;

Y = label2binary(label);

YY = Y'*Y;
FYYY = F'*Y/YY;
AW = 0;
for i = 1:size(FYYY, 2)
    tmp = YY(i, i) * ws_distance(FYYY(:, i), v);
    AW = AW + tmp;
end
it;
BAL = calcBAL(label, Color, K)';
bal=min(BAL)
%AW = AW/size(X,1);
%DI = dunns(K, distM, label);
SSE = calcSSE(X', label)
%ncut=calNcut(X,K,W,label);