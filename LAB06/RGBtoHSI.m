function [H, S, I] = rgb2hsi_image(input_path)
    % Function to convert an RGB image to HSI
    % Input: input_path - the file path of the input RGB image
    % Output: H - the Hue component
    %         S - the Saturation component
    %         I - the Intensity component

    % Read the RGB image from the input path
    rgb_image = imread('C:\Users\CSELAB-2\Desktop\LAB06\InputPicture.jpg');
    
    % Convert the RGB image to double for accurate calculations
    rgb_image = im2double(rgb_image);
    
    % Separate the RGB channels
    R = rgb_image(:,:,1);
    G = rgb_image(:,:,2);
    B = rgb_image(:,:,3);
    
    % Compute the intensity component (I)
    I = (R + G + B) / 3;

    % Compute the saturation component (S)
    min_RGB = min(min(R, G), B);
    S = 1 - (3 ./ (R + G + B + eps)) .* min_RGB;

    % Compute the hue component (H)
    theta = acos(0.5 * ((R - G) + (R - B)) ./ sqrt((R - G).^2 + (R - B) .* (G - B) + eps));
    H = theta;
    H(B > G) = 2 * pi - H(B > G);
    H = H / (2 * pi); % Normalize to [0, 1]

    % Display the original RGB image and H, S, I components
    figure;
    subplot(2,2,1);
    imshow(rgb_image);
    title('Original RGB Image');

    subplot(2,2,2);
    imshow(H);
    title('Hue Component');

    subplot(2,2,3);
    imshow(S);
    title('Saturation Component');

    subplot(2,2,4);
    imshow(I);
    title('Intensity Component');
end
