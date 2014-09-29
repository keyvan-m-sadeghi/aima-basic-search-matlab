function ExampleBestFirst(numberOfRows, numberOfColumns)
    disp('Best First Search, Straight Line Distance Heuristic');
    problem = Problem(numberOfRows, numberOfColumns);
    close all;
    [cost , numberOfExpandedNodes] = SolveMaze(problem, true, BestFirstFringe, SLHeuristic);
    disp('Solution cost:');
    disp(cost);
    disp('Number of expanded nodes:');
    disp(numberOfExpandedNodes);
end