% BMS contour
% Peter Attia
% 2017-06-15

close all

Q1=5:5:80;
CC1=3:0.2:6;
time_vector = [13 12 11 10]; %holds the possible times

% CC2 = ones(length(time_vector),length(CC1),length(Q1));
CC2 = ones(length(Q1),length(CC1),length(time_vector));

figure, set(gcf, 'units','normalized','outerposition',[0 0 1 1]) 

% for i=1:length(time_vector)
%     subplot(2,length(time_vector)/2,i), hold on, box on
%     xlabel('CC1'),ylabel('Q1 (%)')
%     title(['Time to 80% = ' num2str(time_vector(i))])
%     
%     [X,Y] = meshgrid(CC1,Q1);
%     CC2 = [(time_vector(i) - (Y./100).*(60./X))./(60.*(0.8-(Y./100)))].^(-1);
%     v =[3.8 4 4.2];
%     contour(X,Y,CC2,v,'LineWidth',2,'ShowText','on')
% end

for i=1:length(time_vector)
    subplot(2,length(time_vector)/2,i), hold on, box on
    xlabel('CC1'),ylabel('Q1 (%)')
    title(['Time to 80% = ' num2str(time_vector(i))])
end

for i=1:length(time_vector)
    if time_vector(i) == 10
        subplot(2,length(time_vector)/2,4)
        Q1=30:5:80;
        CC1=4.8:0.2:6;
        [X,Y] = meshgrid(CC1,Q1);
        CC2 = [(time_vector(i) - (Y./100).*(60./X))./(60.*(0.8-(Y./100)))].^(-1);
        v =[3.8 4 4.2];
        contour(X,Y,CC2,v,'LineWidth',2,'ShowText','on')
    elseif time_vector(i) == 11
        subplot(2,length(time_vector)/2,3)
        Q1=0:2:75;
        CC1=4.5:0.2:6.2;
        [X,Y] = meshgrid(CC1,Q1);
        CC2 = [(time_vector(i) - (Y./100).*(60./X))./(60.*(0.8-(Y./100)))].^(-1);
        v =[3.8 4 4.2];
        contour(X,Y,CC2,v,'LineWidth',2,'ShowText','on')
    elseif time_vector(i) == 12
        subplot(2,length(time_vector)/2,2)
        Q1=5:5:50;
        CC1=3:0.2:6;
        [X,Y] = meshgrid(CC1,Q1);
        CC2 = [(time_vector(i) - (Y./100).*(60./X))./(60.*(0.8-(Y./100)))].^(-1);
        v =[3.8 4 4.2];
        contour(X,Y,CC2,v,'LineWidth',2,'ShowText','on')
    else
        subplot(2,length(time_vector)/2,1)
        Q1=0:5:69;
        CC1=3:0.2:4;
        [X,Y] = meshgrid(CC1,Q1);
        CC2 = [(time_vector(i) - (Y./100).*(60./X))./(60.*(0.8-(Y./100)))].^(-1);
        v =[3.8 4 4.2];
        contour(X,Y,CC2,v,'LineWidth',2,'ShowText','on')
    end
        
end
% 
% % Manually determined degradation values in Excel. The list of policies and
% % the list of degradation values should be programmatically generated
% 
list = [13	3.2	12.4	3.8	0.1
13	3.4	19.8	3.8	0.1
13	3.6	42.0	3.8	0.1
12	6	10.9	3.8	0.1
12	5.5	12.9	3.8	0.1
12	5	16.7	3.8	0.1
12	4.5	25.7	3.8	0.1
11	6	28.2	3.8	0.1
11	5.5	33.4	3.8	0.1
11	5	43.1	3.8	0.1
11	4.5	66.4	3.8	0.1
10	6	45.5	3.8	0.1
10	5.5	53.9	3.8	0.1
10	5	69.4	3.8	0.1
13	3.2	26.7	4	0.1
13	3.4	37.8	4	0.1
13	3.6	60.0	4	0.1
11	6	20.0	4	0.1
11	5.5	24.4	4	0.1
11	5	33.3	4	0.1
11	4.5	60.0	4	0.1
10	6	40.0	4	0.1
10	5.5	48.9	4	0.1
10	5	66.7	4	0.1
13	3.2	35.2	4.2	0.1
13	3.4	46.8	4.2	0.1
13	3.6	66.0	4.2	0.1
12	3.2	12.8	4.2	0.1
12	3.4	17.0	4.2	0.1
12	3.6	24.0	4.2	0.1
11	6	10.0	4.2	0.1
11	5.6	12.0	4.2	0.1
11	5.3	14.5	4.2	0.1
11	5	18.8	4.2	0.1
10	6	33.3	4.2	0.1
10	5.6	40.0	4.2	0.1
10	5.3	48.2	4.2	0.1
10	5	62.5	4.2	1];

colormap jet;

% scalefactor = 1e6; % Factor to scale 

maxvalue = max(list(:,5))*scalefactor;


for i = 1:length(list(:,1))
    if list(i,1) == 10
        subplot(2,length(time_vector)/2,4)
        scatter(list(i,2),list(i,3),'o','SizeData',200,'LineWidth',5)
    elseif list(i,1) == 11
        subplot(2,length(time_vector)/2,3)
        scatter(list(i,2),list(i,3),'o','SizeData',200,'LineWidth',5)
    elseif list(i,1) == 12
        subplot(2,length(time_vector)/2,2)
        scatter(list(i,2),list(i,3),'o','SizeData',200,'LineWidth',5)
    else
        subplot(2,length(time_vector)/2,1)
        scatter(list(i,2),list(i,3),'square','SizeData',200,'LineWidth',5)
        caxis([0 maxvalue])
    end
end

%% Save images
saveas(gcf,'contour.png')
saveas(gcf,'contour.fig')