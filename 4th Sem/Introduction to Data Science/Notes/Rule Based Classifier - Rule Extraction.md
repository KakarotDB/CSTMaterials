A representation of the category based on a set of *rules* that describe the scope of that category. 

- Let's say we wish to find the minimal set of consistent rules called logical implications that characterize our decision system.
- Let's say for a set of condition attributes C = {A1, A2, ... , An} and a decision attribute D, these rules should have the form (A1 = a) and (A1 = B) and.... implies that D = d
- a, b,....p are legitimate values from the domains of their respective attribute 

The method for extracting rules is to form a **Decision matrix** corresponding to each individual value d of decision attribute D. 

## Decision Matrix 

- Let's say we have some attributes, and the decision attribute D 
- We divide the objects into two groups for D = d, and D != d
- lists **all the attribute-value pairs that differ** between the target group and the non-target group
- Next, we translate the matrix row into a Boolean algebraic expression. 

So it's like calculating the differences between objects for a target Decision class value, and then calculating a boolean expression for it. 
This is for each object that belongs to that value. 

Thus, we get our rules from this. 
Informally, the decision matrix for value d of decision attribute D lists all attribute–value pairs that differ between objects having D = d and $D \neq d$ 

Quite a bit of computation is involved, but it's relatively easy and straightforward.  We calculate for all possible decision class values. 


