K-means

I have used Octave platform for implenentation. 


In order to read the features which are in CSV file format I have used octave command csbread() to read the features from data.
Here are the main steps to accomplish this algorithm:
1. Randomly select ‘c’ cluster centers.
centroid = rand(nbCluster, data_dim);
centroid = centroid .* repmat(data_diff, nbCluster, 1) + repmat(data_min, nbCluster, 1);
2. Calculate the distance between each data point and cluster centers.
dists = [dists d];
3. Assign the data point to the cluster center whose distance from the cluster center is a minimum of all the cluster centers.
[a, assignment] = min(dists');
assignment = assignment';
end
4. Recalculate the new cluster center using:
centroid(c,:) = sum(d,1);
pointsInCluster(c,1) = size(d,1);
5. Recalculate the distance between each data point and newly obtained cluster centers.
centroid( c , : ) = centroid( c, : ) / pointsInCluster(c, 1);
else
centroid( c , : ) = (rand( 1, data_dim) .* data_diff) + data_min;
6. If no data point was reassigned then stop, otherwise repeat from step 3).

At the end, I have used plot() function to visualize the projected data 