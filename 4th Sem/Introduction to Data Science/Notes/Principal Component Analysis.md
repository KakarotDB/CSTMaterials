A type of [[Dimensionality Reduction]]
It is an **Unsupervised machine learning algorithm** used for dimensionality reduction. 

Why do we need this ? 
- Too many dimensions in dataset, difficult to obtain insights and visualize 
- Reducing them to a smaller set of dimensions to represent the data in a better way without losing too much information 
- Reduced data sets can build more effective data analysis. 

## Basic Concept

- If two dimensions are highly correlated or dependent -> combining them to form a single measure is reasonable 
- Thus, we want to combine related variables, and focus on uncorrelated or independent variables, especially those along which the observations have high variance. 
- We want a smallest set of variables that explain most of the variance in the original data set.

Thus **The  new Variables/Dimensions**
- Are linear combinations of the originals 
- Are uncorrelated with each other (orthogonal in original dimension space)
- Capture as much of the original variance in the data as possible 
- These are called principal components 

In PCA : 
- The principal components are vectors, with the first being computed so that it explains the greatest amount of variance in the original features. 
- The second component is orthogonal to the first, and it explains the greatest amount of variance left after the first principal component. 

In **Theory,** PCA produces the same number of principal components as there are features in the training dataset.
But, in **practice** we do not keep all the principal component.
Each successive principal component explains the variance that is left after its preceding component, so just picking a few of the first components sufficiently gives us an approximation of the original dataset without the need for additional features. 

---

## Eigen Decomposition of the Covariance Matrix

Several steps are involved : 

### 1. Feature Standardization 

- Essentially normalization of features so that contribution of each variable is equal 
- We can use z-score formula :  $$v' = \frac{v - \mu}{\sigma}$$
### 2. Covariance Matrix Computation 

- It is the measure that quantifies the degree to which two variables change together 
- Mathematical formula:  $$ \text{Cov}(X, Y) = \frac{1}{N} \sum_{i=1}^{N} (X_i - \mu_X)(Y_i - \mu_Y) $$
N = number of data points 
Xi, Yi are individual data points 
$\mu_X$ and $\mu_Y$ are means of X and Y

What's the difference between covariance and correlation ? 
- Covariance -> Scale dependent, magnitude depends on the units of variables 
- Correlation -> Scale independent, normalized version of covariance, making it unit free and easier to interpret. 

**Covariance Matrix for 2D Dataset:**
$$CM = \begin{bmatrix} COV(X,X) & COV(X,Y) \\ COV(Y,X) & COV(Y,Y) \end{bmatrix}$$
Note : COV(X, X) is equivalent to VAR(X). 
CM is symmetric, as COV(X, Y) = COV(Y, X)
If Value of a matrix entry is : 
- Positive -> Variables are positively correlated 
- Negative -> Variables are inversely correlated  

Also since we already **standardized** the features previously with z-score standardization, we can consider $\mu = 0, \sigma = 1$

### 3. Calculate eigen decomposition of covariance matrix 

- We calculate the **eigenvectors** and their associated **eigen values** of the covariance matrix 

#### How to calculate eigenvectors and eigen values ? 

$$ A x = \lambda x $$
where:
A = square matrix 
x = eigen vector 
$\lambda$ = eigen value 

Therefore, $$\det(A - \lambda I) = 0$$
Solving this equation for lambda gives us the eigen values (roots of polynomial equation in $\lambda$)

For each eigenvalue λ, solve: $$(A - \lambda I)\mathbf{x} = \mathbf{0}$$ The non-zero solutions **v** are the **eigenvectors**.

**The Spectral Theorem (Crucial for PCA):** If a matrix is **symmetric** (where $A = A^T$), all of its eigenvalues are real numbers, and its eigenvectors are strictly orthogonal (perpendicular) to each other.

#### Significances : 
##### 1. Directions of maximum variance

- Each **eigen vector** represents a **principal direction** in which the data varies the most 
- The **eigen vectors** indicate the axes along which the data is spread in the feature space 

##### 2. Feature Decorrelation 

- The eigenvectors are orthogonal to each other (as seen from the **Spectral theorem**), meaning they form a new set of uncorrelated axes 
- Transforming the data into the eigenvector basis removes redundancy caused by correlations among the original features 
##### 3. Dimensionality Reduction 

- The eigenvectors corresponding to the **largest eigenvalues** capture the most significant variance in data 
- Thus, in PCA, the data is projected onto these eigenvectors to reduce dimensionality whilst retaining as much variance as possible.

##### 4. Data Interpretation and Visualization

- The first eigenvector, or the one having largest eigen value, identifies the direction of maximum spread in the data. 
- Subsequent eigenvectors represent orthogonal directions capturing decreasing amounts of variance. 

##### 5. Identifying Redundancy and Correlations 
- Eigen vectors reveal the linear relationships/redundancy between features 
- Eigen value -> near 0 -> implies that the direction it points to has little to no spread, indicating possible redundancy. 
- Keeping small set of eigen vectors with large eigen values may explain most of the dataset's variance, whilst others may be noise.
##### 6. Geometric and Statistical Significance 

- Eigenvectors (in geometric sense) represent the axes of the ellipsoid that describes the covariance structure of the data in multidimensional space 
- In statistics, eigenvectors indicate the principal modes of variation in the data, helping in understanding its overall distribution. 


**Important for MCQ**
For very high dimensional matrices, we use iterative numerical methods instead of solving the characteristic equation 
- Power iteration : For largest eigen value 
- Lanczos & Arnoldi Methods: For sparse matrices
- QR Algorithm: For full eigenvalue decomposition, but expensive
- Singular Value Decomposition(SVD): For more stable approximations

## Dimensionality Reduction 

- n features - n principal components 
- Calculate n eigenvectors and eigenvalues 
- We choose only first p of them, final data set having p dimensions 

p < n

We do lose some information, but for the eigen vectors whose value is close to zero, we do not lose much. 
Thus we select the **Top N** eigen vectors based on their eigen values to become the N principal components of our data set. 

**Advantages**: 
- Easy to compute, since it is based on linear algebra
- Speeds up other machine learning algorithms. ML Algorithms converge faster when trained on PCA instead of original dataset 
- Counteracts the issue of high dimensional data. Using PCA before hand prevents algorithms from overfitting. 
**Disadvantages**
- Low interpretability : Difficult to tell which are the most important features in the dataset after computing principal components 
- Trade-off between information loss and dimensionality reduction 

**Assumptions and limitations**
- PCA assumes correlation between features
- PCA is sensitive to scale of features 
- Not robust against outliers -> remove before PCA
- PCA assumes linear relationship between features. Not well suited to capture non linear relationships. 
- Missing values must be imputed 