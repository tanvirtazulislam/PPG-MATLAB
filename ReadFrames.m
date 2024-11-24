%filename = 'fSample_siam_trial_5.MOV';

% filename = 'aziz_trial_1.mov';
filename = 'Sample_Mishma_Trial_no_5.MOV';
% filename = 'Sample.mkv';
mov = VideoReader(filename);


numFrames = mov.NumberOfFrames;


numFramesWritten = 0;

imgarray=[];


for t = 1 : numFrames
    
currFrame = read(mov, t); % taking one frame at a time

value=addToAvg(currFrame); % red intensity values of that frame is taken and average is calculated

value1=value/255; % then average value is divided by 255 for red intensity. What will be the division value for green and blue?

imgarray=[imgarray value1]; % value is stored in an array


end 


% RGB values -> red 255, green 128, blue 255
difference=1/(30);
x=difference:difference:(numFrames-0)*difference;
totaltime=(numFrames-0)*difference;
fliparray=fliplr(imgarray);
%M=movmean(imgarray,5);



%plot(x,fliparray);
%xlabel('Time (s)');
%ylabel('Intensity');
%title(' ');
%findpeaks(imgarray)
%d=findpeaks(imgarray)

marray=detrend(fliparray);
peaks=findpeaks(marray);
newpeaks=peaks;

minimum=mean(peaks);


i=1;
while i<numel(newpeaks)
  if newpeaks(i) <= minimum
      newpeaks(i) = [];
      i=i-1;
  end
  i=i+1
end

[szr,szcl]=size(newpeaks);

hr=(szcl/totaltime)*60;

plot(x,marray);
axis tight
title('Detrend Raw PPG Signal');
xlabel('Time');
ylabel('Amplitude');
% subplot(2,1,1);
% plot(x,fliparray);
% xlabel('Flipped Signal');
% 
% subplot(2,1,2);
% plot(x,marray);
% xlabel('Detrend Signal');


