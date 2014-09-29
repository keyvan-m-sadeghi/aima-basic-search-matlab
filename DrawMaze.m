function DrawMaze(problem, solution)

    arrayVersion = problem.ArrayVersion;
    [numberOfRows, numberOfColumns] = size(problem.States);
    
    figure;
    hold on;
    axis ij
    axis([0.5 numberOfColumns+0.5 0.5 numberOfRows+0.5]);
    
    for i=1:numberOfRows
        x=zeros(0);
        y=zeros(0);
        for j=1:numberOfColumns
            if(arrayVersion(i,j) == 1)
                x = [x j];
                y = [y i];
            else
                plot(x,y,'-ks','LineWidth',3,...
                    'MarkerEdgeColor','k',...
                    'MarkerFaceColor','g',...
                    'MarkerSize',5)
                x=zeros(0);
                y=zeros(0);
            end
        end
        plot(x,y,'-ks','LineWidth',3,...
                    'MarkerEdgeColor','k',...
                    'MarkerFaceColor','g',...
                    'MarkerSize',5)
    end

    for i=1:numberOfColumns
        x=zeros(0);
        y=zeros(0);
        for j=1:numberOfRows
            if(arrayVersion(j,i) == 1)
                x = [x i];
                y = [y j];
            else
                plot(x,y,'-ks','LineWidth',3,...
                    'MarkerEdgeColor','k',...
                    'MarkerFaceColor','g',...
                    'MarkerSize',5)
                x=zeros(0);
                y=zeros(0);
            end
        end
        plot(x,y,'-ks','LineWidth',3,...
                    'MarkerEdgeColor','k',...
                    'MarkerFaceColor','g',...
                    'MarkerSize',5)
    end
    
    if isempty(solution) == false
        [x, y] = ConvertToArray(solution);
        plot(x,y,':r', 'LineWidth',2);
    else
        text(numberOfColumns/2,0,'FAILURE');
    end        
    text(problem.InitialState.Column, problem.InitialState.Row, 'S');
    text(problem.GoalState.Column, problem.GoalState.Row, 'G');
    hold off
end

function [x, y] = ConvertToArray(path)
    
    x=zeros(0);
    y=zeros(0);
    for node = path
        x = [x node.State.Column];
        y = [y node.State.Row];
    end

end