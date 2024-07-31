
function [x_2 mach]=fire_rule(rule_number,inp1,inp2,mf,delta,and_method)
init_conf_data;
mach_xpos=xpos(inp1,ruledata(rule_number,1),delta);
mach_phi=phi(inp2,ruledata(rule_number,2),delta);
if and_method==1
    mach=min(mach_xpos(mf),mach_phi(mf));
elseif and_method==2
    mach=max(mach_xpos(mf),mach_phi(mf));
else
    mach=(mach_xpos(mf))*(mach_phi(mf));
end
x_2=steering(mach,ruledata(rule_number,3));

    
