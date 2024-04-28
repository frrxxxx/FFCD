clear; close all;
figure('position', [0, 0, 1210, 810])
% figure();
tiledlayout(5,6)
%color = [[1 0 0];[0 1 0];[0 0 1];[0 1 1];[1 0 1];[1 1 0];[0 0 0];[0.4940 0.1840 0.5560];[0.4660 0.6740 0.1880]];
color = [[0 0.4470 0.7410];[0.8500 0.3250 0.0980];[0.9290 0.6940 0.1250];[0.4940 0.1840 0.5560];[0.4660 0.6740 0.1880];[0.3010 0.7450 0.9330];[0.6350 0.0780 0.1840];[0.4940 0.1840 0.5560];[0.4660 0.6740 0.1880]];
shape = 'o*s>';

%%%%%%%===================================
X = load("../datasets/elliptical.txt");
Color = load("../datasets/elliptical_color.txt");
Color_uq = unique(Color);
ax1 = nexttile;
Label = load('results/elliptical_SC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
ylabel(ax1, 'Elliptical');
title('SC', 'FontWeight', 'normal');

ax2 = nexttile;
Label = load('results/elliptical_FSCUN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
title('FSCUN', 'FontWeight', 'normal');

ax3 = nexttile;
Label = load('results/elliptical_FSCN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
title('FSCN', 'FontWeight', 'normal');

ax4 = nexttile;
Label = load('results/elliptical_FAC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
title('FAC', 'FontWeight', 'normal');

ax5 = nexttile;
Label = load('results/elliptical_VFC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
title('VFC', 'FontWeight', 'normal');

ax6 = nexttile;
Label = load('results/elliptical_FFSCCD.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
title('FFSCCD', 'FontWeight', 'normal');



%%%%%%%===================================
X = load("../datasets/ds577.txt");
Color = load("../datasets/ds577_color.txt");
Color_uq = unique(Color);
ax7 = nexttile;
Label = load('results/ds577_SC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
ylabel(ax7, 'DS-577');

ax8 = nexttile;
Label = load('results/ds577_FSCUN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax9 = nexttile;
Label = load('results/ds577_FSCN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax10 = nexttile;
Label = load('results/ds577_FAC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax11 = nexttile;
Label = load('results/ds577_VFC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax12 = nexttile;
Label = load('results/ds577_FFSCCD.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end


%%%%%%%===================================
X = load("../datasets/2d-4c-no0.txt");
Color = load("../datasets/2d-4c-no0_color.txt");
Color_uq = unique(Color);
ax13 = nexttile;
Label = load('results/2d-4c-no0_SC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
ylabel(ax13, '2d-4c-no0');

ax14 = nexttile;
Label = load('results/2d-4c-no0_FSCUN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax15 = nexttile;
Label = load('results/2d-4c-no0_FSCN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax16 = nexttile;
Label = load('results/2d-4c-no0_FAC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax17 = nexttile;
Label = load('results/2d-4c-no0_VFC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax18 = nexttile;
Label = load('results/2d-4c-no0_FFSCCD.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end



%%%%%%%===================================
X = load("../datasets/2d-4c-no1.txt");
Color = load("../datasets/2d-4c-no1_color.txt");
Color_uq = unique(Color);
ax19 = nexttile;
Label = load('results/2d-4c-no1_SC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
ylabel(ax19, '2d-4c-no1');

ax20 = nexttile;
Label = load('results/2d-4c-no1_FSCUN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax21 = nexttile;
Label = load('results/2d-4c-no1_FSCN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax22 = nexttile;
Label = load('results/2d-4c-no1_FAC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax23 = nexttile;
Label = load('results/2d-4c-no1_VFC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax24 = nexttile;
Label = load('results/2d-4c-no1_FFSCCD.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end



%%%%%%%===================================
X = load("../datasets/2d-4c-no4.txt");
Color = load("../datasets/2d-4c-no4_color.txt");
Color_uq = unique(Color);
ax25 = nexttile;
Label = load('results/2d-4c-no4_SC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end
ylabel(ax25, '2d-4c-no4');

ax26 = nexttile;
Label = load('results/2d-4c-no4_FSCUN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax27 = nexttile;
Label = load('results/2d-4c-no4_FSCN.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax28 = nexttile;
Label = load('results/2d-4c-no4_FAC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax29 = nexttile;
Label = load('results/2d-4c-no4_VFC.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
    for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

ax30 = nexttile;
Label = load('results/2d-4c-no4_FFSCCD.txt');
Label_uq = unique(Label);
for i = 1: length(Label_uq)
	for j = 1: length(Color_uq)
        c = Color_uq(j);
        label = Label_uq(i);
        IDX = find(Color==Color_uq(j) & Label==Label_uq(i));
        plot(X(IDX,1),X(IDX,2),shape(mod(c, 4)+1),'MarkerSize',5,'MarkerEdgeColor',color(mod(label, 9),:))
        axis equal; hold on; box on;
    end
end

