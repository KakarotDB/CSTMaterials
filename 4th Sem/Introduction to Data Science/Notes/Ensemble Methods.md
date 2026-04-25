In ensemble methods, instead of relying on a single decision tree, it creates multiple decision trees and combines their results for better generalization. 

## Random Forest 

- Constructs multiple decision trees and *averages their predictions*, reducing variance
- Uses *feature randomness* to prevent overfitting. 

## Gradient Boosting Trees

Things like XGBoost, LightGBM, CatBoost 

- Boosting algorithms build multiple trees sequentially, each correcting errors of the previous tree 
- Regularization methods help prevent overfitting. 

## Feature Selection and Engineering 

- Remove irrelevant/redundant features to simplify the tree 
- Use correlation analysis to identify and remove highly correlated features 

## Regularization (Hyperparameter Tuning) 

- Max depth 
- Min sample per split 
- Min sample per leaf nodes 
- Max features 

## Cross Validation 

- Using k fold cross validation to evaluate model performance on different data splits and prevent overfitting