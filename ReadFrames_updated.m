
filename = 'Sample_Bablu_Trial_no_3.MOV';
mov = VideoReader(filename);

numFrames = mov.NumberOfFrames;

numFramesWritten = 0;

imgarray_red=[];
imgarray_green=[];
imgarray_blue=[];

for t =  701:numFrames-400 %t = 901: (numFrames-900)
    
currFrame = read(mov, t);  

[value_red, value_green, value_blue] = addToAvg_updated(currFrame);

value_red = value_red/255; 
value_green = value_green/255;
value_blue = value_blue/255;

imgarray_red = [imgarray_red value_red];
imgarray_green = [imgarray_green value_green];
imgarray_blue = [imgarray_blue value_blue];

end 

difference=1/(30);
x=difference:difference:(numFrames-1800)*difference; 
% totaltime=(numFrames-30)*difference;

fliparray=fliplr(imgarray_red);
marray_red=detrend(fliparray);

fliparray=fliplr(imgarray_green);
marray_green=detrend(fliparray);

fliparray=fliplr(imgarray_blue);
marray_blue=detrend(fliparray);


% subplot 311
% plot(x, marray_red, 'Color', [0 0 0 0.7]);
% axis tight
% % title('Red');
% xlabel('(a)');
% % ylabel('Amplitude');
% 
% subplot 312
% plot(x, marray_green, 'Color', [0 0 0 0.7]);
% axis tight
% % title('Green');
% xlabel('(b)');
% ylabel('Amplitude');
% 
% subplot 313
% plot(x, marray_blue, 'Color', [0 0 0 0.7]);
% axis tight
% % title('Blue');
% xlabel({'(c)', 'Time'});
% % ylabel('Amplitude');

RGB_3fig(marray_red, marray_green, marray_blue);
axis tight
