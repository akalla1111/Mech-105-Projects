%Given constants of problem
g = 9.81;
mu = 0.55;
F = 150;
m = 25;

% Plot of function displaying root
x=linspace (0,90,1);
func = @(x) mu*m*g/(cosd(x) + mu*sind(x)) - F;
F=150;
y=func(x);
plot (x, y);
xlabel ('Degrees');
ylabel ('Value of the function');
title ('Degrees vs Value of the function');
grid;
hold on;

%Use bisection method to solve for root
[angle, fx, ea, iter] = bisect(func, 0, 90);

%Display angle and fx from equation solution
format long;
formatSpec = 'The function is %8.4f units.';
fprintf(formatSpec,angle,fx)
