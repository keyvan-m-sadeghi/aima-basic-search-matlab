function [solution, cost] = GraphSearch(problem, fringe)
    closed = State.empty;
    fringe.Insert(MakeNode(problem.InitialState));
    while(true)
        if(fringe.IsEmpty)
            solution = Node.empty; % Failure
            cost = 0;
            break;
        end
        node = fringe.RemoveFront();
        if(problem.GoalTest(node.State))
            solution = Solution(node);
            cost = node.PathCost;
            break;
        end
        if Contains(closed, node.State) == false
            closed = [node.State closed];
            fringe.InsertAll(Expand(node, problem));
        end
    end
end

function solution = Solution(node)
    solution = node;
    currentNode = node;
    rootReached = false;
    
    while(rootReached == false)     
        currentNode = currentNode.ParentNode;   
        solution = [currentNode solution];
        if isempty(currentNode) || isempty(currentNode.ParentNode)
            rootReached = true;
        end
    end

end