- Data Splitting technique that divides the original dataset into two subsets namely training and test set 
- Training set is used to build the classifier, test set is used to evaluate how well the model can generalize the new data and evaluate the effectiveness of the model 
- Test set is also called hold out set since it's held out from the model development process 
- A common rule of thumb is to use 2/3rd for training 1/3rd for test 
- This can vary depending on size and characteristic of the data 
- We need to ensure that both the sets are good representations of the the original data, meaning they have similar distributions and proportions of objects and classes 
- This can be done by stratified sampling which preserves the relative frequencies of different groups of data

**Limitations**

- Fewer objects are available for training as some of the objects are withheld for testing. Thus, the trained model may not be as good as when all the labelled objects are used for training
- The model may be highly dependent on the composition of the training and test sets 
- Smaller training set size, the larger the variance of the model 
- On the other hand, if the training set is very large, then the estimated accuracy is less reliable. With a very large training set, the model may overspecialize and overfit in recognizing patterns within the training data, making it less generalizable to unseen data 

**Advantages**

- Easy and simple to implement 
- Efficient and fast 

**Disadvantages**

- Sensitive to choice of split, different splits may result to different accuracies 
- Wasteful and potentially biased as it does not use all the available data for training or testing 
- Unstable and variable, as it may not reflect the true  performance of the model over multiple runs 