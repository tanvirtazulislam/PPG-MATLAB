
vid=VideoReader('IMG_0416.mov');
numFrames = vid.NumberOfFrames;
n=numFrames;
for i = 1:1:5
frames = read(vid,i);
imwrite(frames,['Image' int2str(i), '.jpg']);
image(frames);
end

% Display them all.
subplot(2, 3, 1);
rgbImage = imread('Image1.jpg');
imshow(rgbImage);
fontSize = 20;
title('Frame 1', 'FontSize', fontSize)
subplot(2, 3, 2);
rgbImage = imread('Image2.jpg');
imshow(rgbImage);
title('Frame 2', 'FontSize', fontSize)
subplot(2, 3, 3);
rgbImage = imread('Image3.jpg');
imshow(rgbImage);
title('Frame 3', 'FontSize', fontSize)
subplot(2, 3, 4.5);
rgbImage = imread('Image4.jpg');
imshow(rgbImage);
title('Frame 4', 'FontSize', fontSize)
subplot(2, 3, 5.5);
rgbImage = imread('Image5.jpg');
imshow(rgbImage);
title('Frame 5', 'FontSize', fontSize)

% Set up figure properties:
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 1, 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
% set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')