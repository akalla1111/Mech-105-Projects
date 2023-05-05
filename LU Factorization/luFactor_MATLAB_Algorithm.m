function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
%Pivot 1
rows=size(A,1);
if size(A,2)~=rows
   error('Matrix not square')
end
curow=1;
curcol=1;

P=eye(rows);
L=eye(rows);

for a=1:rows-1
   for i=curow:rows
       if A(curow,curcol)<abs(A(i,curcol))
           or=A(curow,:);
           A(curow, :)=A(i, :);
           A(i, :)=or;
          
           P([curow i], :)=P([i curow], :); %permutation matrix here
           L([a, i], 1:a-1) = L([i, a], 1: a-1); %to expand matrix
       end
   end
  
for i=curow:rows-1
   factor=A(i+1, curcol)/A(curow, curcol); %a21/a11
   L(i+1, curcol)=factor; %add factor into l matrix
   
   row1=A(curow, :)*factor; %multiply row by factor
   row2=A(i+1, :); %change row position
   
   A(i+1, :)=row2-row1; %subtract 2nd row from 1st row
   
end

curcol=curcol+1;
curow=curow+1;
end

U=A;






% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix


end