% Read the source and target images
I_source = imread('C:\Users\CSELAB-2\Desktop\New folder\Source.jpg'); % Replace with your source image file
I_target = imread('C:\Users\CSELAB-2\Desktop\New folder\Target.jpg'); % Replace with your target image file

% Convert images to grayscale if needed
I_source_gray = rgb2gray(I_source);
I_target_gray = rgb2gray(I_target);

% Compute histograms
[counts_source, gray_levels_source] = imhist(I_source_gray);
[counts_target, gray_levels_target] = imhist(I_target_gray);

% Compute cumulative histograms
cdf_source = cumsum(counts_source) / numel(I_source_gray);
cdf_target = cumsum(counts_target) / numel(I_target_gray);

% Create an empty mapping array
mapping = zeros(256, 1);

% Mapping source CDF to target CDF
for i = 1:256
    [~, idx] = min(abs(cdf_source(i) - cdf_target));
    mapping(i) = gray_levels_target(idx);
end

% Apply the mapping to the source image
I_source_mapped = uint8(arrayfun(@(x) mapping(x + 1), I_source_gray));

% Display the results
figure;
subplot(1, 3, 1);
imshow(I_source_gray);
title('Original Source Image');

subplot(1, 3, 2);
imshow(I_target_gray);
title('Target Image');

subplot(1, 3, 3);
imshow(I_source_mapped);
title('Histogram-Matched Image');
