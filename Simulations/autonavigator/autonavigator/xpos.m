%'LE' = 1, 'LV' = 2, 'VE'=3, 'RV'=4, 'RI'=5

function match=xpos(input,loc,delta)

if (loc==1) | (loc==5)
    
    switch loc
        
        case 1
            %UMF
            p=[0 20 70];  
            if (input<p(1))
                disp('not a valid input');
                match2=0;
            elseif (input>=p(1)) & (input<=p(2))
                match2=1;
            elseif (input>p(2)) & (input<=p(3))
                m=-1.0/(p(3)-p(2));
                c=-m*p(3);
                match2=m*input+c;
            else 
                match2=0;
            end
            %LMF
            m=-1.0/(p(3)-p(2));
            p(3)=p(3)-delta;
            c=-m*p(3);
            y_level=m*p(2)+c;
            
            if (input<p(1)) | (input>p(3))
                match1=0;
            elseif ((input>=p(1)) & (input<=p(2)))
                match1=y_level;    
            else
                match1=m*input+c;
            end

        case 5
            %UMF
            p=[130 180 200];
            if (input>p(3))
                disp('not a valid input');
                match2=0;
            elseif (input>=p(2)) & (input<=p(3))
                match2=1;
            elseif (input>p(1)) & (input<p(2))
                m=1.0/(p(2)-p(1));
                c=-m*p(1);
                match2=m*input+c;
            else 
                match2=0;
            end

            %LMF
            m=1.0/(p(2)-p(1));
            p(1)=p(1)+delta;
            c=-m*p(1);
            y_level=m*p(2)+c;

            if (input<p(1)) | (input>p(3))
                match1=0;
            elseif ((input>=p(1)) & (input<=p(2)))
                match1=m*input+c;
            else
                match1=y_level;
            end
    end
                
else
    
    switch loc  
    
        case 2 
        p=[60 80 100];
        
        case 3
        p=[90 100 110];
        
        case 4
        p=[100 120 140];
    end
    
        %LMF
        if (input<p(1)) | (input>p(3))
            match1=0;
        elseif (input>=p(1)) & (input<p(2))
            m=1.0/(p(2)-p(1));
            c=-m*p(1);
            match1=m*input+c;
        elseif (input>p(2)) & (input<=p(3))
            m=1.0/(p(2)-p(3));;
            c=-m*p(3);;
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
            match2=1;
        else
            m=1.0/(p(3)-p(4));;
            c=-m*p(4);;
            match2=m*input+c;
        end
end
match(1)=match1;
match(2)=match2;
