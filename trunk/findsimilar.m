function [ sims ] = findsimilar( img )
% Finds the most similar images to the given image.

similarities = [];

% should load this elsewhere for speed
load db/features

[csd32 csd128 dom] = calcfeatures(img);

for i = 1:size(names, 1)
    a = pdist([csd32; csd32hist(i, :)]);
    b = pdist([csd128; csd128hist(i, :)]);
    c = domcolordist(dom, domcolors((i*5-4):i*5, :));
    similarities = [similarities; a b c];
end

% normalize the columns
for i = 1:size(similarities, 2)
    m = mean(similarities(:, i));
    s = std(similarities(:, i));
    similarities(:, i) = (similarities(:, i) - m) ./ s;   
end

% add the similarities together
sims = sum(similarities');

[val I] = sort(sims);

figure;
for i = 1:size(I, 2);
    f = imread(['db/' names(I(i), :)]);
    subplot(4,3,i);
    imshow(f);
end

end
