CART (Classification And Regression Trees) is based on the Gini Index. 

## Gini Index

The Gini coefficient measures the **inequality** among the values of a **frequency distribution**, such as levels of **income**. 
It is utilized as a measure of impurity in decision tree algorithms for classification tasks. 

Gini coefficient = 0 -> perfect equality, where all income or wealth values are the same 
Gini coefficient = 1 -> reflects maximal inequality, a situation where a single individual has all the income while all other have none 

It is used to determine the best attribute for splitting Data.

$$ Gini = \sum_{i = 1}^{n}p_i(1 - p_i)$$
Which is equivalent to 
$$
\begin{aligned}

G &= \sum_{i = 1}^{n}p_i - \sum_{i = 1}^{n}p_i^2 \\
G &= 1 - \sum_{i = 1}^{n}p_i^2 \\\\
\end{aligned}
$$
where, 
n = number of classes
$p_i$ = probability of an instance belong to class i
## Properties of Gini Index 

- *Lower* Gini index indicates purer node, while *Higher* means more impurity (mixed classes) 
- *Range* is from $[0, 1]$
- 0 -> pure node (all instances belong to one class)
- 1 -> Maximum impurity (instances are evenly distributed among all classes) 
- The attribute with lowest Gini index is chosen for split, as it results in purer child nodes 
- For binary classification problem it ranges from $[0, 0.5]$
- Gini Index is exactly 1 when the classes are infinitely and equally distributed 
- Practically it can approach 1 but does not reach *1*


## Gini Index for data set 

- If a data set D contains examples from n classes,
$$ 
Gini(D) = 1 - \sum_{i = 1}^{n}p_i^2
$$
- If a data set D is split on A into two subsets D1 and D2 then 
$$
Gini_A(D) = \frac{|D_1|}{|D|} \cdot Gini(D_1) + \frac{|D_2|}{|D|} \cdot Gini(D_2)
$$
- Reduction in impurity : 
$$
\Delta Gini(A) = Gini(D) - Gini_A(D)
$$
- The **attribute** which provides the **largest reduction in impurity** is chosen to be the split node. 


## Constructing CART using Gini Index 

- **Step 1** : Compute Gini Index for the root node 
- **Step 2:** Calculate Gini Index for each attribute split 
- **Step 3:** Select the best attribute for splitting (highest $\mathbf{Gini_A(D)}$ value)
- **Step 4:** Create the First split in the decision tree 
- **Step 5:** Further splitting on rest of the attributes 

## How to decide which one to use

- **Computational Efficiency** -> Gini Index (CART) 
- More theoretically sound measure that accounts for information gain -> entropy 


