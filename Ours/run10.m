
BAL_list = zeros(1,10);
AW_list = zeros(1, 10);
DI_list = zeros(1, 10);
SSE_list = zeros(1, 10);
Ncut_list=zeros(1,10);
it_list=zeros(1,10);
time_list=zeros(1,10);
for t = 1:10
    demo
    BAL_list(t) = bal;
    AW_list(t) = AW;
    DI_list(t) = DI;
    SSE_list(t) = SSE;
    Ncut_list(t)=ncut;
    it_list(t)=it;
    time_list(t)=time;
    t = t + 1;
end
max(BAL_list)
max(DI_list)
min(AW_list)
min(SSE_list)
min(Ncut_list)

min(time_list)