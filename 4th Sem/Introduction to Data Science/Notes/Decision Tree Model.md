- In principle, there are exponentially many decision trees that can be constructed from a given set of attributes 
- Thus, finding the optimal tree is computationally infeasible and the need arises for more heuristic approaches. 
- There are algorithms that have been developed to induce a reasonably accurate although suboptimal decision tree in a reasonable amount of time 
- Usually a **greedy strategy** is employed. 
- One such algorithm is [[Hunts Algorithm]] which is the basis of many decision tree induction algorithms like ID3, C4.5, and CART.

## Problem of Overfitting and it's solutions 

What is overfitting in decision trees ? 
- It occurs when the tree model learns irrelevant details or noise, making it too complex and highly specific to training set 
- High training accuracy, but generalizes poorly to unseen test data, poor test accuracy 

**Causes of overfitting**

- Excessive depth (Too many splits) 
- Small leaf nodes (few samples per leaf) 
- High variance in data (noisy features) 
- Imbalanced datasets 
- Lack of feature selection 

**Some approaches to handle imbalance in dataset**

- Balancing the dataset (eg [[SMOTE]], [[Oversampling]], [[Under-sampling]])
- Cost sensitive learning 
- Ensemble of Decision trees 
- [[Pruning]] the decision tree 