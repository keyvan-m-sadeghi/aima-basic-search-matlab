classdef Problem < handle
    
    properties
        InitialState
        GoalState
        States = State.empty;
        ArrayVersion
    end
    
    methods
        function problem = Problem(numberOfRows, numberOfColumns)
            problem.States(1:numberOfRows, 1: numberOfColumns) = State;
            for i = 1:numberOfRows
                for j = 1:numberOfColumns
                    if rand < 0.4
                        blocked = true;
                    else
                        blocked = false;
                    end
                    problem.States(i,j) = State(i,j,blocked);
                    problem.ArrayVersion(i,j) = blocked;
                end
            end            
            index = round(rand*(i*j-1))+1;
            problem.InitialState = problem.States(index);
            problem.InitialState.Blocked = false;
            problem.ArrayVersion(index) = 0;
            index = round(rand*(i*j-1))+1;
            problem.GoalState = problem.States(index);
            problem.GoalState.Blocked = false;
            problem.ArrayVersion(index) = 0;
        end
        
        function result = GoalTest(problem, state)
            if state == problem.GoalState
                result = true;
            else
                result = false;
            end
        end
        
        function [actions, results] = SuccessorFunction(problem, state)
            [numberOfRows, numberOfColumns] = size(problem.States);
            row = state.Row;
            column = state.Column;
            actions = double.empty;
            results = State.empty;
            index = 0;
            
            if(column>1 && problem.States(row,column-1).Blocked == false)
                index = index + 1;
                actions(index) = 4; % left (according to keyboard's numeric keypad!)
                results(index) = problem.States(row,column-1);
            end
            
            if(column<numberOfColumns && problem.States(row,column+1).Blocked == false)
                index = index + 1;
                actions(index) = 6; % right
                results(index) = problem.States(row,column+1);
            end
            
            if(row>1 && problem.States(row-1,column).Blocked == false)
                index = index + 1;
                actions(index) = 8; % up
                results(index) = problem.States(row-1,column);
            end
            
            if(row<numberOfRows && problem.States(row+1,column).Blocked == false)
                index = index + 1;
                actions(index) = 2; % down
                results(index) = problem.States(row+1,column);
            end
            
            if(column>1 && row>1 && problem.States(row-1,column-1).Blocked == false)
                index = index + 1;
                actions(index) = 7; % upper left
                results(index) = problem.States(row-1,column-1);
            end
            
            if(column<numberOfColumns && row>1 && problem.States(row-1,column+1).Blocked == false)
                index = index + 1;
                actions(index) = 9; % upperRight
                results(index) = problem.States(row-1,column+1);
            end
            
            if(column>1 && row<numberOfRows && problem.States(row+1,column-1).Blocked == false)
                index = index + 1;
                actions(index) = 1; % bottomLeft
                results(index) = problem.States(row+1,column-1);
            end
            
            if(column<numberOfColumns && row<numberOfRows && problem.States(row+1,column+1).Blocked == false)
                index = index + 1;
                actions(index) = 3; % bottomRight
                results(index) = problem.States(row+1,column+1);
            end
            
        end
    end    
end

