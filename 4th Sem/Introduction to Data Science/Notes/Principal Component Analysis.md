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
