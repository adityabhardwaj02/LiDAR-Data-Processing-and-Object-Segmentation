ptCloud = pcread('Downloads\SEDRICA\Cars_Cloud_Cluster.pcd');
figure;
pcshow(ptCloud);
title('Original Point Cloud');
>> voxelSize = 0.05;

% Create a downsampled point cloud using the voxel grid filter
ptCloudDownsampled = pcdownsample(ptCloud, 'gridAverage', voxelSize);

% Visualize the downsampled point cloud
figure;
pcshow(ptCloudDownsampled);
title('Downsampled Point Cloud with Voxel Grid Filter');

= 0.0; % Minimum height
maxHeight = 1.6; % Maximum height
heightMask = (zCoords > minHeight) & (zCoords < maxHeight);
ptCloudFiltered = select(ptCloudDownsampled, heightMask);
 figure;
pcshow(ptCloudFiltered);
title('Filtered Point Cloud after Height Filtering');

% Step 1: Extract the 3D coordinates from the filtered point cloud
points = ptCloudFiltered.Location;  % This will be a Nx3 matrix of (X, Y, Z)

% Step 2: Perform DBSCAN clustering
epsilon = 0.5;  % Neighborhood radius
minPoints = 5;  % Minimum number of points to form a cluster

% Running DBSCAN
[idx, corepts] = dbscan(points, epsilon, minPoints);

% idx will contain the cluster indices for each point, 
% where -1 indicates noise points
% corepts will contain the indices of the core points

% Optional: Visualize the clustering results
figure;
pcshow(ptCloudFiltered.Location, idx); % Color points by cluster index
title('DBSCAN Clustering Results');
xlabel('X');
ylabel('Y');
zlabel('Z');
colorbar;

% Step 3: Create KD-Tree
disp('Creating KD-Tree...');
kdtree = KDTreeSearcher(ptCloudFiltered.Location);

% Step 4: Apply Euclidean Clustering
epsilon = 0.5; % Maximum distance between points to be considered in the same cluster
minPts = 5;   % Minimum number of points to form a cluster

disp('Applying DBSCAN for clustering...');
labels = dbscan(ptCloudFiltered.Location, epsilon, minPts);

% Step 5: Plot the clusters
uniqueLabels = unique(labels);
colors = lines(length(uniqueLabels)); % Generate distinct colors for each cluster

figure; % Create a new figure for clustered visualization
hold on;
for i = 1:length(uniqueLabels)
    clusterIdx = labels == uniqueLabels(i);
    if uniqueLabels(i) ~= -1 % Ignore noise points
        % Plot cluster points
        pcshow(ptCloudFiltered.Location(clusterIdx, :), colors(i, :), 'MarkerSize', 5);
    end
end
title('Clustered Point Cloud');
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
grid on;
view(3); % Set view for better 3D visualization
hold off;

