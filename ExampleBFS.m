function ExampleBFS(numberOfRows, numberOfColumns)
    disp('Breadth First Search');
    problem = Problem(numberOfRows, numberOfColumns);
    close all;
    [cost , numberOfExpandedNodes] = SolveMaze(problem, true, BFSFringe);
    disp('Solution cost:');
    disp(cost);
    disp('Number of expanded nodes:');
    disp(numberOfExpandedNodes);
end