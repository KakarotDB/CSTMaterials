- Holdout method is repeated several times 
- Let $Acc_i$ be model accuracy during $i^{th}$ iteration. Overall accuracy is given by 
$$
A = \sum_{i = 1}^{k}\frac{Acc_i}{k}
$$
- It still encounters some of the problems associated with the holdout method because it does not utilize as much data as possible for training 
- It also has no control over the number of times each record is used for testing and training. Consequently, some objects might be used for training more often than others. 