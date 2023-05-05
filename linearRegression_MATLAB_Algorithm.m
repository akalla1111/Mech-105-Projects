function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set

%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set

% Check for size match x and y
if size(x)~=size(y)
    error('Array x and y are not the same size')
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)



%IQR for y values
med=median(sortedY);

Q1=median(sortedY(sortedY<med));
Q3=median(sortedY(sortedY>med));

IQR=Q3-Q1;
IQR_lim=IQR*1.5

%outliers for y values detected and removed
outliers=sortedY<Q1-IQR_lim|sortedY>IQR_lim+Q3
fY=sortedY(~outliers)
fX=sortedX(~outliers)



%Solve for m in y=mx+b
n=length(fY);
topm=n*sum(fX.*fY)-sum(fX)*sum(fY);
bottomm=n*sum(fX.^2)-sum(fX)^2;
slope=topm/bottomm

%Solve for b in y=mx+b
topb=sum(fY)-slope*sum(fX);
intercept=topb/n

%Equation in slope intercept form
fprintf("y= %d\n x + %d\n", slope, intercept)


%R^2 method
%1. calculate mean
%1. calculate SS_tot
%1. calculate SS_res
mean=sum(fY)/n;
SS_res=sum((fY-intercept-slope*fX).^2);
SS_tot=sum((fY-mean).^2);
Rsquared=1-(SS_res/SS_tot)
  




%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

end