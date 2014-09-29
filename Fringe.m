classdef Fringe < handle
    
    properties
        Nodes = Node.empty;
        NumberOfExpandedNodes = 0;
    end
    
    methods
        function node = RemoveFront(fringe)
            node = fringe.Nodes(1);
            fringe.Nodes = fringe.Nodes(2:length(fringe.Nodes));
        end
        
        function InsertAll(fringe, nodes)
            for node = nodes
                fringe.Insert(node);
            end
            fringe.NumberOfExpandedNodes = fringe.NumberOfExpandedNodes + 1;
        end
        
        function result = IsEmpty(fringe)
            if isempty(fringe.Nodes)
                result = true;
            else
                result = false;
            end
        end
    end
    
    methods (Abstract=true)
        Insert(node)
    end
    
end