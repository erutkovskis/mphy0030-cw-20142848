%% Read vertices and the triangulation mesh
vertices = load('../../data/example_vertices.csv');
triangles = load('../../data/example_triangles.csv');

%% Smoothing with default lambda and mu parameters from the paper and variable iterations

vertices5 = lowpass_mesh_smoothing(vertices,triangles,5); % smoothing using 5 iterations
vertices10 = lowpass_mesh_smoothing(vertices,triangles); % smoothing using default 10 iterations
vertices25 = lowpass_mesh_smoothing(vertices,triangles,25); % smoothing using 25 iteration

%% Visualisation
subplot(2,2,1);
trimesh(triangles,vertices(:,1),vertices(:,2),vertices(:,3)); title('No smoothing');
subplot(2,2,2);
trimesh(triangles,vertices5(:,1),vertices5(:,2),vertices5(:,3)); title('5 iteration smoothing');
subplot(2,2,3);
trimesh(triangles,vertices10(:,1),vertices10(:,2),vertices10(:,3)); title('10 iteration smoothing');
subplot(2,2,4);
trimesh(triangles,vertices10(:,1),vertices10(:,2),vertices10(:,3)); title('25 iteration smoothing');

%% Save visualizations 
Image = getframe(gcf);
imwrite(Image.cdata,'smoothed_surf.jpg');