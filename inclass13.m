%Inclass 13
%Walter Frank Lenoir

%Part 1. In this directory, you will find an image of some cells expressing a 
% fluorescent protein in the nucleus. 

% A. Create a new image with intensity normalization so that all the cell
% nuclei appear approximately eqully bright. 

img = imread('./Dish1Well8Hyb1Before_w0001_m0006.tif');
img = im2double(img);
img_dilate = imdilate(img,strel('disk',60));
img_norm = img./img_dilate;
imshow(img_norm,[]);

% B. Threshold this normalized image to produce a binary mask where the nuclei are marked true. 
imgmask = img_norm > 0.95;
imshow(imgmask);

% C. Run an edge detection algorithm and make a binary mask where the edges
% are marked true.

edge_img = edge(img,'canny',[]);
imshow(edge_img,[]);

% D. Display a three color image where the orignal image is red, the
% nuclear mask is green, and the edge mask is blue. 

toshow = cat(3,img,im2double(imgmask),im2double(edge_img));
imshow(toshow);

%Part 2. Continue with your nuclear mask from part 1.
%Walter Frank Lenoir 

%A. Use regionprops to find the centers of the objects
cents = regionprops(imgmask,'centroid');

%B. display the mask and plot the centers of the objects on top of the
%objects

centroids = cat(1, cents.Centroid);
imshow(imgmask);
hold(imgca,'on');
plot(imgca,centroids(:,1), centroids(:,2), '*');
hold(imgca,'off');


%C. Make a new figure without the image and plot the centers of the objects
%so they appear in the same positions as when you plot on the image (Hint: remember
%Image coordinates). 

plot(centroids(:,1), centroids(:,2), '*') 
xlim([0 1024]);
ylim([0 1024]);
