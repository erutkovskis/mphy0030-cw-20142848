function neighbors = find_neighbors(vertex,triangles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%vertice_num = size(vertices,1);
triangles_num = size(triangles,1);
%P = vertices;
Tri = triangles;

neighbors = cell(triangles_num);

for triangle = 1:triangles_num
    if ismember(vertex,Tri(triangle,:))
        for ii = 1:3
            if Tri(triangle,ii) ~= vertex && ~ismember(Tri(triangle,ii),neighbors(vertex))
                neighbors(vertex) = Tri(triangle,ii);
            end
        end
    end
end


end
