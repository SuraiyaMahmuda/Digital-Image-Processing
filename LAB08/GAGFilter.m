% Read an image
img = imread('C:\Users\CSELAB-2\Desktop\Labb8\Input.jpg'); % Replace with your image file
img = im2double(img); % Convert to double for processing

% Display original image
figure;

% Original Image
subplot(2, 2, 1); % 2 rows, 2 columns, 1st subplot
imshow(img);
title('Original Image');

% Add Gaussian Noise
mean_g = 0; % Mean of Gaussian noise
var_g = 0.01; % Variance of Gaussian noise
gaussian_noise = mean_g + sqrt(var_g) * randn(size(img)); % Generate Gaussian noise
noisy_img = img + gaussian_noise; % Corrupt the image with noise

% Ensure the noisy image remains within the valid range [0, 1]
noisy_img = min(max(noisy_img, 0), 1);

% Display image with Gaussian Noise
subplot(2, 2, 2); % 2nd subplot
imshow(noisy_img);
title('Image with Gaussian Noise');

% Apply 3x3 Arithmetic Mean Filter
mean_filter = fspecial('average', 3); % Create a 3x3 mean filter
filtered_mean_img = imfilter(noisy_img, mean_filter, 'replicate'); % Apply filter

% Display filtered image using Arithmetic Mean Filter
subplot(2, 2, 3); % 3rd subplot
imshow(filtered_mean_img);
title('Filtered Image (Arithmetic Mean Filter)');

% Apply 3x3 Geometric Mean Filter
% Initialize the filtered image
filtered_geom_img = zeros(size(noisy_img));

% Apply Geometric Mean Filter
for i = 1:size(noisy_img, 1)
    for j = 1:size(noisy_img, 2)
        % Get the neighborhood
        neighborhood = noisy_img(max(i-1, 1):min(i+1, size(noisy_img, 1)), ...
                                 max(j-1, 1):min(j+1, size(noisy_img, 2)), :);
        % Calculate the geometric mean for each channel
        filtered_geom_img(i, j, :) = exp(mean(log(neighborhood + eps), [1 2])); % +eps to avoid log(0)
    end
end

% Display filtered image using Geometric Mean Filter
subplot(2, 2, 4); % 4th subplot
imshow(filtered_geom_img);
title('Filtered Image (Geometric Mean Filter)');
