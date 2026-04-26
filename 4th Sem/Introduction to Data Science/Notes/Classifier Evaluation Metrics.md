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