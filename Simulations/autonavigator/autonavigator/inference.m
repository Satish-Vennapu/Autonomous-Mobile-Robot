function stear =inference(xpos,phi,delta,and_method)
 
if xpos < 100 & phi >= 270      % adjuting the mixing of angle range for proper results
    phi=phi-360;
end
    
for i=1:35
     
    [r y(i)]=fire_rule(i,xpos,phi,1,delta,and_method); %getting matching values for LMF
    
    for j=1:2
        stear_l(i,j)=r(j)*y(i);
    end
    
end

%defuzzification
sy=sum(y);
if sy==0
    sy=eps;
end

    
stear_l=sum(stear_l);
stear_l=stear_l/sy;
stear_l=mean(stear_l);


for i=1:35
     
    [r y(i)]=fire_rule(i,xpos,phi,2,delta,and_method); ; %getting matching values for UMF
    
    for j=1:2
        stear_h(i,j)=r(j)*y(i);
    end
    
end

sy=sum(y);
if sy==0
    sy=eps;
end

stear_h=sum(stear_h);
stear_h=stear_h/sy;
stear_h=mean(stear_h);

stear=(stear_l+stear_h)/2.0;
