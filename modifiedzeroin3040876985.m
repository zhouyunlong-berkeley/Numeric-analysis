function [root, info] = modifiedzeroin3040876985(func, Int, params)

    a = Int.a; 
    b = Int.b;
    c = 0.5 * (a + b); 
    x0 = a; 
    x1 = b; 
    x2 = c; 

    iter = 0;          
    max_iter = 1000;    
    info.flag = 1;    
    func_vals = [];    
    call_count = 0;

    root_tol = params.root_tol; 
    func_tol = params.func_tol;

    x0_changed=false;
    x1_changed=false;
    x2_changed=false;

    while iter < max_iter

        iter = iter + 1;
        if iter==1
            f0 = func(x0); 
            call_count = call_count + 1;  % Increment function call counter
            f1 = func(x1); 
            call_count = call_count + 1;  % Increment function call counter
            f2 = func(x2);
            call_count = call_count + 1;  % Increment function call counter
        end
        
        if x0_changed
            f0 = func(x0); 
            call_count = call_count + 1;  % Increment function call counter
        end
        
        if x1_changed
            f1 = func(x1); 
            call_count = call_count + 1;  % Increment function call counter
        end
        
        if x2_changed
            f2 = func(x2);
            call_count = call_count + 1;  % Increment function call counter
        end

        denom1=(f0 - f1) * (f0 - f2);
        denom2=(f1 - f0) * (f1 - f2);
        denom3=(f2 - f0) * (f2 - f1);

        if denom1*denom2*denom3 == 0
            fprintf('\nu!sed bisection\n');

            if f0 * f2 < 0
                x1 = x2;
                x1_changed = true;
            else
                x0 = x2;
                x0_changed = true;
            end
            x2 = 0.5 * (x0 + x1); 
            x2_changed = true ;
            func_vals = []; 
            continue; 
        else 
            x3 = (f1 * f2) / denom1 * x0 + ...
             (f0 * f2) / denom2 * x1 + ...
             (f0 * f1) / denom3 * x2;
        end

        if x3 < a || x3 > b
            fprintf('\nused bisection\n');

            if f0 * f2 < 0
                x1 = x2;
                x1_changed = true;
            else
                x0 = x2;
                x0_changed = true;
            end
            x2 = 0.5 * (x0 + x1); 
            x2_changed = true ;
            func_vals = []; 
            
            continue; 
        else
            x0_changed = false;
            x1_changed = false;
            x2_changed = false;
        end

        f3 = func(x3);
        call_count = call_count + 1;  % Increment function call counter
        fprintf('\nf3 is %d:\n', f3);


  
        func_vals = [func_vals, abs(f3)];
        if numel(func_vals) >= 2
            if func_vals(end) >= 0.25 * func_vals(end-1)
                fprintf('\nuused bisection\n');

                x3 = x2;
                f3 = f2; 
                func_vals = []; 
                if f0 * f3 < 0
                    x1 = x3;
                    x1_changed = true;
        
                elseif f1 * f3 < 0
                    x0 = x3;
                    x0_changed = true;
                end 
            continue;
            end
        end
        fprintf('used IQI');
        if f0 * f3 < 0
            x1 = x3;
            x1_changed = true;

        elseif f1 * f3 < 0
            x0 = x3;
            x0_changed = true;

        end
        
        if abs(x1 - x0) < root_tol || abs(f3) < func_tol
            root = x3;
            info.flag = 0; 
            info.call_count = call_count;  
            return;
        end
    end

    root = NaN;
    warning('Maximum iterations reached. Method did not converge.');
end

