function [it,label] = facd(label, K,S, F,mv, p1)
m=size(F,2);
D=diag(sum(S,2));
L=D-S;
n=size(L,1);
Y = label2binary(label);
ca1=diag(Y'*L*Y);
ca2=diag(Y'*D*Y);

ca3=Y'*L;
ca4=sum(Y,1);%cluster size
ca5=Y'*F;
maxit = 1000;
last = zeros(n,1);
it=1;

while any(last~=label)&&it<=maxit
    last=label;
    Y = label2binary(label);
    for i= 1:n
        nca1=zeros(K,1);
        nca2=zeros(K,1);
        p=find(Y(i,:)==1);

        if (ca4(p)==1)
            continue;
        end
        obj=zeros(K,1);
        for j=1:K    
            if(j==p)
                b=ca5(j,:)/ca4(j)-mv;
                d=(ca5(j,:)-F(i,:))/(ca4(j)-1)-mv;
                o2=sum(b.^2, 'all')-sum(d.^2,'all');
                o1=ca1(j)/ca2(j)-(ca1(j)-2*ca3(j,i)+L(i,i))/(ca2(j)-D(i,i));
                obj(j)=o1+p1*o2;
                nca1(j)=ca1(j)-2*ca3(j,i)+L(i,i);
                nca2(j)=ca2(j)-D(i,i);

            end
            if(j~=p)
                b=(ca5(j,:)+F(i,:))/(ca4(j)+1)-mv;
                d=ca5(j,:)/ca4(j)-mv;
                o2=sum(b.^2, 'all')-sum(d.^2,'all');
                o1=(ca1(j)+2*ca3(j,i)+L(i,i))/(ca2(j)+D(i,i))-ca1(j)/ca2(j);
                obj(j)=o1+p1*o2;
                nca1(j)=ca1(j)+2*ca3(j,i)+L(i,i);
                nca2(j)=ca2(j)+D(i,i);
            end
        end
        r=find(obj==min(obj));
        if(r~=p)
            Y(i,p)=0;
            Y(i,r)=1;
            ca1(r)=nca1(r);
            ca2(r)=nca2(r);
            for e =1:n
                ca3(r,e)=ca3(r,e)+L(i,e);
            end
            ca4(r)=ca4(r)+1;
            ca5(r,:)=ca5(r,:)+F(i,:);

            ca1(p)=nca1(p);
            ca2(p)=nca2(p);
            for e =1:n
                ca3(p,e)=ca3(p,e)-L(i,e);
            end
            ca4(p)=ca4(p)-1;
            ca5(p,:)=ca5(p,:)-F(i,:);
        end
		[~, label] = max(Y, [], 2);

    end

    it=it+1;
    end
