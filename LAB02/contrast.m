% Step 1: Read the RGB image
img = imread('C:\Users\CSELAB-2\Desktop\GIPLab02\contast.jpg'); % Replace 'your_image.jpg' with your image filename

% Step 2: Define the stretching parameters
min_out = 0;       % Minimum intensity of the output image
max_out = 255;     % Maximum intensity of the output image

% Initialize the stretched image
img_stretched = img;

% Process each channel separately
for c = 1:size(img, 3)
    % Get the current channel
    channel = img(:,:,c);
   
    % Define the input range for the current channel
    min_in = double(min(channel(:)));
    max_in = double(max(channel(:)));
   
    % Apply contrast stretching
    channel_double = double(channel);
    channel_stretched = ((channel_double - min_in) / (max_in - min_in)) * (max_out - min_out) + min_out;
   
    % Store the result in the output image
    img_stretched(:,:,c) = uint8(channel_stretched);
end

% Step 3: Display the original and stretched images
figure; % Open a new figure window

subplot(1,2,1);
imshow(img);
title('Original RGB Image');

subplot(1,2,2);
imshow(img_stretched);
title('Contrast Stretched RGB Image');
