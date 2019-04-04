clc
clear
close all

probe_fb_offset = 0.5;
probe_lr_offset = 0;
probe_ud_offset = 0.05;

d = importdata('data.xyz');

points_north = d(1:10:end,1);
points_east = d(1:10:end,2);
points_depth = d(1:10:end,3);

points_north_min = min(points_north);
points_north_max = max(points_north);

d = importdata('F:\cruiseData\KR16-01\BOSSACRC\BSA-032\Processinputs\posorient.txt');

rob_north = d(:,7);
rob_east = d(:,8);
rob_depth = d(:,10);

rob_depth = rob_depth(rob_north < points_north_max);
rob_east = rob_east(rob_north < points_north_max);
rob_north = rob_north(rob_north < points_north_max);

rob_depth = rob_depth(rob_north > points_north_min);
rob_east = rob_east(rob_north > points_north_min);
rob_north = rob_north(rob_north > points_north_min);

figure(1)
    scatter(points_east, points_north, 1, points_depth);
    hold on
    scatter(rob_east, rob_north, 1, rob_depth);
    axis equal;       