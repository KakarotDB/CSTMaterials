**Bayes' Theorem**

$$ 
\begin{align}
P(A|B) &= \frac{P(B|A) \cdot P(A)}{P(B)} \\ 
P(B) &= \sum_{i=1}^{n} P(B|A_i) \cdot P(A_i) \\

\therefore P(A_k|B) &= \frac{P(B|A_k) \cdot P(A_k)}{\sum_{i=1}^{n} P(B|A_i) \cdot P(A_i)}
\end{align}
$$ 
- **$P(A|B)$**: Posterior probability (the probability of event $A$ occurring given that $B$ is true).
- **$P(B|A)$**: Likelihood (the probability of event $B$ occurring given that $A$ is true).
- **$P(A)$**: Prior probability (the initial probability of event $A$ occurring).
- **$P(B)$**: Marginal probability (the total probability of event $B$ occurring).

## Proof of Bayes' Theorem

**Step 1: The Definition of Conditional Probability**
By the standard definition of conditional probability, the probability of event $A$ occurring given that $B$ has already occurred is:
$$P(A|B) = \frac{P(A \cap B)}{P(B)}$$
*(Assuming $P(B) \neq 0$)*

**Step 2: The Reverse Condition**
Similarly, the probability of event $B$ occurring given that $A$ has already occurred is:
$$P(B|A) = \frac{P(B \cap A)}{P(A)}$$
*(Assuming $P(A) \neq 0$)*

**Step 3: Isolate the Intersection**
In probability, the intersection of two events is commutative, meaning $P(A \cap B)$ is the exact same thing as $P(B \cap A)$. 

Knowing this, we can take the equation from Step 2 and multiply both sides by $P(A)$ to solve for the intersection:
$$P(A \cap B) = P(B|A) \cdot P(A)$$

**Step 4: Substitution**
Now, take that resulting expression for $P(A \cap B)$ and plug it right back into the numerator of our original equation from Step 1. 

This gives us the final theorem:
$$P(A|B) = \frac{P(B|A) \cdot P(A)}{P(B)}$$

## Laplace's Urn Problem 

**Question**

- There are $(N + 1)$ identical urns marked $0, 1, 2, ... , N,$ each of which contains N total balls, made up of a mix of white and black balls. 
- The $i^{th}$ Urn contains $i$ black and $N - i$ white balls $\forall i = [1, 2, 3, ..., N]$  
- An urn is chosen at random, and n random drawings are made from it, the ball drawn being always replaced 
- If all the n balls turn out to be black, what is the probability that the next ball drawn will also be *black?* 

**Solution**

$$
\begin{align}
A_i &: \text{The event that the } i^{\text{th}} \text{ urn is chosen} \\\\
P(A_i) &= \frac{1}{N + 1} \\\\
X &: \text{The event that all } n \text{ balls drawn are black} \\\\

P(X|A_i) &= (\frac{i}{N})^{n} \\\\

\therefore P(X) &= \sum_{i = 0}^{N} P(A_i) \cdot P(X | A_i) \\
&= \sum_{i = 0}^{N} \frac{1}{N + 1}(\frac{i}{N})^{n} \\
&= \frac{1}{N + 1}\sum_{i = 0}^{N}(\frac{i}{N})^{n} \\\\
\end{align}
$$
Now, let Y : $(n + 1)^{th}$ ball drawn is black 
Then, XY = the event that all the (n + 1) balls drawn are black 
$$
\therefore P(XY) = \frac{1}{N + 1}\sum_{i = 0}^N (\frac{i}{N})^{n + 1} 
$$
Hence, 
$$
P(Y | X) = \frac{P(XY)}{Y} = \frac{\frac{1}{N + 1}\sum_{i = 0}^N (\frac{i}{N})^{n + 1}}{\frac{1}{N + 1}\sum_{i = 0}^{N}(\frac{i}{N})^{n}} = \frac{\sum_{i = 0}^N (\frac{i}{N})^{n + 1}}{\sum_{i = 0}^{N}(\frac{i}{N})^{n}}
$$
This is the required probability
Now, if N is very large, then 
$$
\begin{align}
P(X) &\cong \frac{1}{N} \sum_{i=0}^{N} \left(\frac{i}{N}\right)^n \cong \int_{0}^{1} x^n \, dx = \frac{1}{n+1} \\
P(XY) &\cong \frac{1}{N} \sum_{i=0}^{N} \left(\frac{i}{N}\right)^{n+1} \cong \int_{0}^{1} x^{n+1} \, dx = \frac{1}{n+2}
\end{align}
$$

Therefore,
$$
P(Y/X) = \frac{P(XY)}{P(X)} = \frac{\sum_{i=0}^{N} \left(\frac{i}{N}\right)^{n+1}}{\sum_{i=0}^{N} \left(\frac{i}{N}\right)^n} = \frac{n+1}{n+2}
$$

## Naive Bayesian Classification 

- It is a statistical classifier that performs probabilistic prediction -> predicts class membership probabilities 
- Its foundation lies in Bayes' Theorem 
- A simple Bayesian classifier ahs comparable performance with decision tree and selected NNs 

## Prediction Based on Bayes' Theorem 

- Given training data **X**, posteriori probability of a hypothesis **H**  P(H | X), follows the Bayes' theorem 
$$
P(H|X) = \frac{P(X|H) \cdot P(H)}{P(X)}
$$
- Predicts **X** belongs to $C_i$ if the probability $P(C_i | X)$ is the highest among all the $P(C_k | X)$ for all the k classes 
- The difficulty here is that it requires prior or initial knowledge of many probabilities, involving significant computational cost. 

The goal of classification here is to derive the maximum posteriori 

- Let D be the training set of tuples and their associated class labels 
- Each tuple is represented by an n-D attribute Vector $X = (x_1, x_2, ..., x_n)$
- Let us suppose there are $m$ classes, $C_1, C_2, ..., C_m$ 
- We want to derive the maximum posteriori that is the maximal $P(C_i|X)$ 
- This can be derived from Bayes' theorem 
$$ 
P(C_i|X) = \frac{P(X|C_i) \cdot P(C_i)}{P(X)}
$$
- P(X) remains constant for all classes, so we just need to maximize the numerator 


In Naive Bayes' Classifier, to avoid the significant computational cost a simple assumption is made : attributes are conditionally independent i.e. there are no dependency relation between attributes 

$$
P(X | C_i) = \prod_{k = 1}^n P(x_k | C_i)
$$
This greatly reduces the computational costs, and it only counts the class distribution 

- if an attributes $A_k$ is categorical, $P(x_k | C_i)$ is the number of tuples in $C_i$ having value $x_k$ for $A_k$ divided by $|C_{i , D}|$ (number of tuples of $C_i$ in D)
- If an attribute $A_k$ is continuous-valued, then the probability is usually computed based on Gaussian distribution with a mean $\mu$ and standard deviation $\sigma$  

**Advantages**
- Easy to implement
- Good results obtained in most of the cases 
**Disadvantages**
- Class conditional independence is assumed, therefore there is loss of accuracy 
- Practically dependencies exist among variables (examples including things like hospitals, patient profiles with their symptoms, etc) 
- Dependences among these cannot be modeled by Naive Bayes Classifier 
We deal with these dependencies using Bayesian Belief Networks 


## Overfitting in Naive Bayes Classification 

Although it is generally less prone to overfitting as compared to more complex models, it can still happen. 

### 1. When the training data is noisy or small 

- Small dataset -> estimated probabilities may not generalize well to new data 
- Model might assign very high or very low probabilities to certain features, making predictions too rigid

### 2. When features are strongly correlated 

- It assumes independence between features, which is often unrealistic
- If features are highly correlated, the model might double-count information, leading to biased probability estimations and poor generalization. 

### When using Maximum Likelihood Estimation (MLE)

- If a class-feature combination does not appear in the training set then it gets assigned zero probabililty
- This makes the classifier overfit by being overly confident about observed data and falling on unseen examples 

## Resolving Overfitting 

### 1. Avoiding Zero Probability Problem 

- Use smoothing (Laplace/additive Smoothening)
- Prevents zero probability by adding a small value to all counts 
- Formula for Laplace smoothening is $P(w|C) = \frac{count(w,C) + \alpha}{count(C) + \alpha \times |V|}$
- $\alpha$ is a smoothening parameter which is typically 1 
- |V| is the vocabulary size 

### 2. Feature Selection/Dimensionality Reduction 

- Remove redundant or highly correlated features to better align with the naive bayes independence assumption 
- PCA, LDA, Mutual information etc

### 3. Use a more advanced Naive Bayes Variant 

- Gaussian Naive Bayes 
- Multinomial Naive Bayes 
- Bernoulli Naive Bayes 

### 4. Bayesian Priors 

- Instead of relying on purely observed data, incorporate prior knowledge to balance probabilities

### 5. Cross-Validation 

- Use K-Fold cross validation to ensure the model generalizes well across different training sets 
- It also helps in choosing smoothening parameter $\alpha$
- It systematically evaluates different values of $\alpha$ on multiple training and validation sets, ensuring optimal performance. 
- This improves generalization ability of the Naive Bayes Classifier, ensuring it handles unseen data effectively 
