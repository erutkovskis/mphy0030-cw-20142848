function P = lowpass_mesh_smoothing(...
    vertices,triangles,num_iter,lambda,mu)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% num_iter = 10; lambda = 0.9; mu = -1.02*lambda
    arguments
        vertices
        triangles
        num_iter = 10;
        lambda = 0.9
        mu = -1.02*lambda
    end

vertice_num = size(vertices,1);
triangles_num = size(triangles,1);
P = vertices;
Tri = triangles;

for i = 2:triangles_num-1 % number of triangles
    for j = 1:3 % triangle vertices
        for k = 1:3 % vertex_x, vertex_y, vertex_z
            neighbor1 = 1/2 *(P(Tri(i-1,j),k)-P(Tri(i,j),k)); % triangle i-1 in the list
            neighbor2 = 1/2 *(P(Tri(i+1,j),k)-P(Tri(i,j),k)); % triangle i+1 in the list
            P(Tri(i,j),k) = P(Tri(i,j),k) + lambda*(neighbor1+neighbor2); % even iteration - lambda formula
            if rem(i,2) ~= 0
                P(Tri(i,j),k) = P(Tri(i,j),k) + mu*(neighbor1+neighbor2); % odd iteration - mu formula
            end
        end
    end
end

% num_iter ???
% for vertex = 1:3
%     for triangle_1=1:triangle_num
%         for tri_vert = 1:3
%             P(triangles(triangle,tri_vert),vertex) = P(triangles(triangle,tri_vert),vertex)+lambda*(1/) 
% 
%         end
%     end
% end
% end







% for vertice = 1:vertice_num
%     for 
%     vertices = vertices+

% for vertice = 1:vertice_num
%     for triangle = 2:(triangles_num-1)
%         vertices(triangle) = vertices(triangle) + lambda*(1/)
%     end
% end
