function Colours = random_colours(n)
    % Written by Bora M. Alper <m.b.alper@sms.ed.ac.uk>, 2019.
    % Generate k distinct (and easily distinguishable) colours:
    %     The trick is to use sin curves with 2*pi/3 phase difference for
    %     R, G, B colour channels, such that the sum of R G B is always 1.
    %     (which kind of* guarantees that the colours have similar 
    %     "lightness" [i.e. none is too bright or too dark than another]).
    %     *: Human vision is more complex than that, see CIELAB colour
    %        space and Helmholtz-Kohlrausch effect. =)
    %% Input
    %  n
    %      The number of random colours requested (must be a scalar).
    %% Output
    %  Colours
    %      n-by-3 matrix of RGB values (i.e. colors are stored at rows).
    
    %% Compute
    % Generate n+1 (instead of n) x values so that the first and the last 
    % colours won't be identical (remember that sin is periodic!) and
    % ignore the last point.
    x = linspace(0, 2*pi, n + 1);
    x = x(1:n); 
    
    Colours = [sin(x)', sin(x - 2*pi/3)', sin(x - 4*pi/3)'];
    
    % Shift upwards by one since negative RGB values are illegal. Divide by
    % two since the allowed range is [0, 1].
    Colours = (Colours + 1) / 2;
end