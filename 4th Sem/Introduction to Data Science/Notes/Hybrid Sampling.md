## 1. SMOTE - Tomek 

- First applies SMOTE to generate synthetic samples for the minority class 
- Then uses TOMEK links to clean the resulting dataset by removing overlapping instances

## 2. SMOTE - ENN

- SMOTE + Edited nearest neighbors 
- First oversamples minority class using SMOTE and then cleans dataset using ENN 
- This combination helps improve class balance whilst removing noisy and borderline instances, leading to better classification performance 
- ENN is under sampling which removes samples from both minority and majority class that are misclassified by its k nearest neighbors (k usually 3) 

**Advantages**
- Better class balance 
- Reduces noise 
- Stronger decision boundary 