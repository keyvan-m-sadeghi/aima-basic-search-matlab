function [solution, cost] = BidirectionalSearch(problem, fringe1, fringe2)

    closed = State.empty;
    fringe1.Insert(MakeNode(problem.InitialState));
    fringe2.Insert(MakeNode(problem.GoalState));
    
    while(true)
        if fringe1.IsEmpty || fringe2.IsEmpty
            solution = Node.empty; % Failure
            cost = 0;
            break;
        end
        
        [intersectingNodeFromFring1, intersectingNodeFromFring2] = FindIntersection(fringe1,fringe2);        
        if isempty(intersectingNodeFromFring1) == false
            [solution, cost] = Solution(intersectingNodeFromFring1, intersectingNodeFromFring2);
            break;
        end
        
        node1 = fringe1.RemoveFront();
        node2 = fringe2.RemoveFront();
        
        if Contains(closed, node1.State) == false
            closed = [node1.State closed];
            fringe1.InsertAll(Expand(node1, problem));
        end
        if Contains(closed, node2.State) == false
            closed = [node2.State closed];
            fringe2.InsertAll(Expand(node2, problem));
        end
    end
end

function [intersectingNodeFromFring1, intersectingNodeFromFring2] = FindIntersection(fringe1,fringe2)

    intersectingNodeFromFring1 = Node.empty;
    intersectingNodeFromFring2 = Node.empty;
    for node1 = fringe1.Nodes
        for node2 = fringe2.Nodes
            if node1 == node2
                intersectingNodeFromFring1 = node1;
                intersectingNodeFromFring2 = node2;
                break;
            end
        end
    end
        
end

function [solution, cost] = Solution(node1,node2)
    
    solution = node1;
    currentNode = node1;
    rootReached = false;
    
    while(rootReached == false)     
        currentNode = currentNode.ParentNode;   
        solution = [currentNode solution];
        if isempty(currentNode) || isempty(currentNode.ParentNode)
            rootReached = true;
        end
    end
    
    currentNode = node2;
    rootReached = false;
    while(rootReached == false)     
        currentNode = currentNode.ParentNode;   
        solution = [solution currentNode];
        if isempty(currentNode) || isempty(currentNode.ParentNode)
            rootReached = true;
        end
    end

    cost = node1.PathCost + node2.PathCost;
end