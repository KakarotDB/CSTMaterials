**ID3** refers to **Iterative Dichotomizer 3**, and is developed by **Ross Quinlan** 
It iteratively dichotomizes the data using a top down **greedy approach** 

## Algorithm

The tree is constructed in a top-down recursive divide and conquer manner 

- At the start, all training examples are the root
- Attributes are categorical (if continuous valued - they are discretized in advance) 
- Examples are partitioned recursively based on selected attributes 
- Test attributes are measured on the basis of a heuristic or statistical measure like *information gain*

Stopping conditions 
- All samples for a given node belong to same class 
- There are no remaining attributes for further partitioning - *majority voting* is employed for classifying leaf node 
- There are no samples left 

Now, since ID3 is greedy, it optimizes locally at each iteration to decide which attribute provides the best split point. 

To do this, ID3 relies on an [[Entropy]]-theory-based optimization function called **Information Gain**.

- Entropy measures the level of uncertainty or randomness in predicting a class label.
- Information Gain calculates how much that uncertainty is reduced after splitting the dataset based on a specific attribute.
- At each step, ID3 selects the attribute that yields the **highest information gain**, ensuring the maximum reduction in entropy for that specific split.


## Attribute selection measure : Information Gain 

We have to select the attribute with the highest information gain. 

Let $p_i$ be the probability that an arbitrary tuple in D belongs to class $C_i$ estimated by $|C_{i,D}| / |D|$

Expected information (entropy) needed to classify a tuple in D : 
$$ Info(D) = - \sum_{i = 1}^{m}{p_i}{\log_2(p_i)} $$
**Information** needed (after using A to split D into v partitions) to classify a tuple in D : 
$$ Info_A(D) = \sum_{j = 1}^{v} {\frac{|D_j|}{|D|} \times Info(D_j)} $$
**Information gained** by branching on attribute A 
$$ Gain(A) = Info(D) - Info_A(D) $$ 
