upperBound = 10;
lowerBound = 3;
numberOfExperiments = 10;
x=1:upperBound;
y=zeros(1,upperBound);
for i=lowerBound:upperBound
    for j=1:i*numberOfExperiments
        problem = Problem(i, i);
        [cost , numberOfExpandedNodes] = SolveMaze(problem, false, DFSFringe, SLHeuristic);
        y(i) = y(i) + numberOfExpandedNodes;
    end
    y(i) = y(i)/(i*numberOfExperiments);
end

figure('name','DFS Evaluation')
hold on
axis([lowerBound upperBound 0 max(y)]);
plot(x,y,'r');
clear;