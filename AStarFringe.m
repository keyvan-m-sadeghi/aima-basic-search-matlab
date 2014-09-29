classdef AStarFringe < HeuristicFringe
    
    methods
        function fn = EstimateCost(fringe, node)
            fn = node.PathCost + fringe.HeuristicUnit.CalculateHeuristic(node); % f(n)=g(n)+h(n)
        end
    end
    
end