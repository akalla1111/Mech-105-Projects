function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
ea=100;
xroot=xl;
iter=0;
if nargin < 3
  error('Three arguements are needed')
end

if nargin < 5
  maxit = 200;
end

if nargin < 4
  es = 0.0001;
end

if func(xu)*func(xl)>0
    error('no sign change found');
end

while ea>es && iter<maxit
   xold=xroot;
   iter=iter+1;
  xroot = xu - ((func(xu) * (xl - xu)) / (func(xl) - func(xu)));
 
      test = func(xroot)*func(xl);
  
  if test < 0
      xu = xroot;
  elseif test > 0
      xl = xroot;
  else
      ea = 0;
  end
  ea = abs((xroot-xold)/xroot) * 100;
end
  root=xroot;
fx=func(xroot);
iter=1;

end