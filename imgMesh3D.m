% Load the image
img = imread('MESSI.jpg');

% Select the segment of interest
[x,y] = ginput(2);
x1 = round(min(x));
x2 = round(max(x));
y1 = round(min(y));
y2 = round(max(y));

% Check the values of x1, x2, y1, and y2
if x1 <= 0 || x2 > size(img, 2) || y1 <= 0 || y2 > size(img, 1)
    error('Selected segment is out of bounds');
end

% Select the segment
segment = img(y1:y2,x1:x2,:);

% Plot the segment as an image
figure;
subplot(1,3,1);
imshow(segment);

% Plot the 3D mesh
[X,Y] = meshgrid(1:size(segment,2),1:size(segment,1));
Z = double(segment(:,:,1));
subplot(1,3,2);
mesh(X,Y,Z);

% Plot the surface
subplot(1,3,3);
surf(X,Y,Z);
