classdef RBFSpline

    
    properties
        source_pts
        target_pts
        lambda
        param1
    end
    
    methods(Static)
        
        function alpha = fit(source_pts, target_pts, lambda, sigmas)
            %alpha = fit(source_pts, target_pts, lambda, sigmas)
            %   Spline fitting function.
            % Inputs:
            %   source_pts      pre-transformation points
            %   target_pts      transformed target points
            %   lambda          weighting parameter
            %   sigmas          individual weights of the landmarks
            
            if nargin < 3
                lambda = 0;
                sigmas = 1;
            end
            
            [src_rown,src_coln] = size(source_pts); % useful dimentions
            r = zeros(src_rown); % pre-allocate

            % norm and RBF of the source points
            for ii = 1:src_rown
                for jj = (ii+1):src_rown
                    r(ii,jj)=norm(source_pts(ii,:)-source_pts(jj,:)); % according to the fornefett2001 "R(norm)" calculation
                    r(jj,ii)=r(ii,jj); % size n x n, calculates the opposite side of the matrix
                end
            end


            if nargin < 3 %% added support of non-extended equation (3) from paper for test purposes and simplicity
                K = exp(-r.^2);
                alpha = K \ target_pts; 
            else    
                K = exp(-r.^2 ./ 2.*sigmas.^2); % matrix of gaussians, nxn
                W = diag(sigmas.^(-2)); % landmark localization errors, nxn
                alpha = (K + lambda * W.^(-1)) \ target_pts; % solve the equation (4) wrt alpha, nxn 
            end
        end

        function transf_set = evaluate(query_pts,control_pts,alpha,sigmas)
            % transf_set = evaluate(query_pts,control_pts,alpha,sigmas)
            %   This function outputs transformed query set.
            % Inputs:
            %   query_pts       set of query points
            %   control_pts     set of control points
            %   alpha           spline coefficients
            %   sigmas          individual weights of the landmarks
            % Outputs:
            %   transf_set      transformed query set


            % qry - image. control - the ones that you I move.
            [qry_rown,qry_coln] = size(query_pts); % useful dimentions
            [ctrl_rown,ctrl_coln] = size(control_pts);

            % norm and RBF of the "x - p" from the paper, assuming control points are x
            for ii = 1:qry_rown
                for jj = 1:ctrl_rown
                    r(ii,jj)=norm(query_pts(ii,:)-control_pts(jj,:));
                end
            end

            K = exp(-r.^2 ./ 2.*sigmas.^2); % nxn
            transf_set = K * alpha; % transformed points

        end
        
        function kernel = kernel_gaussian(query_pts,control_pts,lambda,sigmas)
            % kernel = kernel_gaussian(query_pts,control_pts,lambda,sigmas)
            %   This function outputs Gaussian kernel. Implemented in
            %   "evaluate".
            % Inputs:
            %   query_pts       set of query points
            %   control_pts     set of control points
            %   alpha           spline coefficients
            %   sigmas          individual weights of the landmarks
            % Outputs:
            %   transf_set      transformed query set

            [qry_rown,qry_coln] = size(query_pts); % useful dimentions

            r = zeros(qry_rown); % pre-allocate

            for ii = 1:qry_rown
                for jj = 1:control_pts
                    r(ii,jj)=norm(query_pts(ii,:)-control_pts(jj,:));
                end
            end

            K = exp(-r.^2 ./ 2.*sigmas.^2); % matrix of gaussians, nxn
            W = diag(sigmas.^(-2)); % landmark localization errors, nxn
            kernel = K+lambda*W.^(-1);

        end

    end
end

