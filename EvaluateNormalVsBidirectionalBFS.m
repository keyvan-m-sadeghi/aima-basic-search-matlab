upperBound = 10;
lowerBound = 3;
numberOfExperiments = 5;
x=1:upperBound;
y1=zeros(1,upperBound);
y2=zeros(1,upperBound);
for i=lowerBound:upperBound
    for j=1:i*numberOfExperiments
        problem = Problem(i, i);
        [cost , numberOfExpandedNodes] = SolveMaze(problem, false, BFSFringe);
        y1(i) = y1(i) + numberOfExpandedNodes;
        [cost , numberOfExpandedNodes] = SolveMazeBidirectional(problem, false, BFSFringe, BFSFringe);
        y2(i) = y2(i) + numberOfExpandedNodes;
    end
    y1(i) = y1(i)/(i*numberOfExperiments);
    y2(i) = y2(i)/(i*numberOfExperiments);
end

figure('name','Normal vs Bidirectional BFS');
hold on
axis([lowerBound upperBound 0 max(max(y1),max(y2))]);
plot(x,y1,'r');
plot(x,y2,'b');
clear;