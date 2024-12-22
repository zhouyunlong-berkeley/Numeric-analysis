function test()
    % Define test cases
    test_cases = {
        {@(x) x * exp(-x) - 2 * x + 1, [0, 3], 0.671553094250269}, ...
        {@(x) x * cos(x) - 2 * x^2 + 3 * x - 1, [1, 3], 1.256623322505569}, ...
        {@(x) x^3 - 7 * x^2 + 14 * x - 6, [0, 1], 0.585786437626905}, ...
        {@(x) sqrt(x) - cos(x), [0, 1], 0.641714370872883}, ...
        {@(x) 2 * x * cos(2 * x) - (x + 1)^2, [-4, -2], -2.191308011797247} ...
    };

    % Define tolerances
    params.root_tol = 1e-7; % Tolerance for interval length
    params.func_tol = 1e-7; % Tolerance for function value

    % Run all test cases
    fprintf('Testing modifiedzeroin function:\n');
    for i = 1:(length(test_cases)-1)
        % Extract test case details
        func = test_cases{i}{1};
        interval = test_cases{i}{2};
        expected_root = test_cases{i}{3};

        % Set up interval structure
        Int.a = interval(1);
        Int.b = interval(2);

        % Run the root-finding method
        [root, info] = modifiedzeroin3040876985(func, Int, params);

        % Display results
        fprintf('\nTest Case %d:\n', i);
        fprintf('  Interval: [%.6f, %.6f]\n', Int.a, Int.b);
        fprintf('  Expected root: %.15f\n', expected_root);
        fprintf('  Function calls: %d\n', info.call_count); % Print function call count


        if info.flag == 0
            fprintf('  Computed root: %.15f\n', root);
            fprintf('  Absolute error: %.15f\n', abs(root - expected_root));
        else
            fprintf('  Method did not converge.\n');
        end
    end

    for i = length(test_cases):length(test_cases)
        % Extract test case details
        func = test_cases{i}{1};
        interval = test_cases{i}{2};
        expected_root = test_cases{i}{3};

        % Set up interval structure
        Int.a = interval(1);
        Int.b = interval(2);

        % Run the root-finding method
        [root, info] = modifiedzeroin3040876985(func, Int, params);

        % Display results
        fprintf('\nTest Case %d:\n', i);
        fprintf('  Interval: [%.6f, %.6f]\n', Int.a, Int.b);
        fprintf('  Expected root: %.15f\n', expected_root);
        fprintf('  Function calls: %d\n', info.call_count); % Print function call count


        if info.flag == 0
            fprintf('  Computed root: %.15f\n', root);
            fprintf('  Absolute error: %.15f\n', abs(root - expected_root));
        else
            fprintf('  Method did not converge.\n');
        end
    end
end
