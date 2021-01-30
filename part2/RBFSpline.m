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
        
        function alpha = fit(source_pts, target_pts, lambda, sigmas)
            %FIT Summary of this function goes here
            %   Detailed explanation goes here


            [src_rown,src_coln] = size(source_pts); % useful dimentions
            [tgt_rown,tgt_coln] = size(target_pts);


            r = zeros(src_rown); % pre-allocate

            % norm and RBF of the source points
            for ii = 1:src_rown
                for jj = (ii+1):src_rown
                    r(ii,jj)=norm(source_pts(ii,:)-source_pts(jj,:));
                    r(jj,ii)=r(ii,jj); % size n x n
                end
            end

            % P = ones(src_rown+1); % n+1 x n+1
            K = exp(-r.^2 / 2.*sigmas.^2); % matrix of gaussians, nxn
            W = diag(sigmas.^(-2)); % landmark localization errors, nxn
            target_pts = padarray(target_pts,[size(K,1),(size(K,2)-size(target_pts,2))]);
            alpha = (K + lambda * W.^(-1)) \ target_pts; % solve the equation from the paper wrt alpha, nxn 

        end

        function transf_set = evaluate(query_pts,control_pts,alpha)
            %EVALUATE Summary of this function goes here
            %   Detailed explanation goes here


            [qry_rown,qry_coln] = size(query_pts); % useful dimentions

            r = zeros(qry_rown); % pre-allocate

            % norm and RBF of the "x - p" from the paper, assuming control points are x
            for ii = 1:qry_rown
                for jj = 1:control_pts
                    r(ii,jj)=norm(query_pts(ii,:)-control_pts(jj,:));
                end
            end

            % P = ones(src_rown+1); % n+1 x n+1
            K = exp(-r.^2); % nxn
            transf_set = K * alpha; % transformed points

        end
        
        function kernel = kernel_gaussian(query_pts,control_pts,lambda,sigmas)
            %UNTITLED Summary of this function goes here
            %   Detailed explanation goes here

            [qry_rown,qry_coln] = size(query_pts); % useful dimentions

            r = zeros(qry_rown); % pre-allocate

            % norm and RBF of the "x - p" from the paper, assuming control points are x
            for ii = 1:qry_rown
                for jj = 1:control_pts
                    r(ii,jj)=norm(query_pts(ii,:)-control_pts(jj,:));
                end
            end

            % P = ones(src_rown+1); % n+1 x n+1

            K = exp(-r.^2 / 2.*sigmas.^2); % matrix of gaussians, nxn
            W = diag(sigmas.^(-2)); % landmark localization errors, nxn
            kernel = K+lambda*W.^(-1);

        end

    end
end

