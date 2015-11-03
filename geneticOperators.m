function children=geneticOperators(parents,NC,P,V,M,f,lb,ub)

PS=size(parents,1);
children =[];
for i = 1:NC
    if(rand > P)
        parent = parents(randi(size(parents,1)),1:V);
        B = randi(V);
        parent(B) = min(max(parent(B) + parent(B).*randn(1),0),1);
        children = [children; parent];
    else
        B=randi(V-1);
        child1 = parents(randi(size(parents,1)),1:B);
        child2 = parents(randi(size(parents,1)),B+1:V);
        children = [children; child1,child2];
    end
end

end
