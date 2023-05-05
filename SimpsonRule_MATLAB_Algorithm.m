function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x) ~= length(y)
   error('Matrix not square')
end
d=diff(x);
n=length(x);
for i=0:n-2
    if d==d(i+1)
        display('Matrix equally spaced')
    else
        error('Matrix is not equally spaced')
    end
end

if length(x)==2
    a=x(end-1);
    b=x(end);
  I=((b-a)/2) * (y(1) + y(n)) % Apply trapezoidal rule formula
  warning('trap rule use at end')
else if length(x)==3
    n=length(x)-1;
    a=x(1);
    b=x(end);
   I=(b-a)*(y(1)+4*y(2)+y(end))/(3*n); % Apply simpsons rule formula
else 
  endseg=0;
  
  if rem((length(x)-1), 2)~=0
     a1=x(end-1);
     b1=x(end);
  
     endseg=(b1-a1) * (y(end-1) + y(end)) / 2;
     x(length(x))=[];
     y(length(x))=[];
     warning('trap use on last segment')
  end
  
  n=length(x)-1;
  a=x(1);
  b=x(end);
  o=[];
  e=[];
  
  for i=1:length(x)
      if rem(i, 2)==0
          o(end+1)=y(i);
      end
  end
  for i=2:length(x)
      if rem(i, 2)~=0
          e(end+1)=y(i);
      end
  end
  
  I=(b-a)*(y(1)+4*sum(o)+2*sum(e)+y(end))/(3*n)+endseg;
  
    %simpeq=((b-a)/(3*n))*(y(1)+4*sum(3:2:n-1)+2*sum(2:2:n-2)+y(n));
    %I=simpeq+endseg

end

