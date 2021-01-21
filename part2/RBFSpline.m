classdef RBFSpline
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        source_pts
        target_pts
        lambda
        param1
    end
    
    methods
        function obj = untitled4(inputArg1,inputArg2)
            %UNTITLED4 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
        
        function coef = fit(source_pts, target_pts)
            %FIT Summary of this function goes here
            %   Detailed explanation goes here

            P = source_pts;
            col_num = size(source_pts,2);
            Ms = size(target_pts,2);
            q = target_pts;
            r = norm(P-q);
            K = exp(-r.^2);

            matrix1 = [K, P; P.', zeros(col_num+1)];
            matrix2 = [q; zeros(col_num+1,Ms)];

            coef = matrix1 \ matrix2;
        end


    end
end

