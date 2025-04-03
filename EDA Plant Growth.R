# Load necessary libraries
library(dplyr)
library(ggplot2)
library(reshape2)

# Load the PlantGrowth dataset
data("PlantGrowth")

# Data Transformation: Create new variables
plantgrowth_data <- PlantGrowth %>%
  mutate(
    weight_kg = weight / 1000,  # Convert weight to kilograms
    weight_squared = weight^2   # Square of the weight
  )

# Grouping & Summarization: Analyze key patterns
summary_data <- plantgrowth_data %>%
  group_by(group) %>%
  summarise(
    Total_Weight = sum(weight),
    Average_Weight = mean(weight)
  )

# Visualizations
# 1. Histogram
ggplot(plantgrowth_data, aes(x = weight)) +
  geom_histogram(binwidth = 0.1, fill = "blue", color = "black") +
  labs(title = "Histogram of Plant Weights", x = "Weight", y = "Frequency")

# 2. Box plot
ggplot(plantgrowth_data, aes(x = group, y = weight)) +
  geom_boxplot(fill = "orange", color = "black") +
  labs(title = "Box Plot of Plant Weights by Group", x = "Group", y = "Weight")

# 3. Scatter plot
ggplot(plantgrowth_data, aes(x = group, y = weight)) +
  geom_point(color = "red") +
  labs(title = "Scatter Plot of Plant Weights by Group", x = "Group", y = "Weight")

# 4. Bar chart
ggplot(summary_data, aes(x = group, y = Total_Weight)) +
  geom_bar(stat = "identity", fill = "green", color = "black") +
  labs(title = "Bar Chart of Total Plant Weights by Group", x = "Group", y = "Total Weight")

# 5. Density plot
ggplot(plantgrowth_data, aes(x = weight, fill = group)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Plant Weights by Group", x = "Weight", y = "Density")

# 6. Line plot
ggplot(plantgrowth_data, aes(x = as.numeric(row.names(plantgrowth_data)), y = weight, color = group)) +
  geom_line() +
  labs(title = "Line Plot of Plant Weights", x = "Index", y = "Weight")

# 7. Correlation heatmap
cor_matrix <- cor(plantgrowth_data %>% select(weight, weight_kg, weight_squared))
melted_cor_matrix <- melt(cor_matrix)
ggplot(melted_cor_matrix, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  labs(title = "Correlation Heatmap", x = "", y = "")

# 8. Customized visualization: Weight vs. Weight Squared
ggplot(plantgrowth_data, aes(x = weight, y = weight_squared)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", color = "black") +
  labs(title = "Weight vs. Weight Squared", x = "Weight", y = "Weight Squared")
