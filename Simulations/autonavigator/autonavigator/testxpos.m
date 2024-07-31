%testxpos
for i=0:0.01:200
    br=0;
    for j=1:5
        m=xpos(i,j,0);
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
