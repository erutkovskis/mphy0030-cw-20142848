%% Read vertices and the triangulation mesh
vertices = load('../../data/example_vertices.csv');
triangles = load('../../data/example_triangles.csv');

%% Smoothing with default lambda and mu parameters and variable iterations

vertices5 = lowpass_mesh_smoothing(vertices,triangles,5); % smoothing using 5 iterations
vertices10 = lowpass_mesh_smoothing(vertices,triangles); % smoothing using default 10 iterations
vertices25 = lowpass_mesh_smoothing(vertices,triangles,25); % smoothing using 25 iteration

%% Delauney triangulation for the visualisation

DT5 = delaunay(vertices5(:,1),vertices5(:,2),vertices5(:,3)); 
DT10 = delaunay(vertices10(:,1),vertices10(:,2),vertices10(:,3)); 
DT25 = delaunay(vertices25(:,1),vertices25(:,2),vertices25(:,3)); 
%% Visualisation
subplot(2,2,1);
trimesh(triangles,vertices(:,1),vertices(:,2),vertices(:,3)); title('No smoothing');
subplot(2,2,2);
trimesh(DT5,vertices5(:,1),vertices5(:,2),vertices5(:,3)); title('5 iteration smoothing');
subplot(2,2,3);
trimesh(DT10,vertices10(:,1),vertices10(:,2),vertices10(:,3)); title('10 iteration smoothing');
subplot(2,2,4);
trimesh(DT25,vertices10(:,1),vertices10(:,2),vertices10(:,3)); title('25 iteration smoothing');

% figure; trimesh(DT,vertices(:,1),vertices(:,2),vertices(:,3));
%% Drafts 
%% Array implementation, not working, brakes on vertex 28
% 
% vertice_num = size(vertices,1);
% triangles_num = size(triangles,1);
% P = vertices;
% Tri = triangles;
% 
% neighbors = [];
% for vertex = 1:vertice_num
%     neighbors = [neighbors;find_neighbors(vertex,triangles)];
% end
% % P(i,j) = P(i,j) + lambda*0.5*(neighbor1+neighbor2);
% 
% %% Cell array implementation, breaks on comparison ~ismember(Tri(triangle,ii),neighbors{vertex}) - the current element of the cell array is not yet initialised
% 
% vertice_num = size(vertices,1);
% triangles_num = size(triangles,1);
% P = vertices;
% Tri = triangles;
% 
% neighbors = {};
% for vertex = 1:vertice_num
%     neighbors{vertex} = neigh_cells(vertex,triangles);
% end
% 
% %% Implementation without functions
% 
% triangles_num = size(triangles,1); % Number of triangles
% Tri = triangles; % convenient name
% vertice_num = size(vertices,1);
% 
% for vertex = 1:vertice_num
%     neighbors{vertex,1} = []; % Initialize a cell array with empty array of neighbours
%     for triangle = 1:triangles_num % loop through all triangles
%         % check if the scanned vertex is within the triangle vertices
%         if ismember(vertex,Tri(triangle,:)) 
%             for ii = 1:3 % check each vertex of the current triangle
%                 % Check if the current vertex is not the same as the reference
%                 % vertex of the triangle and check if the vertex is not already
%                 % in the neighbors list
%                 if Tri(triangle,ii) ~= vertex && ~ismember(Tri(triangle,ii),neighbors{vertex})
%                     neighbors{vertex} = [neighbors{vertex},Tri(triangle,ii)];
%                 end
%             end
%         end
%     end
% end
% 
% %% Smoothing
% lambda = 0.9;
% mu = -1.02*lambda;
% n_iter = 25;
% 
% for iter = 1:n_iter
%     for vertex = 1:vertice_num
%         for dim = 1:3 % apply the mesh smooting to x,y,z
%             vertices(vertex,dim) = vertices(vertex,dim) + lambda * ...
%                 (sum(1/length(vertices(neighbors{vertex},1))*(vertices(neighbors{vertex},dim)-vertices(vertex,dim)))); 
%             vertices(vertex,dim) = vertices(vertex,dim) + mu * ...
%                 (sum(1/length(vertices(neighbors{vertex},1))*(vertices(neighbors{vertex},dim)-vertices(vertex,dim))));
%         end
%     end
% end
% 
% %% Visualization
% figure; scatter3(vertices(:,1),vertices(:,2),vertices(:,3));
% DT = delaunay(vertices(:,1),vertices(:,2),vertices(:,3)); 
% figure; trimesh(DT,vertices(:,1),vertices(:,2),vertices(:,3));
% 
% %% Drafts
% % vertices(vertex,2) = vertices(vertex,2) + lambda * (sum(vertices(neighbors{vertex},2))-vertices(vertex,2))/length(vertices(neighbors{vertex},2)); % implement the mesh smooting to y
% % vertices(vertex,2) = vertices(vertex,2) + mu * (sum(vertices(neighbors{vertex},2))-vertices(vertex,2))/length(vertices(neighbors{vertex},2));
% % vertices(vertex,3) = vertices(vertex,3) + lambda * (sum(vertices(neighbors{vertex},3))-vertices(vertex,3))/length(vertices(neighbors{vertex},3)); % implement the mesh smooting to z
% % vertices(vertex,3) = vertices(vertex,3) + mu * (sum(vertices(neighbors{vertex},3))-vertices(vertex,3))/length(vertices(neighbors{vertex},3));