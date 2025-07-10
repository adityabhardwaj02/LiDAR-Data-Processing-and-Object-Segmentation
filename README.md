## Problem Statement
In this task, you will explore the given LiDAR point cloud data, apply various filtering techniques, and segment objects using clustering methods using PCL libraries.
Voxel Grid Filter:
A downsampling technique that reduces the number of points in a point cloud by grouping points within a grid (called voxels) and replacing each group with a single representative point.
Reduces computational load while preserving the overall structure of the data.
Height Filter:
Filters out points based on certain criteria such as height (Z-axis), intensity, or location.
So it is useful when you need to remove ground points from data to make processing easier.






KD-Tree:
A data structure that organises points in a point cloud for fast nearest-neighbour searches.
Essential for efficiently identifying neighbouring points in large datasets.
Euclidean Clustering:
A method that groups nearby points into clusters based on the Euclidean distance between them.
Used for segmenting distinct objects like cars or pedestrians from the point cloud.
Task
Apply Voxel Grid Filter:                                                                   
Apply the Voxel Grid Filter to downsample the point cloud data from the provided PCD file. Visualise the downsampled point cloud and save the result in a PCD file.
Utilise KD-Tree:                                                                                
Implement a KD-Tree structure to organise point cloud data for efficient point neighbour searches. Visualise and save the point cloud.
Apply Height Filter:                                                                             
Use the Height Filter to selectively filter out points based on height (Z-axis). Focus on points above a certain height to isolate the ground surface. Visualise and save the filtered point cloud.
Perform Euclidean Clustering:                                                       
Using the KD-Tree, apply Euclidean Clustering to group points based on proximity. This step will help segment individual objects (such as cars,trees, light poles,etc) from the point cloud.
Segregate the Cars:                                                                         
With three cars present in the point cloud, think critically about the order of operations for these filters. Consider how the Voxel Grid Filter, Height Filter, and Euclidean Clustering can be combined and applied in sequence to effectively isolate the cars. Document your reasoning.





Guidance
For the Voxel Grid Filter, select a voxel size that balances reducing point density without losing important detail.
For the Height Filter, use Z-axis thresholds to filter out ground points or irrelevant high points (e.g., taller than the cars).
KD-Tree implementation is critical for optimising the Euclidean Clustering step, as it speeds up neighbour searches.
Think strategically about the order in which these filters are applied to accurately segregate the three cars in the point cloud.
