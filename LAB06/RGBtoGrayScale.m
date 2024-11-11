function grayscale_image = rgb_to_grayscale(input_path)
    % Function to convert an RGB image to grayscale
    % Input: input_path - the file path of the input RGB image
    % Output: grayscale_image - the grayscale image

    % Read the RGB image from the input path
    rgb_image = imread('C:\Users\CSELAB-2\Desktop\LAB06\InputPicture.jpg');
    
    % Convert the RGB image to grayscale using the built-in function
    grayscale_image = rgb2gray(rgb_image);
    
    % Display the original RGB image and the grayscale image
    figure;
    
    subplot(1,2,1);
    imshow(rgb_image);
    title('Original RGB Image');
    
    subplot(1,2,2);
    imshow(grayscale_image);
    title('Grayscale Image');
end
