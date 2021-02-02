function vertices = lowpass_mesh_smoothing(...
    vertices,triangles,num_iter,lambda,mu)
% vertices = lowpass_mesh_smoothing(vertices,triangles,num_iter,lambda,mu)
%
% lowpass_mesh_smoothing outputs list of vertices with coordinates of the
% smoothed surface using algorithm from Bade2006
% Inputs:
%   vertices    original list of vertices
%   triangles   triangular connectivity list
%   num_iter    number of iterations of the filtering, default value 10
%   lambda      regularisation parameter, default value 0.9
%   mu          reduction parameter, default value -1.02*lambda
% Outputs:
%   vertices    list of vertces with adjusted point coordinates
%               representing smoothed surface

% Default value declaration
if nargin < 4
    num_iter = 10;
    lambda = 0.9;
    mu = -1.02*lambda;
end

% Find first-order neighbors
neighbors = find_neighbors(vertices,triangles);

vertice_num = size(vertices,1);

% Smooth the surface
for iter = 1:num_iter
    for vertex = 1:vertice_num
        for dim = 1:3 % apply the mesh smooting to x,y,z
            vertices(vertex,dim) = vertices(vertex,dim) + lambda * ...
                (sum(1/length(vertices(neighbors{vertex},1))*(vertices(neighbors{vertex},dim)-vertices(vertex,dim)))); 
            vertices(vertex,dim) = vertices(vertex,dim) + mu * ...
                (sum(1/length(vertices(neighbors{vertex},1))*(vertices(neighbors{vertex},dim)-vertices(vertex,dim))));
        end
    end
end


end

