- The rest of the other methods discussed have assumed that the training records are sampled without replacement. As a result, there are no duplicated records in the training and test sets.
- **Bootstrap** is a technique to that resamples the data with replacement 
- The model is then trained on the resampled dataset and evaluated on the test data set (not in the bootstrap sample) 
- This process is repeated multiple times, and the results are averaged to get an estimate of the model's performance 
- Works well with small datasets 
- Samples the given training tuples *uniformly with replacement*


## 0.632 Bootstrap

Let us say that our original data set D has N samples so |D| = N
we randomly draw N samples (with replacement) to create a new bootstrap training set $D_1$ 
- The bootstrap samples $D_1$ are used as training set and the samples of D not included in $D_1$ is the test set say $T_1$ 
- The probability of not picking up a sample in a single draw is $1 - \frac{1}{N}$ 
- The probability of a sample never being picked in N draws is $(1 - \frac{1}{N})^N$
- If N is sufficiently large, this probability converges to $\frac{1}{e}$
- Therefore the probability that a sample is selected for the training set is 1 - 1/e = 0.632 (appx) 
- This means our training set $D_1$ will contain approximately 63.2% of the original samples. The leftover samples are put into test set to represent remaining ~36.8% of the data 
- We repeat the sampling procedure $k$ times, we get the models $M_1, M_2, ..., M_k$ where the training and test set for $M_i$ are $D_i$ and $T_i$ respectively 
- Thus overall accuracy of the model is :
$$ 
Accuracy = 0.632 \times Accuracy_{test} + (1 - 0.632) \times Accuracy_{Train}
$$
$Accuracy_{test}$ = average accuracy on test sets
$Accuracy_{train}$ = average accuracy on training sets 


Now, *why do we use both testing and training accuracy?*
- In standard holdout methods, we only look at testing accuracy because it gives an unbiased estimate. 
- **Variance from the Test Set:** Because the test set (T1​) only contains roughly 36.8% of the data, relying solely on it introduces a high amount of variance
- **Bias from the Training Set:** Using training accuracy alone is overly optimistic (biased) because the classifier is being tested on the exact same data it was trained on
- By assigning a 63.2% weight to the realistic test accuracy and a 36.8% weight to the training accuracy, the formula perfectly balances the bias from the training data with the variance from the limited test data

**Advantages and limitations**

- **Advantages:** This method provides a better accuracy estimate than a simple holdout validation, heavily reduces the overfitting bias of training accuracy, and is much more stable than k-fold cross-validation when applied to small datasets
- **Limitations:** Because it requires resampling the data and retraining the model multiple times, it is computationally expensive to run on large datasets. Additionally, some bias may still remain if the chosen classifier is highly prone to overfitting the training data