| Information Gain                                                                                                                 | Gini Index                                                           |
| :------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------- |
| Based on the concept of **Entropy** from Claude Shannon, it measures how much uncertainty is reduced after splitting the dataset | Measures the impurity of a dataset                                   |
| Used mainly in ID3, C4.5                                                                                                         | Used mainly in CART                                                  |
| The attribute with the highest **information gain** is selected for the split<br>                                                | The attribute with the **lowest Gini Index** is chosen for splitting |
| More reduction in entropy -> Better split                                                                                        | Lower Impurity -> Better Split                                       |
| Measures **reduction in randomness**<br>                                                                                         | Measures **how mixed the classes are**                               |
| If all samples belong to one class -> uncertainty = 0                                                                            | All samples belonging to one class -> Gini Index = 0                 |
| If classes are evenly mixed -> uncertainty is maximum                                                                            | Evenly distributed among infinite classes -> Gini Index = 1          |
| It measures how uncertain we are about predicting the class label                                                                | Measures how mixed classes are within a node                         |
| "How unsure am I about the class label?"                                                                                         | "How mixed are the classes in this node?"                            |
![[Gini Index VS Entropy.png]]

Entropy reacts more strongly to class imbalance, thus it may create a very deep tree to minimize uncertainty -> this leads to overfitting where the tree models noise instead of patterns. 

Highly imbalanced dataset:
- Gini Index for prioritizing computational efficiency and want a balanced tree 
- Entropy for aggressively separating the minority class out (but there are chances of overfitting)
