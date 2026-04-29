K nearest Neighbors Algorithm
It is a supervised algorithm 
It used for classification as well as regression predictive problems 

- It is a **Lazy learning algorithm** because it does not have a specialized training phase or model and uses all the data for training while classifying 
- It is a **Non parametric learning algorithm** as it does not assume anything about the distribution of the underlying data as opposed to some other algorithms which tend to assume a gaussian distribution 
- It is an **Eager learning algorithm**, i.e., when given a set of training tuples, will construct a generalization model before receiving new tuples to classify. 

## Classification Approach 

- Locating the unlabeled instance's nearest neighbors requires a distance function -> Traditionally this is Euclidean distance 
- It works by finding the K nearest neighbors to a given data point based on distance metric (Euclidean Distance) 
- The class or value of the data point is then determined by majority vote (for classification) or average (for regression) of the K neighbors 

## Pseudo Code 

- **Step 1** : Determine parameter K 
- **Step 2** : Calculate the distance between the query instance and all the training examples 
- **Step 3** : Sort the distance and determine the nearest neighbors based on the k-th minimum distance 
- **Step 4**: Gather the category Y of the nearest neighbors 
- **Step 5**: use simple majority voting of the category of the nearest neighbors as the prediction value of the query instance  


**Advantages**

- Versatile and widely used for ML algorithms 
- Primarily used for its simplicity and ease of implementation 
- Does not require any assumptions about the underlying data distribution 
- Can handle both numerical and categorical data, making it a flexible choice for various types of datasets 
- Non parametric method that makes predictions based on the similarity of data points in a given dataset 
- Less sensitive to outliers as compared to other algorithms
- Few hyperparameters - The only parameters which are required int he training of a KNN Algorithm are the value k and the choice of the distance metric which we would like to choose from our evaluation metric. 

**Disadvantages**

- Does not scale, since it's a lazy algorithm. The main significance of this term is that this takes a lot of computing power as well as data storage. This makes the algorithm both consuming and resource exhausting. 
- Curse of dimensionality 
- Prone to Overfitting 

*Why does KNN not perform well on high dimensional datasets?*

- As the number of dimensions increases, data points become more sparse in the feature space 
- The distance between points becomes less meaningful making it difficult for KNN to find the nearest neighbors effectively 
- This leads to poor generalization and degraded performance. 
- Also, since it is a lazy learner, it stores all training samples and computes distance at query time. In high dimensions, computing distances becomes computationally expensive 
- The time complexity for searching nearest neighbors increases significantly 
- In higher dimensions, the difference between the closest and farthest points reduces significantly 
- Most points end up almost equidistance 
- high dimensional data often contains irrelevant or redundant features whereas KNN treats all data points equally 

**Some possible solutions**

- Dimensionality Reduction 
- Using distance metrics that are better suited for high dimensional data 
- Use approximate nearest neighbors 


## How to choose the value of K ? 

- Recommended to choose odd *K* to avoid ties in classification 
- As a rule of thumb - setting k to square root of the number of training samples can lead to better results. And then choose the nearest odd number if it is even 
- Use an error plot or accuracy plot to find the most favorable k value 
- KNN performs well with multi-label classes, but we have to be aware of the outliers 


## Is Naive Bayes a lazy learner ? 

- It is not. It is an *eager learner* 
- Real learning takes place for Naive Bayes. The parameters that are learned in Naive Bayes are the *prior probabilities* of different classes, as well as the *likelihood* of different features for each class 
- In the test phase, these learned parameters are used to estimate the probability of each class for the given sample 
- Essentially, the parameters determined during training are used to estimate the probability of that sample during testing. 