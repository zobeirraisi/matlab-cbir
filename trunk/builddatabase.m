function [  ] = builddatabase(  )
% Generates a database of features based on the images in the db/ folder.

d = dir('db/*.jpg');
names = [];

csd32hist = [];
csd128hist = [];
domcolors = [];
edges = [];

for i = 1:size(d, 1)
    fprintf('Extracting features for %s... ', d(i).name);
    names = strvcat(names, d(i).name);
    img = imread(['db/' d(i).name]);

    tic;
    [hist32 hist128 dom edge] = calcfeatures(img);
    csd32hist = [csd32hist; hist32];
    csd128hist = [csd128hist; hist128];
    domcolors = [domcolors; dom];
    edges = [edges; edge];
    toc;
end

save db/features names csd32hist csd128hist domcolors edges

end
