| **Confusion Matrix** |   **Predicted:** Positive    |   **Predicted:** Negative    |
| :------------------- | :--------------------------: | :--------------------------: |
| **Actual:** Positive | True Positive <br> **(TP)**  | False Negative <br> **(FN)** |
| **Actual:** Negative | False Positive <br> **(FP)** | True Negative <br> **(TN)**  |


## Precision 

Exactness
What % of tuples that the classifier labelled as positive are actually positive ? 
$$ Precision = \frac{TP}{TP + FP}
$$

## Recall 

Completeness
What % of positive tuples did the classifier label as positive ? 
$$
Recal = \frac{TP}{TP + FN}
$$
## Classifier Accuracy 
Recognition rate 
Percentage of test tuples that are correctly classified 

$$ 
Accuracy  = \frac{TP + TN}{TP + TN + FN + FP }
$$ 

## $F_1$ Score 

Harmonic mean of precision and recall 
$$
F-measure = \frac{2 \times Precision \times Recall}{Precision + Recall}
$$

## $F_\beta$ - score 

Weighted measure of precision and recall. It assigns $\beta$ times as much weight to recall as precision. 
Recall is considered $\beta$ times more important than precision 

$$
F_\beta = \frac{(1 + \beta^2) \cdot Precision \cdot Recall}{(\beta^2 \cdot Precision) + Recall}
$$
- $\beta$ > 1 : Recall is more important than precision
- $\beta$ < 1: Precision is more important than recall 
At $\beta$ = 1 it becomes standard F1-score. 

## Sensitivity = Recall 

True positive recognition rate 

## Specificity 

True Negative recognition rate

$$
Specificity = \frac{TN}{N} = \frac{TN}{TN + FP}
$$

 ---
 
In a disease dataset, **Recall** is crucial because it's important to minimize false negatives, ensuring that most (if not all) actual cases are identified. 
Missing a disease case (false negative) could have severe consequences for patient health.

**Precision** is very important in fraud detection. 
High precision in fraud detection ensures that only truly fraudulent transactions are identified, minimizing unnecessary intervention.

---

## Mitigation Strategies 

- **Class weights:** Adjust the loss function by assigning higher weights to minority class samples, making errors on minority samples more significant 
- **Resampling** Use techniques like oversampling the minority class or under sampling the majority class 
- **Use Advanced Models:** Ensemble methods, such as random forests or gradient boosting. 


---

## Methods of Estimating Classifier's Performance 

- [[Holdout Method]]
- [[Random Subsampling]]
- [[Boostrap]]
- [[Cross-Validation]]

---

## Confusion Matrix for Multiple classes 

This is the test set : (191 samples total)

| Class | Number of Samples |
| :---: | :---------------: |
|   1   |        60         |
|   2   |        34         |
|   3   |        43         |
|   4   |        54         |

The following is a confusion matrix obtained by training a classifier and evaluating the trained model on the test set : 

$$
\begin{array}{c|cccc} 
\text{Predicted } \backslash \text{ Expected} & 1 & 2 & 3 & 4 \\ 
\hline 
1 & 52 & 3 & 7 & 2 \\ 
2 & 2 & 28 & 2 & 0 \\ 
3 & 5 & 2 & 25 & 12 \\ 
4 & 1 & 1 & 9 & 40 
\end{array}
$$

The overall accuracy is 75.92%

The decision boundary between class 2 and class 4 is well defined as we can see here

For class 3 - there were 8 classes misclassified 
Prediction rate for class is 58.14% 

This confusion matrix can also be converted into a one-vs-all type matrix (binary class confusion matrix) for calculating class wise metrics like accuracy, precision, recall, f1-score, etc. 

$$
\begin{array}{ccc}
\begin{array}{c|cccc} 
\text{Pred } \backslash \text{ Exp} & 1 & 2 & 3 & 4 \\ 
\hline 
1 & \mathbf{52} & 3 & 7 & 2 \\ 
2 & 2 & 28 & 2 & 0 \\ 
3 & 5 & 2 & 25 & 12 \\ 
4 & 1 & 1 & 9 & 40 
\end{array}

& \xrightarrow{\text{Class 1 vs Rest}} &

\begin{array}{c|cc} 
\text{Pred } \backslash \text{ Exp} & \text{+ve} & \text{-ve} \\ 
\hline 
\text{+ve} & \mathbf{52} & 12 \\ 
\text{-ve} & 8 & 119 
\end{array}
\end{array}
$$

Using this concept, we can calculate the class wise accuracy, precision, recall, and f1-scores and tabulate the results 

| Class | Precision (%) | Recall (%) | F1-Score (%) |
| :---: | :---: | :---: | :---: |
| 1 | 81.25 | 86.67 |    83.87     |
| 2 | 87.50 | 82.35 |    84.85     |
| 3 | 56.82 | 58.14 |    57.47     |
| 4 | 78.43 | 74.07 |    76.19     |

There are a few more global metrics that can be calculated, which are variations of the f1-score

**Micro averaged F1-Score**

- It is calculating considering the Net TP, sum of class-wise TP 
- Net FP
- Net FN 
- Micro precision = $\frac{Net TP}{Net TP + Net FP }$
- Micro Recall = $\frac{NetTP}{Net TP + Net FN}$
- Micro F1-score = harmonic mean of the other two 

**Macro Average Score**

- This is calculated for each class individually, and then the unweighted mean of the measures is calculated to calculate the net global score 
- From the previous table we can get unweighted means of the measures 
- Macro Precision
- Macro Recall
- Macro F1-Score 

The macro weighted-average scores take a sample weighted mean of the class wise scores obtained  
It gives more importance to those classes having more samples 

## Receiver Operating Characteristics (ROC) Curve 

- ROC curve is a plot for displaying the tradeoff between true positive rate and false positive rate of  classifier at different threshold settings 
- They are usually defined for binary classification models, although it can be extended towards a multi-class setting 
- The definition of True Positive Rate (TPR) coincides exactly with the sensitivity or recall 
- TPR = Recall = $\frac{TP}{TP + FN}$
- False Positive Rate (FPR) is defined as the number of negative class samples predicted wrongly to be in the positive class, out of all the sample in the dataset that actually belong to the negative class 
$$
FPR = \frac{FP}{FP + TN} = 1 - \frac{TN}{FP + TN} = 1 - Specificity
$$

Both of these can be calculated easily from the confusion matrix 

In the ROC curve, TPR is plotted along y-axis, FPR is plotted along x axis 
Each point along the curve corresponds to one of the models induced by the classifier

Some well known critical points along ROC curve : 

- TPR = 0, FPR = 0: Every instance predicted as negative class 
- TPR = 1, FPR = 1: Every instance predicted as positive class 
- TPR = 1, FPR = 0 : Ideal model 

![[Pasted image 20260429135957.png]]

Good classifier should be located as close as possible to upper left corner as visible from the above diagram 

A model that makes random predictions is called a random classifier or "No Skill" classifier (skill issue) 

A *Perfect Learner* is one which classifies every sample correctly, and it also acts as a reference line for the ROC plot 

Another important metric is the Area Under ROC curve or AUROC

The higher value of AUROC represents a better classifier, the AUC of the practical learner being above 90% is a good score 
AUC of random classifier = 0.5, ideal = 1

What is meant by *Thresholds* in the context of ROC ? 
- Different thresholds represent the different possible classification boundaries of a model 