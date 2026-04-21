It is a **measure of uncertainty** associated with a random variable 

For a discrete random variable $Y$ taking $m$ distinct values ${y_1, y_2, ..., y_m}$ 

$H(Y) = -\sum_{i=1}^{m} p_i \log(p_i) \text{, where } p_i = P(Y = y_i)$

Higher entropy implies higher uncertainty, and vice versa 

Mostly will be referring to **Shannon Entropy**
Therefore the formula for an event X with n possible outcomes and probabilities $p_1, ...., p_n$ : 
$$ H(X) = H(p_1, ..., p_n) = - \sum_{i=1}^{m} p_i \log_2(p_i) $$

## Some properties

Basic : 

1. Uniform distributions have *maximum uncertainty*
2. Uncertainty is **additive** for **independent events** 
3. Adding an outcome with **zero probability** has **no effect**
4. The measure of uncertainty is **continuous** in all its arguments

This gives rise to the uniqueness theorem, wherein it shows that the only family of functions that satisfy these four properties described above are of the following Shannon Entropy format, with just a constant being multiplied outside the summation (in this case the constant is 1).

More properties : 
- Uniform Distributions with more outcomes have more uncertainty 
- Events have non negative uncertainty 
- Evens with a certain outcome have zero uncertainty 
- Flipping arguments has no effect 