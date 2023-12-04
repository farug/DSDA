
% 3x3 Laplacian kernel
kernel = [ -1 -1 -1; -1 8 -1; -1 -1 -1]; 

image = imread('cameraman.tif');
image2 = conv2(image,kernel,'same');
image2 = uint8(image2);

subplot(1,2,1);
imshow(image);

subplot(1,2,2);
imshow(image2);  % net effect is detection of edges of the image


