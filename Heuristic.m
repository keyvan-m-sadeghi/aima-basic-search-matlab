classdef Heuristic < handle
    
    properties
        GoalState
    end
    
    methods  (Abstract=true)
        hn = CalculateHeuristic(node)
    end
    
end