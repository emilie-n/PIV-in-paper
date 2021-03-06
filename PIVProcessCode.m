test = dlmread('10mm1_fine.dat');
x = test(:,1);
x = x .* 0.227;
y = test(:,2);
y = y .* 0.227;
u = test(:,3);
u = u .* 9.08;
v = test(:,4);
v = v.* 9.08;

figure
q1 = quiver(x, y, u, v); %plots vector field from EDPIV data

%Histogram
figure
lengthField = sqrt((u.^2) + (v.^2));
edges = [0 2 4 6 8 10 12 14 16 18];
histogram(lengthField, edges);
ylim([0 200])
xlim([0 20])
ylabel('Vector Count');
xlabel('Velocity (mm/s)');
title('25 mm Velocity Vector Histogram')

%Create vectors describing average motion in field of view
xTot = mean(x);
yTot = mean(y);
uTot = mean(u);
vTot = mean(v);

veclength = sqrt((uTot^2) + (vTot^2));
mmlength = veclength *1e-3;
vLengthmm = vTot *1e-3;
umedian = median(u);
vmedian = median(v);
medianLength = sqrt((umedian^2) + (vmedian^2)); %median length of all vectors
maxLength = max(lengthField, 10);

figure
img = imread('10mm1_OverlappingPlus_snip.jpg');
img = flip(img);
xImg = linspace(min(x), max(x), size(img, 1));
yImg = linspace(min(y), max(y), size(img, 2));
image(xImg, yImg, img, 'CDataMapping', 'scaled');
hold on
xm = flip(x);
ym = flip(y);
um = -1 .* u;
um2 = flip(um);
vm = -1 .*v;
q2 = quiver(x,y,u,v);
q2.LineWidth = 1.5;
q2.Color = 'red';
q2.AutoScale = 'off';
hold on
ulength = length(u);
vlength = length(v);
u1 = zeros(ulength,1);
u1(17) = 5;
v1 = zeros(vlength,1);
v1(17) = -5;
q3 = quiver(x, y, u1, v1);
q3.LineWidth = 1.5;
q3.Color = 'green';
q3.AutoScale = 'off';
hold off
axis off