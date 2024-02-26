Bucket Costs Calculator - Joey Whitehead, Fall 2023

This R script is used to calculate the cost value of a randomly generated assortment of samples
that are assigned to corresponding distance_labels (or "buckets"). For example, a generated value
of 1.25 will land in Bucket 1 in the current configuration. The distance_labels, num_samples,
and standard deviation can be easily modified as needed. Currently the final cost value is
calculated using the squared distance between the actual and predicted values (and taking the
square root of the acquired cost value). Another method of calculating cost is by simply taking
the Euclidean distance between the actual and predicted value, though this method does not punish
inaccurate predictions as much.


References:

Ben-David, A. (2006, November 27). Comparison of classification accuracy using Cohen’s weighted kappa. ScienceDirect. https://www.sciencedirect.com/science/article/abs/pii/S0957417406003435?casa_token=Pwv4Oht-iKYAAAAA%3AjP7QI5qcV7cfdhXtYWVBcm2iRsb00FMyDdCZ8KfpqEL29LxXkiMpmK87AzYxRu9DWydpYI-EbZAv 
Kapoor, A., Lee, B., Tan, D., & Horvitz, E. (2010, April 1). Interactive optimization for Steering Machine Classification: Proceedings of the SIGCHI conference on human factors in computing systems. ACM Digital Library. https://dl.acm.org/doi/abs/10.1145/1753326.1753529 
Lang, M., Bischl, B., Richter, J., Schratz, P., Casalicchio, G., Coors, S., Au, Q., Binder, M., Pfisterer, F., Sonabend, R., Schneider, L., Becker, M., & Fischer, S. (2024, January 8). Cost-sensitive Classification Measure. Machine Learning in R - Next Generation. https://search.r-project.org/CRAN/refmans/mlr3/html/mlr_measures_classif.costs.html 
