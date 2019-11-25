function [x , e] = regula_falsi_root_finder(f,a,b)
% Anonymous function - @(x)(sin(x))
% here @(x) says that x is a parameter
% followed by the function 
iter=0;
tolerance=1e-6;
y1=f(a);
y2=f(b);
x1=a;
x2=b;


while iter<1000
    x3=x1-(y1*((x2-x1)/(y2-y1)));
    if x3>a
        if x3>b
            x=NaN;
            e=NaN;
            break
        end 
    end
    
    if x3<a
        if x3<b
            x=NaN;
            e=NaN;
            break
        end 
    end
    
    if abs(f(x3)) < tolerance
        x=x3;
        e=abs(f(x3));
        break
    end
    
    if f(x3)*f(x1)<0
        x2=x3;
        y2=f(x3);
    else 
        x1=x3;
        y1=f(x3);
    end    
iter=iter+1;
    
end

if iter==1000
    if abs(f(x3)) < tolerance
        x=x3;
        e=abs(f(x3));
    else
        x=NaN;
        e=NaN;
    end


end

end