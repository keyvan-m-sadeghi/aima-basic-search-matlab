function node = MakeNode(state)
   node = Node;
   node.State = state;
   node.ParentNode = Node.empty;
   node.Depth = 1;
   node.PathCost = 0;
end