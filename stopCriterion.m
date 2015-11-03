function flag=stopCriterion(it)
% Return :  1 if the GA must continue 
%           0 if the GA must stop

    flag=1;
    if it > 400
        flag=0;
    end

end