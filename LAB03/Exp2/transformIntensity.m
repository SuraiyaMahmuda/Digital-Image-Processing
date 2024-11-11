% Define the input image and transformation parameters
inputImageFile = 'C:\Users\CSELAB-2\Desktop\New folder\beautiful-flower-nature.jpg'; % Replace with your image file

% Read the image
img = imread(inputImageFile);

% Convert to grayscale if the image is RGB
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert image to double for processing
img = double(img) / 255; % Normalize to [0, 1]

% Define the linear transformation parameters
a = 1.5; % Scaling factor
b = 0.2; % Offset

% Apply the linear transformation
transformed_img = a * img + b;

% Clip values to [0, 1] range
transformed_img = min(max(transformed_img, 0), 1);

% Convert back to uint8
transformed_img = uint8(255 * transformed_img);

% Display the original and transformed images
figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(transformed_img);
title('Transformed Image');
