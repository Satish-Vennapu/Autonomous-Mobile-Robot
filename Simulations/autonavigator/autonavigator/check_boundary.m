function [break_status] =check_boundary(x,y)

break_status=0;


if x<0 | x>200
    disp('not a valid position in x');
    break_status=1;
end

if y<0 | y>200
    disp('not a valid position in y');
    break_status=1;
end