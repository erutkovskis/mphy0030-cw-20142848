classdef FreeFormDeformation
    %FREEFORMDEFORMATION Summary of this class goes here
    %   Detailed explanation goes here
    
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
            obj.x_coord = linspace(range_x(1,1),range_x(1,2),ctr_x);
            obj.y_coord = linspace(range_y(1,1),range_y(1,2),ctr_y);
            obj.z_coord = linspace(range_z(1,1),range_z(1,2),ctr_z);

        end
        
        function ctrl_pts = FreeFormDeformation_optional(img3d_object,ctr_x,ctr_y,ctr_z)
            % ctrl_pts = FreeFormDeformation_optional(img3d_object,ctr_x,ctr_y,ctr_z)
            % Cannot create 2 constructors. Making this as a function.
            img3d_object.x_coord = linspace(range_x(1,1),range_x(1,2),ctr_x);
            img3d_object.y_coord = linspace(range_y(1,1),range_y(1,2),ctr_y);
            img3d_object.z_coord = linspace(range_z(1,1),range_z(1,2),ctr_z);
        end
        
        function outputArg = random_transform_generator(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
        
        
    end
end

