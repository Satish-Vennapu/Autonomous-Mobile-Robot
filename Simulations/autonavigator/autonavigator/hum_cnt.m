function [lf rf vpf vmf] = hum_cnt(x_pass,y_pass,angle_v_pass,angle_t_pass,v_pass,status_cb,tft,trt,tvb,left,right,vplus,vminus)
                
lf=0;
rf=0;
vpf=0;
vmf=0;
persistent x;
persistent y;
persistent angle_v;
persistent angle_t;
persistent v;
persistent steer;
persistent distance;
conf='humanCntlr';

if  ( isempty(x) | isempty(y) | isempty(angle_v) | isempty(angle_t) | isempty(v) )
    x=x_pass;
    y=y_pass;
    angle_v=angle_v_pass;
    angle_t=angle_t_pass;
    v=v_pass;
    distance=0;
    steer=0;
end


count=0;

%{
if (check_boundary(x,y)) 
    
end
%}

%{
fn=strcat('pos',num2str(x),'_',num2str(y),conf,'.log');
fid = fopen(fn,'w');
fwrite(fid,conf);
status = fclose(fid);
%}

l=26.4;
w=l/(2.4444);
t_len=8;
t_halflen=t_len/2;
t_wid=3;
l_wid=2;
t_ofsl=3.6;
t_ofsu=22;
d=18.4;
angle_fi=angle_t+angle_v;
tf=4;
v_rear=2;
dist=0;

%________________________________
% 

  %  fid = fopen(fn,'a');

    if status_cb
           p=0;
        else
            cla;     
    end
    
    if right==1
        angle_t=angle_t-2;
        steer=steer-2;
        rf=1;
        return;
    elseif left==1
        angle_t=angle_t+2;
        steer=steer+2;
        lf=1;
        return;
    else
        angle_tn=angle_t;
        steer=0;
    end

    if vplus==1
        v=v+1;
        vpf=1;
        return;
    elseif vminus==1
        v=v-1;
        vmf=1;
        return;
    end

    if (abs(angle_tn)>35)
        if angle_tn>0
            angle_tn=35;
        else
            angle_tn=-35;
        end
    end

    steer_v=asind( (v/d)*sind(angle_tn) );
    
    angle_vn=angle_v+steer_v;
    
    gamma=angle_tn+angle_vn;
    
    var_B=d*cosd(angle_v)+v*cosd(gamma)-d*cosd(angle_vn);
    
    var_C=cosd(angle_vn);
    
    v_rear=var_B/var_C;
    
    steer_t=steer;
    angle_v=angle_vn;
    angle_t=angle_tn;
    disp(angle_t);
    distance=distance+v;
    dist=distance;
    
    %normalizing the angle_v within range -100 to +300
 
    if (angle_v>300)
        angle_v=angle_v-360;
    end
    
    if (angle_v<-100)
        angle_v=360+angle_v;
    end

    
    x=x+v_rear*cosd(angle_v);
    y=y+v_rear*sind(angle_v);
    
   % a=sprintf('\n');
   % fwrite(fid,a);
    qp=strcat('X_POS : ',num2str(x),' Y_POS : ',num2str(y),' ANGLE_V : ',num2str(angle_v),' ANGLE_T : ',num2str(angle_t),' V_REAR : ',num2str(v_rear),' V_FRONT : ',num2str(v),' STEER_V : ',num2str(steer_v),' STEER_T : ',num2str(steer_t));
    disp(qp);
    %fwrite(fid,qp);
    angle_fi=angle_t+angle_v;
         
    %status = fclose(fid);
    
           
    %--------Parking boundaries----

    h1=line([90 90],[200 195]);
    h2=line([110 110],[200 195]);

    set(h1,'linewidth',5,'color','r');
    set(h2,'linewidth',5,'color','r');


    %-------XN,YN---points of vehicle---------
    
    x_=x-t_ofsl*cosd(angle_v);
    y_=y-t_ofsl*sind(angle_v);
    
    x0=x_+(w/2*sind(angle_v));
    y0=y_-(w/2*cosd(angle_v));
    
    x1=x_-(w/2*sind(angle_v));
    y1=y_+(w/2*cosd(angle_v));
    
    p=x_+l*cosd(angle_v);
    q=y_+l*sind(angle_v);
    
    x2=p+(w/2*sind(angle_v));
    y2=q-(w/2*cosd(angle_v));
    
    x3=p-(w/2*sind(angle_v));
    y3=q+(w/2*cosd(angle_v));
    
    
    %--------TN_X,TN_Y--points of tyres-------
    t0_x=x0+t_ofsl*cosd(angle_v);
    t0_y=y0+t_ofsl*sind(angle_v);
    
    t1_x=x1+t_ofsl*cosd(angle_v);
    t1_y=y1+t_ofsl*sind(angle_v);
    
    t2_x=x0+t_ofsu*cosd(angle_v);
    t2_y=y0+t_ofsu*sind(angle_v);
    
    t3_x=x1+t_ofsu*cosd(angle_v);
    t3_y=y1+t_ofsu*sind(angle_v);
    %__________________________


    %--------TN_SX,TN_SY----starting points of tyres-----
    t0_sx=t0_x-t_halflen*cosd(angle_v);
    t0_sy=t0_y-t_halflen*sind(angle_v);

    t1_sx=t1_x-t_halflen*cosd(angle_v);
    t1_sy=t1_y-t_halflen*sind(angle_v);

    t2_sx=t2_x-t_halflen*cosd(angle_fi);
    t2_sy=t2_y-t_halflen*sind(angle_fi);

    t3_sx=t3_x-t_halflen*cosd(angle_fi);
    t3_sy=t3_y-t_halflen*sind(angle_fi);
    %__________________________


    %--------TN_EX,TN_EY----Ending points of tyres-----
    t0_ex=t0_x+t_halflen*cosd(angle_v);
    t0_ey=t0_y+t_halflen*sind(angle_v);

    t1_ex=t1_x+t_halflen*cosd(angle_v);
    t1_ey=t1_y+t_halflen*sind(angle_v);

    t2_ex=t2_x+t_halflen*cosd(angle_fi);
    t2_ey=t2_y+t_halflen*sind(angle_fi);

    t3_ex=t3_x+t_halflen*cosd(angle_fi);
    t3_ey=t3_y+t_halflen*sind(angle_fi);
    %__________________________

  
    %--------Lines Drawing----------

    if status_cb
        if tft
            t0=line([t0_sx t0_ex],[t0_sy t0_ey]);
            t1=line([t1_sx t1_ex],[t1_sy t1_ey]);
            set(t0,'linewidth',t_wid,'color','y');
            set(t1,'linewidth',t_wid,'color','y');
        end
    else
            t0=line([t0_sx t0_ex],[t0_sy t0_ey]);
            t1=line([t1_sx t1_ex],[t1_sy t1_ey]);
            set(t0,'linewidth',t_wid,'color','y');
            set(t1,'linewidth',t_wid,'color','y');
    end
        
    if status_cb
        if trt
            t2=line([t2_sx t2_ex],[t2_sy t2_ey]);
            t3=line([t3_sx t3_ex],[t3_sy t3_ey]);
            set(t2,'linewidth',t_wid,'color','g');
            set(t3,'linewidth',t_wid,'color','g');
        end
    else
            t2=line([t2_sx t2_ex],[t2_sy t2_ey]);
            t3=line([t3_sx t3_ex],[t3_sy t3_ey]);
            set(t2,'linewidth',t_wid,'color','g');
            set(t3,'linewidth',t_wid,'color','g');
    end
    
    if status_cb    
        if tvb 
            l0=line([x0 x1],[y0 y1]);
            l1=line([x1 x3],[y1 y3]);
            l2=line([x2 x3],[y2 y3]);
            l3=line([x0 x2],[y0 y2]);
            set(l0,'linewidth',4,'color','m');
            set(l1,'linewidth',l_wid,'color','b');
            set(l2,'linewidth',l_wid,'color','b');
            set(l3,'linewidth',l_wid,'color','b');
        end
    else
            l0=line([x0 x1],[y0 y1]);
            l1=line([x1 x3],[y1 y3]);
            l2=line([x2 x3],[y2 y3]);
            l3=line([x0 x2],[y0 y2]);
            set(l0,'linewidth',4,'color','m');
            set(l1,'linewidth',l_wid,'color','b');
            set(l2,'linewidth',l_wid,'color','b');
            set(l3,'linewidth',l_wid,'color','b');
    end
    
   
    l4=line([x-1 x+1],[y y]);
    l5=line([x x],[y-1 y+1]);

    if v<0
        set(l4,'linewidth',3,'color','c');
        set(l5,'linewidth',3,'color','c');
    else
        set(l4,'linewidth',3,'color','r');
        set(l5,'linewidth',3,'color','r');
    end

    
    graph_title=strcat('Steer : ',num2str(steer),' Tyre Angle : ',num2str(angle_t),' x : ',num2str(x),' y : ',num2str(y), 'Distance : ',num2str(dist));
    title(graph_title,'FontSize',15);
    
    drawnow;
    set(l4,'EraseMode');        %it is sufficient to put erasemode on one of the object of current figure, more erase commands we put, lesser becomes the speed of animation, hence it is advisable to put erasemode once only.
    
        
    %_________________________________

    

