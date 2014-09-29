classdef State < handle
    
    properties
        Blocked = false;
        Row
        Column
    end
    
    methods
        function state = State(row, column, blocked)
            if nargin >= 2
                state.Row = row;
                state.Column = column;
            end
            if nargin == 3
                state.Blocked = blocked;
            end
        end
        
        function result = eq(state1, state2)
            if(state1.Row == state2.Row && state1.Column == state2.Column)
                result = true;
            else
                result = false;
            end
        end
    end
    
end