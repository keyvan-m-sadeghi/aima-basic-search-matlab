classdef BFSFringe < Fringe
    
    methods
        function Insert(fringe, node)
            fringe.Nodes(length(fringe.Nodes) + 1) = node; % FIFO
        end
    end
    
end