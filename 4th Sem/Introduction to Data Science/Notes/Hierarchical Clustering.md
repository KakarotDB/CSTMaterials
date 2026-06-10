## Agglomerative (Bottom up)

- It starts by placing each object in its own cluster 
- Merge the two most similar clusters into one 
	- Replace the two clusters into the new cluster
	- Recompute inter cluster similarity scores wrt to new cluster 
- Repeat above step until there are k clusters left

## Inter cluster similarity

> **Core Idea:** When merging clusters, we need a way to measure the *distance between two clusters* (not just two points). Linkage methods define this inter-cluster distance differently.
### 1. Single Linkage (Nearest Neighbour)

**Principle:** The distance between two clusters is defined as the **shortest distance** between any one object in cluster $S$ and any one object in cluster $T$.

$$\delta_1(S, T) = \min \{ d(x, y) \mid x \in S,\ y \in T \}$$

- Tends to produce **long, chain-like** clusters.
- Sensitive to **outliers** and noise.
### 2. Complete Linkage (Furthest Neighbour)

**Principle:** The distance between two clusters is defined as the **longest distance** between any one object in cluster $S$ and any one object in cluster $T$.

$$\delta_2(S, T) = \max \{ d(x, y) \mid x \in S,\ y \in T \}$$

- Tends to produce **compact, roughly equal-sized** clusters.
- More robust to outliers than single linkage.

### 3. Average Linkage (UPGMA)

**Principle:** The distance between two clusters is defined as the **average of all pairwise distances** between objects in cluster $S$ and objects in cluster $T$.

$$\delta_3(S, T) = \frac{1}{|S||T|} \sum_{\substack{x \in S \\ y \in T}} d(x, y)$$

- A **compromise** between single and complete linkage.
- Generally more robust and widely used in practice.

### 4. Centroid Linkage

**Principle:** The distance between two clusters is defined as the **distance between their centroids** (geometric centres) $v_s$ and $v_t$.

$$\delta_4(S, T) = d(v_s,\ v_t)$$

Where the centroids are computed as:

$$v_s = \frac{1}{|S|} \sum_{x \in S} x \qquad v_t = \frac{1}{|T|} \sum_{y \in T} y$$

- Intuitive and geometrically meaningful.
- Can suffer from the **inversion problem** (non-monotone dendrograms).

### 5. Average of Centroids Linkage

**Principle:** The distance is defined as the **average of distances from every object in one cluster to the centroid of the other**, summed symmetrically.

$$\delta_5(S, T) = \frac{1}{|S| + |T|} \left\{ \sum_{x \in S} d(x,\ v_t) + \sum_{y \in T} d(y,\ v_s) \right\}$$

- A **hybrid** approach — blends object-level granularity with centroid-based reference points.
- More stable than pure centroid linkage in practice.

### 📊 Quick Comparison

| Method            | Uses                            | Cluster Shape       | Noise Sensitivity |
| ----------------- | ------------------------------- | ------------------- | ----------------- |
| Single            | Min distance                    | Elongated / chained | High              |
| Complete          | Max distance                    | Compact / spherical | Low               |
| Average           | Mean of all distances           | Balanced            | Medium            |
| Centroid          | Distance between centroids      | Balanced            | Medium            |
| Avg. of Centroids | Avg. dist. to opposite centroid | Balanced            | Medium-Low        |

### Time Complexity of Agglomerative Clustering 

- Computing pairwise distances requires $O(n^2 \cdot d )$ operations if we are using a simple distance metric like Euclidean distance 
- Merging process requires $O(n^2)$ operations (to find the closest clusters) at each step, over (n - 1) merges
- Thus, overall time complexity is $O(n^3)$

## Divisive Clustering (Top Down)

- Start at the top with all objects in one cluster 
- Cluster is split into sub clusters using a flat clustering algorithm 
- This procedure is applied recursively until each object is in its own singleton cluster or until it satisfies certain termination contains such as
	- a desired number of clusters have been obtained 
	- the distance between two closest clusters is above a certain threshold distance 

### Time complexity 

- The key part is how the algorithm decides to split the data, some common methods for splitting include 
	- K means: $O(k n d)$ k being number of clusters, n being number of data points, d is number of features 
- The algorithm continues to split until there are the desired number of clusters. In the worst case, if the data is split into n clusters (n being number of data points) then there will be (n - 1) splits 
- Per Split : Using k means we would get O(knd) time complexity per split 
- Number of splits : There will be O(n) splits if we are splitting until each data point is its own cluster 
- Thus overall time complexity is $O(n^2\cdot d)$ 

## Bottom up VS Top Down 

### Which one is more complex ? 

- Top down because a flat clustering is needed as a subroutine 

### Which one is more efficient ? 

- Top Down 
- For a fixed number of top levels, using an efficient flat algorithm like K means, divisive time complexity is $O(n^2)$ approximately 
- Agglomerative time complexity is $O(n^3)$ approximately 

### Which one is more accurate ? 

- Top down 
- Bottom up methods make clustering decisions based on local patterns without initially taking into account the global distribution - and these early decisions cannot be undone 
- Top down clustering benefits from complete information about the global distribution when making top level partitions 


