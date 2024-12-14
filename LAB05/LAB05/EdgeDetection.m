% Read the input image
img = imread('C:\Users\CSELAB-2\Desktop\LAB05\EdgeDetection.jpeg');
gray_img = rgb2gray(img);  % Convert to grayscale if it's an RGB image

% Prewitt operator
prewitt_edges = edge(gray_img, 'Prewitt');

% Roberts operator
roberts_edges = edge(gray_img, 'Roberts');

% Sobel operator
sobel_edges = edge(gray_img, 'Sobel');

% Isotropic operator (Approximation using Canny operator for isotropic behavior)
isotropic_edges = edge(gray_img, 'Canny');

% Displaying results
figure;
subplot(2,2,1), imshow(prewitt_edges), title('Prewitt Edge Detection');
subplot(2,2,2), imshow(roberts_edges), title('Roberts Edge Detection');
subplot(2,2,3), imshow(sobel_edges), title('Sobel Edge Detection');
subplot(2,2,4), imshow(isotropic_edges), title('Isotropic (Canny) Edge Detection');
