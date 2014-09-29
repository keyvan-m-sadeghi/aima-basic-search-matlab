function successors = Expand(node, problem)
    successors = Node.empty;
    [actions, results] = problem.SuccessorFunction(node.State);
    for i=1:length(results)
       s = Node;
       s.ParentNode = node;
       s.Action = actions(i);
       s.State = results(i);
       s.PathCost = node.PathCost + StepCost(actions(i));
       s.Depth = node.Depth + 1;
       successors(i) = s;
    end
end

function cost = StepCost(action)
   if(action == 4 || action == 6 || action == 8 || action == 2)
       % left, right, up, down (based on keyboard's numeric keypad)
       cost = 10;
   else % diagonals
       cost = 14;
   end
end