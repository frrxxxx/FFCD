YY = Y'*Y;
FYYY = F'*Y/YY;
AW = 0;
for i = 1:size(FYYY, 2)
    tmp = YY(i, i) * ws_distance(FYYY(:, i), v);
    AW = AW + tmp;
end
BAL = calcBAL(label, Color, K)
b=min(BAL)
AW = AW/size(X,1)
%DI = dunns(K, distM, label)
SSE = calcSSE(X', label)
ncut=calNcut(X,K,W,label)
%rcut=calRcut(X,K,W,label)
