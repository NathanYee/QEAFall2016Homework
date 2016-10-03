% rotate321.m
% main calls function blockrot

% specify list of 3-2-1 Euler Angles

% first rotation psi about z-axis (3-yaw)
psi   = [ 0 pi/10 pi/4 pi/2   0  0];
% second rotation theta about y'-axis, (2-pitch)
theta = [ 0  0 0 0 0 pi/4];
% third rotation phi about x''-axis, (1-roll) 
phi = [ 0 0 0 0 pi/6 0];

% call blockrotate to execute and animate rotations
blockrotate(psi, theta,   phi)
  