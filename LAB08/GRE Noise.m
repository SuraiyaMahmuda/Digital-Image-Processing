% Read an image
img = imread('C:\Users\CSELAB-2\Desktop\Labb8\Input.jpg'); % Replace with your image file
img = im2double(img); % Convert to double for processing

% Add Gaussian Noise
mean_g = 0; % Mean of Gaussian noise
var_g = 0.01; % Variance of Gaussian noise
gaussian_noise = mean_g + sqrt(var_g) * randn(size(img));
img_gaussian = img + gaussian_noise;

% Add Rayleigh Noise
scale_r = 0.1; % Scale parameter for Rayleigh noise
rayleigh_noise = raylrnd(scale_r, size(img));
img_rayleigh = img + rayleigh_noise;

% Add Erlang Noise
k = 2; % Shape parameter (k > 0)
scale_e = 0.1; % Scale parameter for Erlang noise
erlang_noise = gamrnd(k, scale_e, size(img)); % Gamma distribution for Erlang
img_erlang = img + erlang_noise;

% Ensure that the images remain in the range [0, 1] after adding noise
img_gaussian = min(max(img_gaussian, 0), 1);
img_rayleigh = min(max(img_rayleigh, 0), 1);
img_erlang = min(max(img_erlang, 0), 1);

% Display images in one figure
figure;

% Original Image
subplot(2, 2, 1); % 2 rows, 2 columns, 1st subplot
imshow(img);
title('Original Image');

% Image with Gaussian Noise
subplot(2, 2, 2); % 2 rows, 2 columns, 2nd subplot
imshow(img_gaussian);
title('Image with Gaussian Noise');

% Image with Rayleigh Noise
subplot(2, 2, 3); % 2 rows, 2 columns, 3rd subplot
imshow(img_rayleigh);
title('Image with Rayleigh Noise');

% Image with Erlang Noise
subplot(2, 2, 4); % 2 rows, 2 columns, 4th subplot
imshow(img_erlang);
title('Image with Erlang Noise');