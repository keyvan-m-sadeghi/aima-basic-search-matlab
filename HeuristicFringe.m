classdef HeuristicFringe < Fringe
    
    properties
        HeuristicUnit
    end
    
    methods (Abstract = true)
        fn = EstimateCost(node)
    end
    
    methods
        function Set(fringe,problem,heuristic)
            heuristic.GoalState = problem.GoalState;
            fringe.HeuristicUnit = heuristic;
        end
        
        function Insert(fringe, node)
            node.EstimatedCost = fringe.EstimateCost(node);
            inserted = false;
            for i=1:length(fringe.Nodes)
                if fringe.Nodes(i).EstimatedCost > node.EstimatedCost
                    InsertAt(fringe,i,node);
                    inserted = true;
                    break;
                end
            end
            if inserted == false
                InsertAtLast(fringe,node);
            end
        end
    end
    
end

function InsertAt(fringe,index,node)

    numberOfNodes = length(fringe.Nodes);
    newNodes(1,1:numberOfNodes+1) = Node;
    for i=1:index-1
        newNodes(i) = fringe.Nodes(i);
    end
    newNodes(index) = node;
    for i=index+1:numberOfNodes+1
        newNodes(i) = fringe.Nodes(i-1);
    end
    
    fringe.Nodes = newNodes;
    
end

function InsertAtLast(fringe,node)

    numberOfNodes = length(fringe.Nodes);
    if numberOfNodes == 0
        fringe.Nodes = node;
    else
        fringe.Nodes(numberOfNodes+1) = node;
    end
    
end
