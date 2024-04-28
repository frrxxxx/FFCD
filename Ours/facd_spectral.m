function [it,lable] = facd_spectral(lable, K,S, F,mv, p1)
    D=diag(sum(S,2));
    L=D-S;
    n=size(L,1);
    m=size(mv);
    Y = label2binary(lable);
    %store
    ca1=diag(Y'*L*Y);
    ca2=diag(Y'*D*Y);
    ca3=Y'*L;
    ca4=sum(Y,1);%cluster size 
    ca5=zeros(K,1);
    for h =1:K
        ca5(h)=trace(F'*Y(:,h)*(Y(:,h))'*F);
    end

    ca6=Y'*F;
    ca7=zeros(K,1);
    for h=1:K
        ca7(h)=trace(F'*Y(:,h)*mv);
    end
    maxit = 1000;
    last = zeros(n,1);
    it=1;

    while any(last~=lable)&&it<=maxit
        last=lable;
        Y = label2binary(lable);
        for i= 1:n
            p=find(Y(i,:)==1);
            z=find(F(i,:)==1);
            if (ca4(p)==1)
                continue;
            end
            obj=zeros(K,1);
        

            for j=1:K

                
                if(j==p)    
                    o1=ca1(j)/ca2(j)-(ca1(j)-2*ca3(j,i)+L(i,i))/(ca2(j)-D(i,i));
                    o2=ca5(j)*(ca4(j)^-2-(ca4(j)-1)^-2)+2*ca6(j,z)/(ca4(h)-1)^2+2*ca7(j)/(ca4(j)*(ca4(j)-1));
                    obj(j)=o1+p1*o2;
                   
                end
                if(j~=p)
                    o1=(ca1(j)+2*ca3(j,i)+L(i,i))/(ca2(j)+D(i,i))-ca1(j)/ca2(j);
                    o2=ca5(j)*((ca4(j)+1)^-2-ca4(j)^-2)+2*ca6(j,z)/(ca4(j)+1)^2+2*ca7(j)/(ca4(j)*(ca4(j)+1));
                    obj(j)=o1+p1*o2;
                end
            end
            r=find(obj==min(obj));

            if(r~=p)%update store
                Y(i,p)=0;
                Y(i,r)=1;
                ca1(r)=(Y(:,r))'*L*Y(:,r);
                ca2(r)=(Y(:,r))'*D*Y(:,r);
                for e =1:n
                    ca3(r,e)=ca3(r,e)+L(i,e);
                end
                ca4(r)=ca4(r)+1;
                ca5(r)=trace(F'*Y(:,r)*(Y(:,r))'*F);
                ca6(r,z)=ca6(r,z)+1;
                ca7(r)=trace(F'*Y(:,h)*mv);


                B=Y(:,p);

                ca1(p)=B'*L*B;
                ca2(p)=B'*D*B;
                for e =1:n
                    ca3(p,e)=ca3(p,e)-L(i,e);
                end
                ca4(p)=ca4(p)-1;
                ca5(p)=trace(F'*B*B'*F);
                ca6(p,z)=ca6(p,z)-1;
                ca7(p)=trace(F'*B*mv);

               
            end
        for z=1:n
            lable(z)=find(Y(z,:)==1);
        end
       
    end

 it=it+1;





end