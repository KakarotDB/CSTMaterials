
## K Fold Cross Validation 

- k = 10 is most popular 
- Randomly partition the data into k mutually exclusive subsets, each approximately equal size 
- At $i^{th}$ iteration, use $D_i$ as test set and other as training set  
- We leave one out, k folds where k = number of tuples, for small sized data 

## Stratified Cross Validation 

- Folds are stratified so that class distribution in each fold is approximately same as that in the initial data. 