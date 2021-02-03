classdef FreeFormDeformation
    
    properties
        ctr_x % number of control points
        ctr_y
        ctr_z 
        range_x % range min-max [mm] assuming 1x2 vector
        range_y
        range_z 
    end
    
    methods
        function obj = FreeFormDeformation(ctr_x,ctr_y,ctr_z,range_x,range_y,range_z)
            %obj = FreeFormDeformation(ctr_x,ctr_y,ctr_z,range_x,range_y,range_z)
            %   Constructor function. Precomputes the coordinates of x, y,
            %   z control points.
            % Inputs: 
            %   ctr_x,ctr_y,ctr_z           number of control points
            %   range_x,range_y,range_z     range of control points [mm]
            % Outputs
            %   Instance of class with x,y,z coordinates.
            
            obj.x_coord = linspace(range_x(1,1),range_x(1,2),ctr_x);
            obj.y_coord = linspace(range_y(1,1),range_y(1,2),ctr_y);
            obj.z_coord = linspace(range_z(1,1),range_z(1,2),ctr_z);

        end
        
        function ctrl_pts = FreeFormDeformation_optional(img3d_object,...
                ctr_x,ctr_y,ctr_z,range_x,range_y,range_z)
            % ctrl_pts = FreeFormDeformation_optional(img3d_object,ctr_x,ctr_y,ctr_z)
            % Cannot create 2 constructors. Making this as a function. 
            
            img3d_object.x_coord = linspace(range_x(1,1),range_x(1,2),ctr_x);
            img3d_object.y_coord = linspace(range_y(1,1),range_y(1,2),ctr_y);
            img3d_object.z_coord = linspace(range_z(1,1),range_z(1,2),ctr_z);
            ctrl_pts = [img3d_object.x_coord,img3d_object.y_coord,img3d_object.z_coord];
        end
        
        function rand_ctr_pts = random_transform_generator(rand_par,ctr_pts)
            % rand_ctr_pts = random_transform_generator(rand_par)
            % Inputs:
            %   rand_par            strength of randomness [0..1]
            %   ctr_pts             control points
            % Outputs:
            %   rand_ctr_points     set of randomly displaced control
            %                       points
            
            rand_ctr_pts = rand_par * ctr_pts; % scales the random distribution, regulates w
        end
        
        function img_warped = warp_image(img3d_object, ...
                rand_ctr_pts)
            img_warped = RBFSpline.evaluate(img3d_object,rand_ctr_pts);
        end
        
        function random_transform(img3d_object)
            % No slightest clue how to do that
            % Nothing.
        end
    end
end

