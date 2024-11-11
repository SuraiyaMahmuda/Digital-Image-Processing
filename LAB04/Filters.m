% Read the color image
colorImage = imread('C:\Users\CSELAB-2\Desktop\Lab04\Filters.jpg');

% Separate the color channels
redChannel = colorImage(:,:,1);
greenChannel = colorImage(:,:,2);
blueChannel = colorImage(:,:,3);

% Mean Filter
meanFilter = fspecial('average', [3 3]);
meanFilteredRed = imfilter(redChannel, meanFilter);
meanFilteredGreen = imfilter(greenChannel, meanFilter);
meanFilteredBlue = imfilter(blueChannel, meanFilter);
meanFilteredImage = cat(3, meanFilteredRed, meanFilteredGreen, meanFilteredBlue);

% Median Filter
medianFilteredRed = medfilt2(redChannel, [3 3]);
medianFilteredGreen = medfilt2(greenChannel, [3 3]);
medianFilteredBlue = medfilt2(blueChannel, [3 3]);
medianFilteredImage = cat(3, medianFilteredRed, medianFilteredGreen, medianFilteredBlue);

% Gaussian Filter
gaussianFilter = fspecial('gaussian', [3 3], 0.5);
gaussianFilteredRed = imfilter(redChannel, gaussianFilter);
gaussianFilteredGreen = imfilter(greenChannel, gaussianFilter);
gaussianFilteredBlue = imfilter(blueChannel, gaussianFilter);
gaussianFilteredImage = cat(3, gaussianFilteredRed, gaussianFilteredGreen, gaussianFilteredBlue);

% Display the original and filtered images
figure;
subplot(2,2,1), imshow(colorImage), title('Original Image');
subplot(2,2,2), imshow(meanFilteredImage), title('Mean Filtered Image');
subplot(2,2,3), imshow(medianFilteredImage), title('Median Filtered Image');
subplot(2,2,4), imshow(gaussianFilteredImage), title('Gaussian Filtered Image');

