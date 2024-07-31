%testphi

for i=-100:0.01:300
    br=0;
    for j=1:7
        m=phi(i,j,0);
        if m(1)~=m(2)
            br=1;    
            break;
        end
    end
    if br==1
        break;
    end
end
if br==0
    disp('function is ok');
else
    disp('function error');
end
