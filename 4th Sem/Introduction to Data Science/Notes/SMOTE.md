
**Synthetic Minority Class Oversampling Technique**

- **Find Neighbors:** For a given sample in the minority class, it finds k nearest neighbors that are also part of the minority class 
- **Select Neighbor**: It randomly picks one of the nearest neighbors 
- **Create Synthetic Sample:** It generates new synthetic data point along the line segment connecting the original sample and the randomly chosen neighbor 

The synthetic sample is generated as a weighted combination of the two points: 
$$ 
new_{sample} = sample + rand(0,1) \times (neighbor - sample)
$$

## Key points 

- **Synthetic Sampling**: New samples are created that are not identical to existing ones 
- **Better generalization:** SMOTE often leads to better model generalization because the model gets a more balanced view of the minority class 
- **Use with Caution:** SMOTE may sometimes introduce noise, especially if the minority class samples are spread across a wide feature space or overlap significantly with the majority class. 