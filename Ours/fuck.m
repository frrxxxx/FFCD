clear all
X1 = load("D:\桌面\facd\Ours\Results\elliptical_VFC.txt");
X2=load("D:\桌面\facd\Ours\Results\elliptical_FAC.txt");
X3=load("D:\桌面\facd\Ours\Results\elliptical_FFSCCD.txt");
X4=load('D:\桌面\facd\Ours\Results\elliptical_FSCN.txt');

if(X1==X2)
    a=0
end

if(X2==X3)
    b=1
end

if(X2==X4)
    c=2
end