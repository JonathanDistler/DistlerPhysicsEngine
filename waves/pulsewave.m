array = linspace(1, 20, 20);  % X-axis values

function coeff = coefficients(sigma)
    % Calculate sinc-based coefficients
    coeff = zeros(1, 20);
    for n = 1:20
        coeff(n) = 2 * sigma * sin(n * pi * sigma) / (n * pi * sigma);
    end
end

% Coefficients for sigma = 0.5
coefficient_1 = coefficients(0.5);
figure;
bar(array, coefficient_1);
xlabel('N');
ylabel('Coefficient');
title('N vs. Coefficient (sigma = 0.5)');

% Coefficients for sigma = 0.05
coefficient_2 = coefficients(0.05);
figure;
bar(array, coefficient_2);
xlabel('N');
ylabel('Coefficient');
title('N vs. Coefficient (sigma = 0.05)');
