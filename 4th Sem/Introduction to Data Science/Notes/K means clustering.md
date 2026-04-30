Before going to k means clustering, what is cluster analysis ? 

A cluster is a collection of data objects 
- Similar to one another in the same group 
- Dissimilar to the objects in other groups 
Cluster analysis involves : 
- Finding similarities between data according to the characteristics found in the data and grouping similar data objects into clusters 

There are no predefined classes making this an [[Unsupervised learning (Clustering)]] approach 

Some applications of cluster analysis involves as a *stand alone tool* to get insight into data distribution
A *preprocessing step* for other algorithms 

Now, a good clustering method would have :
- High intra class similarity : cohesive within clusters 
- low inter class similarity : distinctive between clusters 

The *quality* of clustering methods depends on : 
- The similarity measures used 
- its implementation 
- Its ability to discover some or all the hidden patterns 

The dissimilarity/similarity metric can usually be expressed in terms of a distance function, typically metric d(i, j)
The definitions of *distance functions* are usually different for interval-scaled, boolean, nominal/categorical, ordinal, and ratio-scaled variables. 

It is important to standardize and normalize data using techniques like min-max, z-score, etc to avoid the dependence on the choice of measurement units 

The dissimilarity/similarity between the objects described by **interval scaled variables** is typically computed based on the distance between each pair of objects. 

Now, what are the **Mathematical requirements** of a distance function ?
- d(i, j) >= 0, 
- d(i, i) = 0
- d(i, j) = d(j, i)
- d(i , j) <= d(i ,k) + d(k , j) (triangle inequality) 

We can also assign weights to each variable for the Euclidean distance measure 

**Symmetric/Asymmetric Binary variables**

Let's say out of *p* dimensions, for objects i and objects j, let 
- q is number of variables that equal to 1 for both i and j 
- r is number of variables that equal to 1 for i, 0 for j 
- s is number of variables that equal to 0 for i, 1 for j 
- t is the number of variables that equal to 0 for both i and j 

Then, in symmetric case, $d(i, j) = \frac{r + s}{q + r + s + t}$

In asymmetric case, the most important outcome is represented by 1, 0 otherwise 
$$
d(i, j) = \frac{r + s}{q + r + s}
$$
This is also known as *Jaccard Co efficient*

There are many other ways for dissimilarity measurement of different types of variables that can be viewed in the references within the repository 


## Major Clustering Approaches 

**Partitioning Approach**

- Construct various partitions and then evaluate them on some criteria 
- K means, k medoids, CLARANS 

**Density Based**

- Based on connectivity and density functions 
- DBSCAN, OPTICS, DenClue 

**Hierarchical Approach**

- Create a hierarchical decomposition of the set of data (or objects) using some criterion
- Agnes, Diana, BIRCH 

**Grid Based**

- Based on multiple level granularity structure 
- STING, CLIQUE 

**Model Based**

- A model is hypothesized for each of the clusters and tries to find the best fit of that model to each other 
- EM, SOM, COBWEB 

## Partitioning Method 

Partitioning a database *D* of *n* objects into a set of *k* clusters, such that the sum of squared distances is minimized (where $c_i$ is centroid or medoid of cluster $C_i$)
$$
E = \sum_{i = 1}^k \sum_{p \in C_i}(p - c_i)^2
$$
Given k, find a partition of k clusters that optimizes the chosen partitioning criterion : 
- Global optimal : Exhaustively enumerates all patterns 
- Heuristic Methods: K means, K medoids 

## K means Clustering Algorithm 

1. Partition Objects into K non empty subsets 
2. Compute Seed points as the centroids of the clusters of the current partitioning (mean point of cluster) 
3. Assign each object to the cluster with the nearest seed point 
4. Go back to step 2, stop when the assignment does not change 

**Strength**: Efficient O(t * k * n)
n is # of objects 
k is # of clusters
t is $ of iterations

**Weakness** : Applicable only to objects in a continuous n-dimensional space 

For handling categorical data, we can use K modes, replacing means of clusters with modes and using a new dissimilarity measures to deal with categorical objects 
A mixture of categorical and numerical data would lead to k-prototype method 


It is sensitive to initial conditions, as the algorithm randomly initializes the cluster centroids at the beginning, and the final clustering results can vary depending on these initial conditions. 
It is sensitive to outliers, as it treats all data points equally, even if they are unusual or extreme. Outliers distort the clustering process, causing the algorithm to create less reliable clusters 

We can use K-medoids to resolve the outlier sensitivity 

It is also not suitable to discover clusters with non-convex shapes 
K means assumes that clusters are round or spherical in shape. Although real world data can have different shapes 
K means may struggle to handle such irregular clusters, resulting in less accurate clusters. 

*Deciding K* is an important part of the algorithm, as it can be tricky especially if we have no knowledge about the underlying data. 
Choosing the wrong number of clusters can lead to misleading results 
Methods like elbow finding or silhouette analysis can help estimate the appropriate number of clusters. 

The **elbow finding/knee finding** method uses an object function to be plot for multiple values of k. The abrupt change at a particular k value is highly suggestive of k clusters. This point can be used as k. 