function [R_colored, G_colored, B_colored] = rgb_to_colored_channels(input_path)
    % Function to separate an RGB image into colored Red, Green, and Blue channels
    % Input: input_path - the file path of the input RGB image
    % Output: R_colored - Red channel as a colored image
    %         G_colored - Green channel as a colored image
    %         B_colored - Blue channel as a colored image

    % Read the RGB image from the input path
    rgb_image = imread('C:\Users\CSELAB-2\Desktop\LAB06\InputPicture.jpg');
    
    % Initialize colored channel images
    R_colored = zeros(size(rgb_image)); % Red channel image
    G_colored = zeros(size(rgb_image)); % Green channel image
    B_colored = zeros(size(rgb_image)); % Blue channel image
    
    % Assign the R, G, B values to the respective channels
    R_colored(:,:,1) = rgb_image(:,:,1); % Keep Red channel
    G_colored(:,:,2) = rgb_image(:,:,2); % Keep Green channel
    B_colored(:,:,3) = rgb_image(:,:,3); % Keep Blue channel
    
    % Convert channel images to uint8 for proper display
    R_colored = uint8(R_colored);
    G_colored = uint8(G_colored);
    B_colored = uint8(B_colored);
    
    % Display the original RGB image and colored R, G, B channel images
    figure;
    
    subplot(2,2,1);
    imshow(rgb_image);
    title('Original RGB Image');
    
    subplot(2,2,2);
    imshow(R_colored);
    title('Red Channel (Colored)');
    
    subplot(2,2,3);
    imshow(G_colored);
    title('Green Channel (Colored)');
    
    subplot(2,2,4);
    imshow(B_colored);
    title('Blue Channel (Colored)');
end
