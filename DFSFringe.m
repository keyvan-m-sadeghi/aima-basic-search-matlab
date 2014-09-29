classdef DFSFringe < Fringe
    
    methods
        function Insert(fringe, node)
            fringe.Nodes = [node fringe.Nodes]; % LIFO
        end
    end
    
end