% Three-Dimensional Plots
% source: https://octave.org/doc/v4.2.2/Three_002dDimensional-Plots.html

tx = ty = linspace (-8, 8, 41)';
[xx, yy] = meshgrid (tx, ty);
r = sqrt (xx .^ 2 + yy .^ 2) + eps;
tz = sin (r) ./ r;
mesh (tx, ty, tz);
xlabel ("t_x");
ylabel ("t_y");
zlabel ("t_z");
title ("3D Plot");

print plot.pdf