- A technique used in imbalanced classification problems to remove borderline or noisy instances -> leading to improved classifier performance 
- A **Tomek Link** exists between two instances ($x_1 \ and \ x_2$) from different classes if : $x_1$ is the nearest neighbor of $x_2$ and the other way around too. 

## Uses 

- **Identifies and removes overlapping instances**: By eliminating major class instance in each Tomek link, one can reduce the overlap between classes, leading to better define class boundaries. 
- **Clean the dataset:** Idea is that pairs that lie close to the decision boundary might represent noise or borderline cases. Removing Tomek links help in getting rid of this noise and noisy instances that may adversely affect the classifier's performance 