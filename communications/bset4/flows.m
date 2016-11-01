function [res] = flows(t, stocks, params)

    p = params;

    %returns the rate of change of our position and velocity
    
    %% Unpack constants from params into the local workspace for Mathematica
    % Code taken from https://www.mathworks.com/matlabcentral/newsreader/view_thread/276419
    fields = fieldnames(params);
    for f = 1 : length(fieldnames(params));
        thisField = fields{f};
        commandLine = sprintf('%s = params.%s;', thisField, thisField);
        
        %Potential performance improvement target
        eval(commandLine); % EVAL is evil. Let's use it anyway.
    end
    clear('fields')
    
    %% Unpack state variables   
    x = stocks(1);
    dxdt = stocks(2);
    
    %% Calculate seccond derivitives
    d2xdt2 = ((k*A*cos(2*pi*dxdt*t)/p.l)+(p.B*(-2)*p.A*pi*dxdt*sin(2*pi*dxdt*t)/p.l)-(p.B*dxdt)-(k*x))/m;
    
    %% Repack derivitives
    
    res = [dxdt; d2xdt2];
end