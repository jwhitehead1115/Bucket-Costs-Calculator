Bucket Costs Calculator - Joey Whitehead, Fall 2023

This R script is used to calculate the cost value of a randomly generated assortment of samples
that are assigned to corresponding distance_labels (or "buckets"). For example, a generated value
of 1.25 will land in Bucket 1 in the current configuration. The distance_labels, num_samples,
and standard deviation can be easily modified as needed. Currently the final cost value is
calculated using the squared distance between the actual and predicted values (and taking the
square root of the acquired cost value). Another method of calculating cost is by simply taking
the Euclidean distance between the actual and predicted value, though this method does not punish
inaccurate predictions as much.
