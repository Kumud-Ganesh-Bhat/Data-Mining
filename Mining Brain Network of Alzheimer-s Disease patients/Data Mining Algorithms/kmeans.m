
% read the data file
fid = fopen('D:\IUPUI\DataMining\Project\AD_2.csv', 'r');
data=csvread(fid);

function[centroid, pointsInCluster, assignment,d]= kmeans(data, nbCluster)
data_dim = length(data(1,:));
nbData   = length(data(:,1));
data_min = min(data);
data_max = max(data);
data_diff = data_max .- data_min ;
% Randomly select ‘c’ cluster centers.
centroid = rand(nbCluster, data_dim);
centroid = centroid .* repmat(data_diff, nbCluster, 1) + repmat(data_min, nbCluster, 1);
pos_diff = 1.;
while pos_diff > 0.0
assignment = [];
if(nbCluster == 1)
assignment = ones(size(data,1), 1);
 else
 %Calculate the distance between each data point and cluster centers.
 dists = [];
 for c = 1: nbCluster
 d = data - repmat(centroid(c,:), size(data,1), 1);
 d = d .* d;
 d = sum(d, 2);
 dists = [dists d];
 end
 %Assign the data point to the cluster center whose distance from the cluster center 
 %is a minimum of all the cluster centers.
 [a, assignment] = min(dists');
 assignment = assignment';
 end
 oldPositions = centroid;
 centroid = zeros(nbCluster, data_dim);
 pointsInCluster = zeros(nbCluster, 1);
 %Recalculate the new cluster center using: v'=(1/ci) ∑ xi 
 %where, ‘ci’ represents the number of data points in ith cluster.
 for c = 1: nbCluster
 indexes = find(assignment == c);
 d = data(indexes,:);
 centroid(c,:) = sum(d,1);
 pointsInCluster(c,1) = size(d,1);
 %Recalculate the distance between each data point and newly obtained cluster centers.
 if( pointsInCluster(c, 1) != 0)
 centroid( c , : ) = centroid( c, : ) / pointsInCluster(c, 1);
 else
 centroid( c , : ) = (rand( 1, data_dim) .* data_diff) + data_min;
 end
 end
 pos_diff = sum (sum( (centroid .- oldPositions).^2 ) );
 end
 end
 [centroid, pointsInCluster, assignment,d] = kmeans (data,2);
 figure;
 %plot (data(:, 1), data(:, 2),'go',"markersize", 10, "linewidth", 3);
 %plot (data (pointsInCluster==2, 1),data (pointsInCluster==2, 2), 'bo',"markersize", 10, "linewidth", 3);
 
 plot (centroid' (:, 1), centroid' (:, 2), 'ro', "markersize", 10, "linewidth", 3);
  title("kmeans HC 1 data")
  
  
 
 