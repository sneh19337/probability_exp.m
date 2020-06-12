%A program written to do a probability experiment through MATLAB tools
%This is experiment 1 of the MATLAB experiment
%the array to store the data
%chosen app WHATSAPP

disp("This  is experiment 1");
 
x=[1;1;4;3;12;22;20;1;1;45;43;33;62;1;11;1;20;32;2;1;1;2;3;4;4;6;1;2;3;1];

%the array storing the probabilities of the data
px=[1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30; 1/30];
%the expectation of the experiment is denoted by exe
exe=sum(x.*px);
%plotting the histogram
histogram(x);
title("Experiment 1 Histogram Plot");
xlabel("The measured time gaps for the experiment");
ylabel("The frequencies for the time gaps taken for the experiment");
disp("THE VALUE OF THE EXPECTATION CALCULATED THROUGH THE DATA");
disp("the expectation for the experiment  calculated directly from the same data taken in the program itself ="+exe);
disp("THE VALUE OF THE PROBABILITY CALCULATED THROUGH THE DATA");
ey=fitdist(x,'exponential');
disp("Exponential distribution");
disp("parameters");
disp( " mu = 11.4333   [8.23552, 16.9459]");
% this function is used to calculate probability that the next message is
% received in time less than the expected value


[r,c] = size(x); % get the column of A
nr = 0:exe+1;  %range of the numbers
Prob=cdf(ey, exe);%calculates the sum of cdf upto values less than the expected value
%which is our probability
for j = 1:c   
    for i = 1:length(nr)   
        h(i,j) = length(find(x(:,j) == nr(i)))/r;  
    end
end
p=pdf(ey,x);
q=cdf(ey,x);
%line(x,q); can be used to plot cdf
%line(x,p); can be used to plot pdf
disp("the probability for the experiment calculated from the data taken from file ="+Prob);

%data taken for head tail calculation 
q=[1;4;2;4;2;2;10;17;12;32];
n = 10;
head=0;
tail=0;
while n~=0
    if q(n)<exe
        head=head+1;
        
    else
        tail=tail+1;
    end
    n=n-1;
end
disp("head = "+head);
disp("tail ="+ tail);
disp("SO THE NUMBER OF HEADS THROUGHOUT THIS EXPERIMENT ="+head+  "   AND THE NUMBER OF TAIL THROUGHOUT THE EXPERIMENT = "+tail);