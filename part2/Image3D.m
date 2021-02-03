classdef Image3D
    % Stores intensity and voxel dimensions
    
    properties
        vol % image
        voxdims % dimensions
    end
    
    methods
        function obj = Image3D(vol,voxdims)
            %obj = Image3D(vol,voxdims)
            %   Constructs Image3D object with properties vol and voxdims
            %   to contain the intensities and the volume dimentions
            % Inputs
            %   vol         intensity values
            %   voxdims     voxel dimensions
            obj.vol = vol;
            obj.voxdims = voxdims;
        end
        
    end
end

