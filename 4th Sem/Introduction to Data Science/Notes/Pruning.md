Pruning is a technique used to reduce the complexity of a decision tree by **removing unnecessary branches** that do not contribute significantly to decision-making. 

## Pre Pruning (Early Stopping)

- Stop the tree from growing too deep by limiting its complexity *during training*
- Techniques involved : 
	- Max Depth : Set limit to how deep tree can grow 
	- Min samples per leaf 
	- Min samples per split : Ensure minimum number of samples required to split a node 


## Post Pruning

- Grow the tree fully and then remove branches that do not improve accuracy 
- Techniques involved : 
	-  Use cross-validation to decide which branches to prune
	- Set a pruning parameter $\alpha$ in Cost Complexity Pruning (CCP) to penalize tree complexity 


## Cost Complexity Pruning 

- We want simplicity too to avoid overfitting
- CCP balances accuracy and simplicity using the following formula :
$$ 
R_\alpha(T) = R(T) + \alpha\cdot |T|
$$
- R(T) -> Error of the tree 
- |T| -> Number of leaf nodes 
- $\alpha$ -> Penalty for complexity 

Alpha here is like a knob, wherein the value being zero would imply that there is no penalty for complexity, and can lead for overfitting. When it's small, there is slight penalty but still keeps most splits. When it's large there is heavy penalty on tree size, many branches get removed in the process. This leads to a simpler tree which can lead to underfitting 

## Underfitting 

This happens when the model is too simple and fails to learn the data
Underfitting = model too simple to capture the real patterns in the data 
The model misses important relationships 

Key characteristics:
- High error on training data
- High error on test data
- Model is too simple 

Now this can happen in decision trees when 
- Tree is too shallow 
- High min_samples/split
- High min_samples/leaft 
- High pruning parameter $\alpha$

To fix it : 
- increase depth
- Reduce pruning 
- Lower min_samples/leaf or min_samples/split

## Parameter VS Hyperparameters 

Parameters are automatically learned by the model during training
We **do not** set these manually - the algorithm figures it out. 

Hyperparameters are set before training. These are controls that we set to guide how the tree is built. 
Things like : 
- Tree size and shape 
- Max depth
- min samples / split 
- min samples / leaft 
- max leaf nodes 
- Pruning/Regularization : $\alpha$ 