function stear =inference(xpos,phi)
 
for i=1:35
     
    [r y(i)]=fire_rule(i,xpos,phi);
    
    for j=1:10
        stear(i,j)=r(j)*y(i);
    end
    
end


stear=sum(stear);
stear=stear/sum(y);
stear=mean(stear);


