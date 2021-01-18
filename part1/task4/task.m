vertices = load('../../data/example_vertices.csv');
triangles = load('../../data/example_triangles.csv');
% DT = delaunay(vertices(:,1),vertices(:,2),vertices(:,3)); % Create Delaunay triangulation matrix from vertice matrix

%% Visualisation

figure; trimesh(triangles,vertices(:,1),vertices(:,2),vertices(:,3));
% figure; trimesh(DT,vertices(:,1),vertices(:,2),vertices(:,3));