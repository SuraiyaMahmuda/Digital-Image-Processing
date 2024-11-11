% Read the color image
colorImage = imread('C:\Users\CSELAB-2\Desktop\Lab04\Filters.jpg');

% Display original image size
originalSize = size(colorImage);
disp('Original Image Size:');
disp(originalSize);

% Resize the image using nearest-neighbor interpolation
scaleFactor = 0.5; % Example scale factor for downscaling
nearestNeighborResizedImage = imresize(colorImage, scaleFactor, 'nearest');

% Display nearest-neighbor resized image size
nearestNeighborSize = size(nearestNeighborResizedImage);
disp('Nearest-Neighbor Resized Image Size:');
disp(nearestNeighborSize);

% Resize the image using linear interpolation
linearResizedImage = imresize(colorImage, scaleFactor, 'bilinear');

% Display linear interpolation resized image size
linearSize = size(linearResizedImage);
disp('Linear Interpolation Resized Image Size:');
disp(linearSize);

% Resize the image using pixel skipping method
skipFactor = 1.0/scaleFactor; % Example skip factor
pixelSkippedImage = colorImage(1:skipFactor:end, 1:skipFactor:end, :);

% Display pixel skipping resized image size
pixelSkippedSize = size(pixelSkippedImage);
disp('Pixel Skipping Resized Image Size:');
disp(pixelSkippedSize);

% Display the original and resized images with dimensions
figure;
subplot(2,2,1), imshow(colorImage), title(['Original Image (' num2str(originalSize(1)) 'x' num2str(originalSize(2)) ')']);
subplot(2,2,2), imshow(nearestNeighborResizedImage), title(['Replication Resized (' num2str(nearestNeighborSize(1)) 'x' num2str(nearestNeighborSize(2)) ')']);
subplot(2,2,3), imshow(linearResizedImage), title(['Linear Interpolation Resized (' num2str(linearSize(1)) 'x' num2str(linearSize(2)) ')']);
subplot(2,2,4), imshow(pixelSkippedImage), title(['Pixel Skipping Resized (' num2str(pixelSkippedSize(1)) 'x' num2str(pixelSkippedSize(2)) ')']);