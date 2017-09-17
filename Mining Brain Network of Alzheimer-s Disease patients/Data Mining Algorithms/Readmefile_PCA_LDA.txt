PCA(Principle Commpinent Analysis) and LDA (Linear Discriminant Analysis)

Both for PCA and LDA,I have used Octave platform for implenentation. 


1. In order to read the features which are in CSV file format I have used octave command csbread() to read the features from data.
2. For both PCA and LDA I have divided the features into X and y. X is the dataset and y is the projected vector.
3. In PCA,I am computing the covariance matrix from X and then I have measure the eigen vector and eigen values in order to  compute the PCA
components.
4. DPca contains all the eigen values and after computing cumsum(DPca) / sum(DPca) we have got the PCA components which defines the percentage of data variance
covered by each PCA components.
5. For PCA we have used [DPca, Wpca] = pca(X) in order to compute the PCA components and I have used Wpca eigen vector matrix to reduce the dimentsion of dataset.
6.LDA like PCA is a statistical to reduce the dimention;however LDA considers maximum of the ratios of between class scatter to within class scatter it visualizes
better separation of the clusters. 
7. In LDA,first I have computed the dimension of the data,X and also mean of X denoted by mu.
8. In the second phase, for LDA I have computed the labels from y and the number of classters denoted by C.
9. In LDA I have computed the mean for each cluster and then the variance of each cluster which is stored in Sw which is within class variance.
10. Then I have computed between class variance,Sb using mu. 
11. For LDA, I have used,[D, W_lda] = lda(X,y) function and W_lda has been used to reduce the dimension of dataset. 
12. At the end, I have used plot() function to visualize the projected data for both PCA and LDA.