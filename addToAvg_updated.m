function [average_red, average_green, average_blue]= addToAvg_updated(inputImage)
I = inputImage;




Ired= I(:,:,1);
Igreen= I(:,:,2);
Iblue= I(:,:,3);


%ihue= Ired(rgb2hsv);

average_red= mean(Ired(:));
average_green = mean(Igreen(:));
average_blue = mean(Iblue(:));
% mnumber=average_red;
%degree=average*360;

end


