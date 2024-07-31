% LB 1----------RB-7
function match=phi(input,loc,delta)

switch loc
    case 1
        p=[170 225 280];
    case 2
        p=[120 155 190];
    case 3
        p=[90 112.5 135];
    case 4
        p=[80 90 100];
    case 5
        p=[45 67.5 90];
    case 6
        p=[-10 35 60];
    case 7
        p=[-100 -45 10];
end

%LMF
if (input<=p(1)) | (input>=p(3))
    match1=0;
elseif (input>p(1)) & (input<p(2))
    m=1.0/(p(2)-p(1));
    c=-m*p(1);
    match1=m*input+c;
elseif (input>p(2)) & (input<p(3))
    m=-1.0/(p(3)-p(2));
    c=-m*p(3);
    match1=m*input+c;
else
    match1=1;
end

%UMF
p(4)=p(3)+delta;
p(3)=p(2)+delta;
p(2)=p(2)-delta;
p(1)=p(1)-delta;

if (input<=p(1)) | (input>=p(4))
    match2=0;
elseif (input>p(1)) & (input<p(2))
    m=1.0/(p(2)-p(1));
    c=-m*p(1);
    match2=m*input+c;
elseif (input>=p(2)) & (input<=p(3))
    match2=1.0;
else
    m=1.0/(p(3)-p(4));
    c=-m*p(4);
    match2=m*input+c;
end
 
match(1)=match1;
match(2)=match2;
