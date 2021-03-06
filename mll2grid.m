function [i,j,km] = mll2grid(lat,lon,lat_grid,lon_grid)
% GLL2GRID find gridpoints closer to a given point 
%         [i,j] = mll2grid(lat,lon,lat_grid,lon_grid)
%         [i,j,km] returns the distance in km

% Copyright (C) 2009  M. Vichi
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.

dist = sphdist(lon, lat, lon_grid, lat_grid);
mindist = min(dist(:));
[j,i] = find(dist == mindist);
if nargout==3
    km = mindist;
end
function r = sphdist(lon,lat,lona,lata)
    EARTH_RADIUS = 6376.8;
    x = lon*pi/180;
    y = lat*pi/180;
    xa = lona*pi/180;
    ya = lata*pi/180;
    r = 2*(1 - cos(y).*cos(ya).*cos(x-xa)-sin(y).*sin(ya));
    r = sqrt(r).*EARTH_RADIUS;
