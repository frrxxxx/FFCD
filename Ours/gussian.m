mu1 = [-1,1];		
mu2 = [20,10]; 		
cov1 = [1.2, 1; 1,1];		
cov2 = [1,0; 0, 1.3];		
N = 100;		
X1 = mvnrnd(mu1, cov1, N);		
X2 = mvnrnd(mu2, cov2, 2*N);		

X_raw = [X1; X2];    
Y1=repmat(0,N,1);
Y2=repmat(1,2*N,1);
Color=[Y1;Y2];

K = 2;

[F, v] = SensCNVT(Color);


% Standardization and Normalization
X = normalize(X_raw, 1);
X = X./repmat(sqrt(sum(X.^2,2)),1, size(X,2));

% label = kmeans(X, K);

distM=squareform(pdist(X));

% 
p1 = 100;
p2 = 0;
e=90;
s=zeros(100,3);
for j =1:e
    tic; [label,C] = bfkm(X', K, F, p1, p2); toc;

    Y = label2binary(label);
    YY = Y'*Y;
    FYYY = F'*Y/YY;
    AW = 0;
    for i = 1:size(FYYY, 2)
        tmp = YY(i, i) * ws_distance(FYYY(:, i), v);
        AW = AW + tmp;
    end
    BAL = calcBAL(label, Color, K)
    s(j,1)=BAL(1);
    s(j,2)=BAL(2);
    AW = AW/size(X,1)
    DI = dunns(K, distM, label)
    SSE = calcSSE(X_raw', label)
    s(j,3)=SSE;
    Draw(X_raw, label);
    p1=p1+2;
end

Draw(X_raw, label);