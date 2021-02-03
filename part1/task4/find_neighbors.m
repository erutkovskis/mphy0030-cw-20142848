function neighbors = find_neighbors(vertices,triangles)
% neighbors = find_neighbors(vertices,triangles)
%  
% find_heighbors function returns first-order neighbors of each vertex 
% of a triangulation mesh.
% Inputs:
%   vertices        list of vertices
%   triangles       list triangles of the triangulation mesh
% Outputs:
%   neighbors       cell array containing numerical array of neighbors for
%                   each vertex

triangles_num = size(triangles,1); % Number of triangles
Tri = triangles; % convenient name
vertice_num = size(vertices,1);

for vertex = 1:vertice_num
    neighbors{vertex,1} = []; % Initialize a cell array with empty array of neighbors for the vertex
    for triangle = 1:triangles_num % loop through all triangles
        % check if the scanned vertex is within the triangle vertices
        if ismember(vertex,Tri(triangle,:)) 
            for ii = 1:3 % check each vertex of the current triangle
                % Check if the current vertex is not the same as the reference
                % vertex of the triangle and check if the vertex is not already
                % in the neighbors list
                if Tri(triangle,ii) ~= vertex && ~ismember(Tri(triangle,ii),neighbors{vertex})
                    neighbors{vertex} = [neighbors{vertex},Tri(triangle,ii)];
                end
            end
        end
    end
end


end
