classdef SLHeuristic < Heuristic
    
    methods
        function hn = CalculateHeuristic(heuristic, node)
            rowsInBetween = abs(node.State.Row-heuristic.GoalState.Row)+1;
            columnsInBetween = abs(node.State.Column-heuristic.GoalState.Column)+1;
            
            diameterLength = min(rowsInBetween,columnsInBetween);
            if diameterLength > 1
                hn = (diameterLength - 1) * 14 + abs(rowsInBetween-columnsInBetween) * 10;
            else
                hn = abs(rowsInBetween-columnsInBetween) * 10;
            end
        end
    end
    
end