function [ hist32 hist128 dom ] = calcfeatures( img )
% Computes the features of the given image.

[hmmd, map] = rgb2quanthmmd(img, 32);
hist32 = colordescriptor(hmmd, map);

[hmmd, map] = rgb2quanthmmd(img, 128);
hist128 = colordescriptor(hmmd, map);
    
dom = domcolor(img);

end
