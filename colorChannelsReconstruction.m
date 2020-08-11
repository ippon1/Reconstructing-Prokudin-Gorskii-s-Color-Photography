function colorChannelsReconstruction()
    %pkg load image % only for octave
    
    clc;    % Clear command window. 
    clear;  % Delete all variables. 
    close all;  % Close all figure windows except those created by imtool. 
    imtool close all;   % Close all figure windows created by imtool. 
    workspace; % Make sure the workspace panel is showing. 
    
    imagesName = {'00125', '00149', '00153', '00351', '00398', '01112'}; % TODO edit here
    fileStoringLocation = 'results/';

    for i = imagesName
        disp(strcat('Current image ', i{1,1}));
        result = buildImage(i{1,1});
        label = strcat('image ', i{1,1} , '.jpg')
        figure;
        imshow(result); % octave flips image by 180 degrees
        title(label);
        imwrite(result, strcat(fileStoringLocation, label));
    end
end

function correctRGBImg = buildImage(id)
    umkreisGroesse = 15;
    fileLocation = 'data/';
    rgbColorChannels = ['R', 'G', 'B'];
    for i = 1:3
        loc = strcat(fileLocation, id, 'v_', rgbColorChannels(i));
        currentImages(:,:,i) = imread(loc, 'jpg');
    end

    correctRGBImg(:,:,1) = currentImages(:,:,1);
    B = currentImages(:,:,1);

    for i = 2:3
        i
        maxMetric = -inf;
        img = currentImages(:,:,i);

        for x = -umkreisGroesse:umkreisGroesse
            for y = -umkreisGroesse:umkreisGroesse
                tmp = circshift(img, [x y]);
                ncc = corr2(B, tmp);
                if ncc > maxMetric
                    maxMetric = ncc;
                    output(i, :) = [x y];
                end
            end
        end
        [output(i, 1) output(i, 2)]
        correctRGBImg(:,:,i) = circshift(img, [output(i, 1) output(i, 2)]);
    end
end
