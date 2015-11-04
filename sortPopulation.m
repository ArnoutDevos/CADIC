function sorted=sortPopulation(unsorted,V,M)

if M==1
   % To be written
    sorted = sortrows(unsorted,V+1); 
else % Multi-objective case : non-domination sorting
    sortedRank = [];
    points = unsorted;
    ok=false;
    rank=1;
    %% Ranking
    % To be written    
    while ~isempty(points)
        indexforthisrank = [];
        for i = 1:size(points,1)
            for j= 1:size(points,1)
               if ~(j==i)
                   if all(points(i,V+1:V+M) <= points(j,V+1:V+M)) %All yields 1 iff all elements of matrix are nonzero
                       ok = true;
                   else
                       ok = false;
                       break;
                   end
               end
            end
            
            if ok
                %add to result
                indexforthisrank = [indexforthisrank; i];    
            end
        end
        sortedRank = [sortedRank; unsorted(indexforthisrank,:) rank*ones(size(indexforthisrank,1),1)];
        points(indexforthisrank,:) = [];
        rank = rank+1;
        
    end
    %% Crowding Distance
    % To be written
    k = 1 %Fraction of distances which will be considered in crowding distance
    rank = 1;
    sortedRankCD = []
    %sortedRank(:,V+M+2) = inf; %Create new column with standard crowding distance set to infinity
    rankpoints = sortedRank(sortedRank(:,V+M+1)==rank,:);
    while ~isempty(rankpoints)
        for i = 1:size(rankpoints,1)
            for j= 1:size(rankpoints,1)
               if ~(j==i)
                   distance = norm(rankpoints(j,V+1:V+M)-rankpoints(i,V+1:V+M));
                   CDrank = [CDrank; distance]
               end
            end
            sortedDistance = sortrows(CDrank);
            CDrank = []
            CD = sum(sortedDistance(1:round(k*length(sortedDistance))));
            sortedRankCD = [sortedRankCD; CD];
        end
        %sortedRankCD = [sortedRankCD; rankpoints]
        rank = rank+1;
        rankpoints = sortedRank(sortedRank(:,V+M+1)==rank,:);
    end
    result = [sortedRank,sortedRankCD] %add CD column to result
    
    
    sorted = sortedrows(result)

end
