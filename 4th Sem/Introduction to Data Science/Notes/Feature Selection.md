A type of [[Dimensionality Reduction]]

Feature selection is a type of data/dimensionality reduction technique which is of two types : supervised and unsupervised. 
Feature selection methods include exhaustive, heuristic.
Evaluation methods include filter and wrapper 

# Evaluation Methods 

- **Filter Methods**:
	-  These evaluate feature subsets independently of any specific classification algorithm. 
	- Advantage : Much faster computationally and produce subsets that can work well with any classifier 
	- Disadvantage : They tend to select more features and generally have lower recognition accuracy 
- **Wrapper Methods**
	- These evaluate subsets based on the predictive accuracy of the actual classification algorithm involved 
	- Advantage : Achieve higher recognition accuracy. 
	- Disadvantage : They are computationally much slower, and might not generalize will to other classifiers. 

---
# Heuristic Search Methods 

## Naive Search 

- Given n features, sort them on the basis of "goodness" based on some object function 
- Choose top d features 
**Disadvantages**
- Correlation among features is not considered 
- Best pair may not contain the best individual features 

## Step Wise Forward Selection (SFS)

- The best single feature is selected from n features based on some objective function 
- We build pairs with this best feature, selecting the best pair.
- Next triplets are chosen, choosing the best triplets, and so on. 
- This procedure continues till a predefined number of features are selected 
- Works best when optimal subset is small. 
- Main limitation is that it is unable to remove features that may become redundant or useless later on. 

## Stepwise Backward Removal (SBR)

- We remove one feature by computing the objective function for all subsets with **n - 1** features, and the worst feature is discarded 
- Next, one feature among n - 1 features is deleted the same way computing objective function for all subsets with n - 2 features 
- We continue this procedure until a predefined number of features are left 
- Main limitation is its inability to re-evaluate the usefulness of a feature after it has been discarded 

## Bi-Directional Search (BDS)

- Applies SFS and SBR simultaneously 
- **Opposite Starting points:** SFS starts from the ground up i.e. starting with empty set whilst SBR prunes down - starting with the full feature set 
- **Convergence Rules:**
	1. Features that have been already selected by SFS cannot be removed by SBR 
	2. Features that have been already removed by SBR cannot be selected by SFS

## Plus L, Minus R (LRS)

- **L** and **R** are **user-defined** parameters 
- **A** = Feature set, **F** = feature subset
*Two Cases:* 
1. ==L > R== & ===F is empty set===:
	- Repeatedly add **L** features into **F** by **SFS**
	- Repeatedly remove **R** features into **A** by **SBR**
	- Repeat cycle till desirable number of features have been met 
2. ==L < R== & ==F = A==:
	- Repeatedly removes **R** features from **F** by **SBR** and store them in **A** 
	- Repeatedly add **L** features from **A** into **F** by **SFS** 

Main limitation : How to choose optimal values of L and r ? 

## Stepwise Floating Forward Selection (SFFS)

- Starts from empty set 
- After each forward step, multiple backward steps are taken as long as the objective function increases 
- Repeat until desirable features are taken 

## Stepwise Floating Backward Removal (SFBR) 

- Starts from the full set 
- After Each backward step, SFBR performs multiple forward steps as long as objective function increases 