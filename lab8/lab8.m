% Title: To demonstrate feature extraction
% Three critical statements
close all;
clear variables;
clc;

% User input section
I = imread('coins.jpg');             % Corrected 'imred' to 'imread'
I = imresize(I, [256, 256]);
I = rgb2gray(I);                     % Convert to grayscale
imshow(I), title('Grayscale Image');

I2 = imbinarize(I);                 
figure, imshow(I2), title('Binary Image');

% Connected components
cc = bwconncomp(I2, 8);              % 8-connectivity

% Feature extraction using regionprops
stats = regionprops(cc, 'Area', 'Perimeter', 'MajorAxisLength', 'MinorAxisLength');

n = cc.NumObjects;                   % Total number of components
Perimeter = zeros(n, 1);
MajorAxis = zeros(n, 1);
MinorAxis = zeros(n, 1);
Area = zeros(n, 1);

for i = 1:n
    Area(i) = stats(i).Area;
    Perimeter(i) = stats(i).Perimeter;
    MajorAxis(i) = stats(i).MajorAxisLength;
    MinorAxis(i) = stats(i).MinorAxisLength;
end

% Display the features in command window
disp('Object #    Area     Perimeter   MajorAxis   MinorAxis');
for i = 1:n
    fprintf('Obj %2d:   %6.2f   %6.2f     %6.2f     %6.2f\n', ...
        i, Area(i), Perimeter(i), MajorAxis(i), MinorAxis(i));
end
