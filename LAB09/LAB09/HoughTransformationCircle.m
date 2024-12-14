% Read the input image
img = imread('C:\Users\CSELAB-2\Desktop\Lab09\Input.jpg');  % Replace with your image file path
gray_img = rgb2gray(img);         % Convert to grayscale if necessary

% Define the radius range for the circles (adjust based on your image)
min_radius = 20;
max_radius = 50;

% Perform Hough Transform to find circles
[centers, radii, metric] = imfindcircles(gray_img, [min_radius max_radius], ...
                                         'Sensitivity', 0.9, 'EdgeThreshold', 0.1);

% Display the original image
figure, imshow(img), hold on

% Plot detected circles
viscircles(centers, radii, 'EdgeColor', 'b');

% Plot the centers of the circles
plot(centers(:,1), centers(:,2), 'x', 'LineWidth', 2, 'Color', 'r');

title('Detected Circles');
hold off
