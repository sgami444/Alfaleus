T = readtable('New_pupil_data_1.xls');
Tnew = T;



toDelete = strcmp(Tnew.Eye, 'Left eye was closed');
Tnew(toDelete, :) = [];

toDelete2 = strcmp(Tnew.Eye, 'Right eye was closed');
Tnew(toDelete2, :) = [];

lowPass = (Tnew.Diff > 1);
Tnew(lowPass, :) = [];
lowPass2 = (Tnew.Diff < -1);
Tnew(lowPass2, :) = [];

TRight = Tnew;
TLeft = Tnew;

toMoveRight = strcmp(Tnew.Eye, 'Left');
TRight(toMoveRight, :) = [];

toMoveLeft = strcmp(Tnew.Eye, 'Right');
TLeft(toMoveLeft, :) = [];

TLeftSimple = removevars(TLeft,'Eye');
TRightSimple = removevars(TRight,'Eye');

figure;
xL = TLeftSimple{:,1};
yL = TLeftSimple{:,2};

xR = TRightSimple{:,1};
yR = TRightSimple{:,3};

xR2 = TRightSimple{:,1};
yR2 = TRightSimple{:,2};

xL2 = TLeftSimple{:,1};
yL2 = TLeftSimple{:,3};

plot(xL, yL,'r');
title('Time vs Pupil Data');
xlabel('Time');
ylabel('Pupil size');
hold on;

plot(xR2, yR2,'b');
ylim([0 10]);

i=0;
j=1;
A=[];
while(i<32)
    i = i+2;
    A(j,1) = i;
    A(j,2) = 3.5;
    A(j,3) = 0.1;
    i = i+0.217;
    j=j+1;
end
point = A(:,1);
value = A(:,2);
err = A(:,3);

Time = table(point,value,err);
Time2 = Time;

%Time = readtable('TimeStamp_Points.xls');
%Time2 = readtable('TimeStamp_points_2.xls');

errorbar(Time.point,Time.value,Time.err,'horizontal');

legend('Left eye', 'Right eye', 'Point appearance');

hold off;
figure;
plot(xL2, yL2);
ylim([0 10]);
title('Time vs Pupil Size difference');
xlabel('Time');
ylabel('Size difference');
hold on;
errorbar(Time2.point,Time2.value,Time2.err,'horizontal');
hold off;


% Ts = 1/100;
% yL = fft(xL);
% fs = 1/Ts;
% f = (0:length(yL)-1)*fs/length(yL);
% figure;
% plot(f,abs(yL));

c1 = smooth(TLeftSimple.Value);
c2 = smooth(TLeftSimple.Diff);

%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);
%c1 = smooth(c1);

cxL = TLeftSimple.Time;
cyL = c1;
figure;
plot(cxL,cyL);
ylim([0 10]);
title('Smooth Time vs Pupil Data');
xlabel('Time');
ylabel('Pupil size');
hold on;
errorbar(Time.point,Time.value,Time.err,'horizontal');
hold off;
