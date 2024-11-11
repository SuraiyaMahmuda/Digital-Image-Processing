% Read an image
img = imread('C:\Users\CSELAB-2\Desktop\Lab09\Input.jpg');  % Replace with your image file path
gray_img = rgb2gray(img);         % Convert to grayscale

% Apply edge detection
edges = edge(gray_img, 'canny');  % Use Canny edge detector

% Apply the Hough Transform
[H, theta, rho] = hough(edges);

% Detect peaks in the Hough Transform
peaks = houghpeaks(H, 5, 'threshold', ceil(0.3 * max(H(:))));

% Find lines based on Hough peaks
lines = houghlines(edges, theta, rho, peaks, 'FillGap', 5, 'MinLength', 7);

% Display the results
figure, imshow(img), hold on
for k = 1:length(lines)
    % Get endpoints of each line segment
    xy = [lines(k).point1; lines(k).point2];
    
    % Plot each line in red
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'red');
    
    % Mark the beginnings and ends of each line with a green circle
    plot(xy(1,1), xy(1,2), 'x', 'LineWidth', 2, 'Color', 'green');
    plot(xy(2,1), xy(2,2), 'x', 'LineWidth', 2, 'Color', 'yellow');
end
title('Detected Lines')
hold off
