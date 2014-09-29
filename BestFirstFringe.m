classdef BestFirstFringe < HeuristicFringe
    
    methods
        function fn = EstimateCost(fringe, node)
            fn = fringe.HeuristicUnit.CalculateHeuristic(node); % f(n)=h(n)
        end
    end
    
end