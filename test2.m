function test2()
    % Define test cases
    test_cases = {
        {@(x) x^3 - 6 * x^2 + 11 * x - 6, [0.5, 1.5], 1.000000000000000}, ...  % Root at x = 1
        {@(x) sin(x) - 0.5, [0, 2], 0.523598775598299}, ...  % Root at x = pi/6
        {@(x) x^2 - 4, [1, 3], 2.000000000000000}, ...  % Root at x = 2
        {@(x) cos(x) - x, [0, 1], 0.739085133215161}, ...  % Root near x = 0.739
         {@(x) x * exp(-x) - 2 * x + 1, [0, 3], 0.671553094250269}, ...
 {@(x) x * cos(x) - 2 * x^2 + 3 * x - 1, [1, 3], 1.256623322505569}, ...
 {@(x) x^3 - 7 * x^2 + 14 * x - 6, [0.5, 1], 0.585786437626905}, ...
 {@(x) sqrt(x) - cos(x), [0, 1], 0.641714370872883}, ...
 {@(x) 2 * x * cos(2 * x) - (x + 1)^2, [-4, -2], -2.191308011797247}, ...
 {@(x) sin(x) - x/2, [0.5, 2], 0.895624878558967}, ...
 {@(x) tan(x) - x, [0, 1], 0}, ...
 {@(x) exp(x) - 3*x - 1, [0.5, 2], 0.841567202142003}, ...
 {@(x) x^4 - 16, [1, 3], 2}, ...
 {@(x) x^3 - 6 * x^2 + 11 * x - 6, [0.5, 1.5], 1.000000000000000}, ...  % Root at x = 1
{@(x) sin(x) - 0.5, [0, 2], 0.523598775598299}, ...  % Root at x = pi/6
{@(x) x^2 - 4, [1, 3], 2.000000000000000}, ...  % Root at x = 2
{@(x) cos(x) - x, [0, 1], 0.739085133215161}, ...  % Root near x = 0.739
{@(x) x * exp(-x) - 2 * x + 1, [0, 3], 0.671553094250269}, ...  % Root in [0, 3]
{@(x) x^3 - 7 * x^2 + 14 * x - 6, [0.5, 1], 0.585786437626905}, ...  % Root at x ≈ 0.586
{@(x) sqrt(x) - cos(x), [0, 1], 0.641714370872883}, ...  % Root in [0, 1]
{@(x) 2 * x * cos(2 * x) - (x + 1)^2, [-4, -2], -2.191308011797247}, ...  % Root in [-4, -2]
{@(x) sin(x) - x / 2, [0.5, 2], 1.895494878558967}, ...  % Root in [0.5, 2]
{@(x) exp(x) - 3 * x - 1, [0.5, 2], 1.9038136844404869}, ...  % Root in [0.5, 2]

    };

    % Define tolerances
    params.root_tol = 1e-7; % Tolerance for interval length
    params.func_tol = 1e-7; % Tolerance for function value

    % Run all test cases
    fprintf('Testing modifiedzeroin function:\n');
    for i = 1:length(test_cases)
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
