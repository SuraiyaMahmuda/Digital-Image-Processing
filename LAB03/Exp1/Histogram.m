% Read the input image
input_image = imread('C:\Users\CSELAB-2\Desktop\New folder\beautiful-flower-nature.jpg'); % Replace 'example.jpg' with your image file

% Convert to grayscale if it's a color image
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
end

% Display the original image
figure;
subplot(2, 2, 1);
imshow(input_image);
title('Original Image');

% Compute and display the histogram of the original image
subplot(2, 2, 2);
imhist(input_image);
title('Histogram of Original Image');

% Perform histogram equalization
equalized_image = histeq(input_image);

% Display the equalized image
subplot(2, 2, 3);
imshow(equalized_image);
title('Equalized Image');

% Compute and display the histogram of the equalized image
subplot(2, 2, 4);
imhist(equalized_image);
title('Histogram of Equalized Image');

% Optional: Save the results
imwrite(equalized_image, 'equalized_image.jpg'); % Save the equalized image
