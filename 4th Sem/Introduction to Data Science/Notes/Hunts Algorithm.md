- Decision tree is grown in a recursive fashion by partitioning the training records into successively purer subsets
- Basis of algorithms like [[ID3]], [[C4.5]],  [[CART]]

### Recursive definition 

Let $D_T$ be the set of training records that are associated with node t and y = {y1, y2, ..., yc} be the class labels. 

- **Step 1:** If All the records in $D_t$ belong to same class $y_t$ then t is a leaf node labelled as $y_t$ 
- **Step 2:** If $D_t$ contains records that belongs to more than one class, an *attribute test condition* is selected to partition the records into smaller subsets. A child node is created for each outcome of the test condition and the records in $D_t$ are distributed to the children based on the outcomes. 
- Recursively apply these two steps to each child node 


Based on  [[ID3]], [[C4.5]],  [[CART]]
We can have a comparison with [[Information Gain VS Gini Index]]