%NB-1 --------- PB-7

function x = steering(z,range)

% p=[-30 -17 -7]

if (range==1) | (range==7)
    switch range
        case 1
            a=-35;b=-17;
            x1=-35;
            m=-1.0/(b-a);
            c=-m*b;
            x2=(z-c)/m;
        case 7
            a=17;b=35;
            m=1.0/(b-a);
            c=-m*a;
            x1=(z-c)/m;
            x2=35;
    end
else
    switch range
        case 2
            a=-30;b=-17;c=-7;
        case 3
            a=-14;b=-7;c=-0;
        case 4
            a=-7; b=0; c=7;
        case 5
            a=0;b=7;c=14;
        case 6
           a=7;b=17;c=30;
    end
    

    m1=1.0/(b-a);
    c1=-m1*a;
    m2=-1.0/(c-b);
    c2=-m2*c;

    x1=(z-c1)/m1;
    x2=(z-c2)/m2;
end
x(1)=x1;
x(2)=x2;