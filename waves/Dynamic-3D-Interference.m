function wave_interference_gui
    % Initial parameters
    params.Sm1 = 10;
    params.Sm2 = 15;
    params.k1 = 5;
    params.k2 = 10;
    params.w1 = 2*pi;
    params.w2 = 2.2*pi;
    params.phi1 = pi/2;
    params.phi2 = 0;

    % Spatial and temporal grids
    params.x = 1:25;
    params.t = 1:25;
    [params.X, params.T] = meshgrid(params.x, params.t);

    % Create figure
    f = figure('Position',[100 100 1200 600]);
    
    % Axes for plotting
    ax1 = subplot(1,3,1,'Parent',f);
    ax2 = subplot(1,3,2,'Parent',f);
    ax3 = subplot(1,3,3,'Parent',f);

    % Plot first time
    plotWaves(params, ax1, ax2, ax3);

    % Slider definitions: [label, fieldName, min, max, init]
    sliders = {
        'Sm1', 'Sm1', 0, 20, params.Sm1;
        'Sm2', 'Sm2', 0, 20, params.Sm2;
        'k1',  'k1',  0, 20, params.k1;
        'k2',  'k2',  0, 20, params.k2;
        'w1',  'w1',  0, 10*pi, params.w1;
        'w2',  'w2',  0, 10*pi, params.w2;
        'phi1','phi1',0, 2*pi, params.phi1;
        'phi2','phi2',0, 2*pi, params.phi2
    };

    % Add sliders dynamically
    for i=1:size(sliders,1)
        uicontrol('Style','text','String',sliders{i,1},...
                  'Position',[50 570-40*i 40 20]);
        uicontrol('Style','slider',...
                  'Min',sliders{i,3},'Max',sliders{i,4},...
                  'Value',sliders{i,5},...
                  'Position',[100 570-40*i 200 20],...
                  'Callback',@(src,~) updateParam(src,sliders{i,2}));
    end

    % Callback to update parameters and replot
    function updateParam(src, field)
        params.(field) = src.Value;
        plotWaves(params, ax1, ax2, ax3);
    end
end

function plotWaves(params, ax1, ax2, ax3)
    % Compute waves
    S1 = params.Sm1*cos(params.k1*params.X - params.w1*params.T + params.phi1);
    S2 = params.Sm2*cos(params.k2*params.X - params.w2*params.T + params.phi2);

    % Plot S1
    axes(ax1); cla;
    surf(params.X, params.T, S1);
    shading interp; title('S1 Wave'); xlabel('x'); ylabel('t'); zlabel('Amplitude');

    % Plot S2
    axes(ax2); cla;
    surf(params.X, params.T, S2);
    shading interp; title('S2 Wave'); xlabel('x'); ylabel('t'); zlabel('Amplitude');

    % Plot interference
    axes(ax3); cla;
    surf(params.X, params.T, S1+S2);
    shading interp; title('Interference Pattern'); xlabel('x'); ylabel('t'); zlabel('Amplitude');
end

