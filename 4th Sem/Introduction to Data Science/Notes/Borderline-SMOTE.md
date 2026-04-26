This is a variation of SMOTE designed to **focus on samples near the decision boundary** rather than generating synthetic data randomly across the minority class. 

Improves model performance by **strengthening the decision boundary**

## 1. Identify Borderline Instances 

- For each minority class instance, find its k nearest neighbors 
- Count how many of these neighbors belong to *minority class*
- If *most of the KNNs* are from majority class, the minority instance is considered *borderline instance* which are "hard to classify". 
- These borderline instances are selected for oversampling 

## 2. Generate Synthetic Samples 

- Similar to SMOTE, synthetic points are created only for borderline instances 
- A new sample is generated along the line segment between the borderline instance and one of its k minority class neighbors. 

$$ 
X_{new} = X_{original} + \lambda \times (X_{neighbor} - X_{original})
$$
where $\lambda$ is a random number in $[0,1]$ '

## Types of Borderline SMOTE

- **Borderline SMOTE1:** Only oversamples the identified borderline minority instances 
- **Borderline SMOTE2:** Generates more synthetic points between the minority instances and majority-class neighbors further strengthening the decision boundary 

## Differences between Borderline-SMOTE1 & 2

![[Pasted image 20260425143744.png]]