function ExampleNormalVsBidirectional(numberOfRows, numberOfColumns)

    problem = Problem(numberOfRows, numberOfColumns);
    close all;
    [cost , numberOfExpandedNodes] = SolveMaze(problem, true, BFSFringe);
    disp('Solution cost with normal BFS:');
    disp(cost);
    disp('Number of expanded nodes with normal BFS');
    disp(numberOfExpandedNodes);
    [cost , numberOfExpandedNodes] = SolveMazeBidirectional(problem, true, BFSFringe,BFSFringe);
    disp('Solution cost with bidirectional BFS:');
    disp(cost);
    disp('Number of expanded nodes with bidirectional BFS:');
    disp(numberOfExpandedNodes);

end