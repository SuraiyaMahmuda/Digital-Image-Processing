% Read an image
img = imread('C:\Users\LAB203\Desktop\Input.jpg'); % Replace with your image file
img = im2double(img); % Convert to double for processing

% Add Salt and Pepper Noise
noise_density = 0.05; % Density of noise
noisy_img = imnoise(img, 'salt & pepper', noise_density);

% Remove Salt and Pepper Noise using Median Filter
filtered_img = img; % Initialize filtered image
if size(noisy_img, 3) == 3
    % If the image is RGB, apply median filter to each channel
    filtered_img = zeros(size(noisy_img)); % Initialize filtered image for RGB
    for i = 1:3
        filtered_img(:,:,i) = medfilt2(noisy_img(:,:,i)); % Apply median filter to each channel
    end
else
    % For grayscale image
    filtered_img = medfilt2(noisy_img);
end

% Display images in one figure
figure;

% Original Image
subplot(1, 3, 1); % 1 row, 3 columns, 1st subplot
imshow(img);
title('Original Image');

% Image with Salt and Pepper Noise
subplot(1, 3, 2); % 1 row, 3 columns, 2nd subplot
imshow(noisy_img);
title('Image with Salt and Pepper Noise');

% Filtered Image
subplot(1, 3, 3); % 1 row, 3 columns, 3rd subplot
imshow(filtered_img);
title('Filtered Image (Median Filter)');