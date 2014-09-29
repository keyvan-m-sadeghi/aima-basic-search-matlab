function result = Contains(collection, item)
    result = false;
    for element = collection
        if item == element
            result = true;
            break;
        end
    end
end