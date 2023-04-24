%% UTOI

%% Parameters
%%
% <html>
% <table>
%   <thead>
%       <tr>
%           <th>Name</th>
%           <th>Type</th>
%           <th>Size</th>
%           <th>Description</th>
%       </tr>
%   </thead>
%   <tr>
%       <td>uform</td>
%       <td>double</td>
%       <td>(1,3)</td>
%       <td>HAHAHAHAHAHAHAHAHAHAHAHAHAHAHHAHAHHA</td>
%   </tr>
% </table>
% </html>
%% Returns
%%
%% Raises
%%
%% Examples
%%
%% Function
function [iform] = utoi(uform)
    % UTOI Summary of this function goes here
    %    Detailed explanation goes here
    %
    % Examples:
    %
    % >> iform = utoi([1, 2, 45])
    % 
    % iform =
    % 
    %     0.7071   -0.7071         0    1.0000
    %     0.7071    0.7071         0    2.0000
    %          0         0    1.0000         0
    %          0         0         0    1.0000
    arguments
        uform (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
    end
    
    x = uform(1);
    y = uform(2);
    theta = uform(3) * pi / 180;
    iform = [cos(theta), -sin(theta), 0, x;
             sin(theta), cos(theta),  0, y;
             0, 0, 1, 0;
             0, 0, 0, 1];
end

