classdef Node < handle
    
    properties
        Action
        State
        Depth
        ParentNode
        PathCost % g(n)
        EstimatedCost % f(n)
    end
    
    methods        
        function result = eq(node1,node2)
            if node1.State == node2.State
                result = true;
            else
                result = false;
            end
        end
    end
        
end