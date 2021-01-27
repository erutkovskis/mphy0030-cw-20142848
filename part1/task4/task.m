vertices = load('../../data/example_vertices.csv');
triangles = load('../../data/example_triangles.csv');
% DT = delaunay(vertices(:,1),vertices(:,2),vertices(:,3)); % Create Delaunay triangulation matrix from vertice matrix

%% Visualisation

figure; trimesh(triangles,vertices(:,1),vertices(:,2),vertices(:,3));
% figure; trimesh(DT,vertices(:,1),vertices(:,2),vertices(:,3));

%% Array implementation, not working, brakes on vertex 28

vertice_num = size(vertices,1);
triangles_num = size(triangles,1);
P = vertices;
Tri = triangles;

neighbors = [];
for vertex = 1:vertice_num
    neighbors = [neighbors;find_neighbors(vertex,triangles)];
end
% P(i,j) = P(i,j) + lambda*0.5*(neighbor1+neighbor2);

%% Cell array implementation, breaks on comparison ~ismember(Tri(triangle,ii),neighbors{vertex}) - the current element of the cell array is not yet initialised

vertice_num = size(vertices,1);
triangles_num = size(triangles,1);
P = vertices;
Tri = triangles;

neighbors = {};
for vertex = 1:vertice_num
    neighbors{vertex} = neigh_cells(vertex,triangles);
end

%% Implementation without functions

triangles_num = size(triangles,1); % Number of triangles
Tri = triangles; % convenient name
vertice_num = size(vertices,1);

for vertex = 1:vertice_num
    neighbors{vertex,1} = []; % Initialize a cell array with empty array of neighbours
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