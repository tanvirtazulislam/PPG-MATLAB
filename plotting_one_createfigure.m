function plotting_one_createfigure(Y1)
%CREATEFIGURE(Y1)
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 23-May-2020 01:29:13

% Create figure
figure('OuterPosition',[1 1 1184 554]);

% Create axes
axes1 = axes;
hold(axes1,'on');

% Create plot
plot(Y1,'LineWidth',1,'Color',[0 0 0]);

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0.8 0.9]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'BoxStyle','full','FontSize',14,'FontWeight','bold','LineWidth',1,...
    'XColor',[0 0 0],'YColor',[0 0 0],'ZColor',[0 0 0]);
