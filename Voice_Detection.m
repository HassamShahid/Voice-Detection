%%g=0:1000;
%%fs=8000;
tts('You may speak now')
%%sine=sin(2*pi*1200/fs*g);
%%sound(sine)
rec=audiorecorder;
recordblocking(rec,1);
sample=getaudiodata(rec);
sound(sample)
l=length(sample);
count=0;
for i=1:l-1
    if(sample(i)<0 && sample(i+1)>0)
        count=count+1;
        zeropos(count)=i;
    end
end
count1=count;
x1=2*l/count1;
y=8000/x1;
%%sound(sine)
%%7 point Averaging%%
for i=1:l-6
    sample2(i+3)=(sample(i)+sample(i+1)+sample(i+2)+sample(i+3)+sample(i+4)+sample(i+5)+sample(i+6))/7;
end
count=0;
for j=1:l-6
    if(sample2(j)<0 && sample2(j+1)>0)
        count=count+1;
        zeropos(count)=i;
    end
end
x2=2*l/count;
y2=8000/x2;
%%sound(sine)
plot(sample)
if(y<200)
    disp('The Speaker is Male')
    tts('The Speaker is Male')
elseif(y>200)
    disp('The Speaker is Female')
    tts('The Speaker is Female')
end
