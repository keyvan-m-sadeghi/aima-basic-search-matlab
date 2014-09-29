function ExampleDFS(numberOfRows, numberOfColumns)
    disp('Depth First Search');
    problem = Problem(numberOfRows, numberOfColumns);
    close all;
    [cost , numberOfExpandedNodes] = SolveMaze(problem, true, DFSFringe);
    disp('Solution cost:');
    disp(cost);
    disp('Number of expanded nodes:');
    disp(numberOfExpandedNodes);
end