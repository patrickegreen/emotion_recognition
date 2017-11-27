function [] = plotImage(img, interests, imgtitle, output, display)
    sizeImg = size(img);
    imagesc(img);
    axis('image');
    colormap('gray');
    title(imgtitle);
    hold on
    for interest = interests
        [y,x] = ind2sub(sizeImg, interest);    % get 2D indices
        plot(x,y,'r*');     % plot corners
    end
    hold off
    if display
        pause;
    end
    if output
        print(output, '-dpng');
    end
end

