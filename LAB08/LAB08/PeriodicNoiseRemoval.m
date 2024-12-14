% Read an image
img = imread('C:\Users\CSELAB-2\Desktop\Labb8\Input.jpg'); % Replace with your image file
img = im2double(img); % Convert to double for processing

% Convert to grayscale if the image is RGB
if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

% Perform FFT
F = fft2(img_gray);
F_shifted = fftshift(F); % Shift zero frequency components to center

% Create a filter to remove periodic noise
[m, n] = size(img_gray);
cutoff_radius = 30; % Adjust as necessary for your image
[x, y] = meshgrid(-n/2:n/2-1, -m/2:m/2-1);
distance = sqrt(x.^2 + y.^2);

% Create a circular high-pass filter
hp_filter = double(distance > cutoff_radius);

% Apply the filter in the frequency domain
F_filtered = F_shifted .* hp_filter;

% Inverse FFT to get the filtered image
filtered_F = ifftshift(F_filtered); % Shift back
img_filtered = ifft2(filtered_F);
img_filtered = real(img_filtered); % Take the real part

% Display input and output images in one figure
figure;

% Input Image
subplot(1, 2, 1); % 1 row, 2 columns, 1st subplot
imshow(img_gray);
title('Original Image');

% Filtered Image
subplot(1, 2, 2); % 1 row, 2 columns, 2nd subplot
imshow(img_filtered, []);
title('Filtered Image (Periodic Noise Removed)');

