# Bucket Costs Calculator - Joey Whitehead, Fall 2023
# This R script is used to calculate the cost value of a randomly generated assortment of samples
# that are assigned to corresponding distance_labels (or "buckets"). For example, a generated value
# of 1.25 will land in Bucket 1 in the current configuration. The distance_labels, num_samples,
# and standard deviation can be easily modified as needed. Currently the final cost value is
# calculated using the squared distance between the actual and predicted values (and taking the
# square root of the acquired cost value). Another method of calculating cost is by simply taking
# the Euclidean distance between the actual and predicted value, though this method does not punish
# inaccurate predictions as much.

# Define the distance labels, change as necessary
distance_labels <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Modify number of samples as needed, this number is multiplied by the number of distance_labels
num_samples <- 1000
all_predicted_values <- matrix(numeric(), nrow = num_samples, ncol = length(distance_labels))

# Generate normal distribution for each distance label with a mean of that label value (modify SD as needed)
for (i in 1:length(distance_labels)) {
  all_predicted_values[, i] <- all_predicted_values[, i] <- pmax(min(distance_labels), pmin(max(distance_labels), rnorm(num_samples, mean = distance_labels[i], sd = 1)))
}

# Flatten the matrix to a vector
all_predicted_values <- as.vector(all_predicted_values)

# Set the size of the array
total_num_samples <- num_samples * length(distance_labels)

# Generate the array
actual_values <- rep(distance_labels, each = num_samples)

# Initialize the cost and confusion matrices
cost_matrix <- matrix(0, nrow = length(distance_labels), ncol = length(distance_labels))
confusion_matrix <- matrix(0, nrow = length(distance_labels), ncol = length(distance_labels))

# Calculate cost matrix (NOTE: Currently set to distance squared for cost calculation)
for (row_label in 1:length(distance_labels)) {
  for (col_label in 1:length(distance_labels)) {
    cost_matrix[row_label, col_label] <- abs(distance_labels[row_label] - distance_labels[col_label]) ^ 2
  }
}

# Label rows and columns
rownames(confusion_matrix) <- paste("Actual", distance_labels)
colnames(confusion_matrix) <- paste("Predicted", distance_labels)

# Populate the confusion matrix
for (i in 1:total_num_samples) {
  actual_index <- findInterval(actual_values[i], distance_labels)
  predicted_index <- findInterval(all_predicted_values[i], distance_labels)
  confusion_matrix[actual_index, predicted_index] <- confusion_matrix[actual_index, predicted_index] + 1
}

product_matrix = cost_matrix * confusion_matrix

# Calculate the average cost
average_cost <- sqrt(sum(product_matrix) / total_num_samples)

# Print the average cost
cat("Average Cost:", average_cost, "\n")