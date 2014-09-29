function [cost , numberOfExpandedNodes] = SolveMazeBidirectional(problem, drawMaze, fringe1, fringe2, heuristic1, heuristic2)
    
    if isa(fringe1,'HeuristicFringe')
        fringe1.Set(problem,heuristic1);    
    end
    if isa(fringe2,'HeuristicFringe')
        if nargin == 5
            fringe2.Set(problem,heuristic1);
        else
            fringe2.Set(problem,heuristic2);
        end
    end
        
    [solution, cost] = BidirectionalSearch(problem, fringe1, fringe2);
    numberOfExpandedNodes = fringe1.NumberOfExpandedNodes + fringe2.NumberOfExpandedNodes;

    if drawMaze
        DrawMaze(problem, solution);
    end
end