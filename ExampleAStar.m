function ExampleAStar(numberOfRows, numberOfColumns)
    disp('A* Search, Straight Line Distance Heuristic');
    problem = Problem(numberOfRows, numberOfColumns);
    close all;
    [cost , numberOfExpandedNodes] = SolveMaze(problem, true, AStarFringe, SLHeuristic);
    disp('Solution cost:');
    disp(cost);
    disp('Number of expanded nodes:');
    disp(numberOfExpandedNodes);
end