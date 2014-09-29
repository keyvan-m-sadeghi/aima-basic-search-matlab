function [cost , numberOfExpandedNodes] = SolveMaze(problem, drawMaze, fringe, heuristic)

    if isa(fringe,'HeuristicFringe')
        fringe.Set(problem,heuristic);    
    end
        
    [solution, cost] = GraphSearch(problem,fringe);
    numberOfExpandedNodes = fringe.NumberOfExpandedNodes;    

    if drawMaze
        DrawMaze(problem, solution);
    end
end