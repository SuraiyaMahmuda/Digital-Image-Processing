% Read the input image
img = imread('C:\Users\CSELAB-2\Desktop\LAB07\Dia.jpg'); % Replace with your image file

% Convert to grayscale if it's a color image
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert to binary image
bw = imbinarize(img);

% Define a structuring element
se = strel('disk', 5); % You can change the size and shape

% Perform erosion
eroded_image = imerode(bw, se);

% Display the original and eroded images
figure;
subplot(1, 2, 1);
imshow(bw);
title('Original Binary Image');

subplot(1, 2, 2);
imshow(eroded_image);
title('Eroded Image');
