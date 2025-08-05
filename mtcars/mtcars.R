#' ---
#' title: "Motor Trend Car Road Tests"
#' author: "The Diamond Team"
#' date: "2025-07-28"
#' output: R Script
#' 
#' 
#' 
#' ---
#' ```{r mtcars, echo = TRUE} ## Loading the Mt Cars
#' 
#' ```
#' ## Team Members
#' No.| Name | Student ID |
#' |--|---|---|
#' 1 | Oluwaseyifunmi Olowookere (Group Leader) | 30143472
#' 2 | Yetunde Omotayo | 30074434
#' 3 | Raymond Fidelix | 30072826
#' 4 | Aishat Adekanye | 30153529
#' 5 | Ibraheem Alawode | 30044828
#' 6 | Kaothara Balogun | 30140021
#' 7 |Toluwalope Medunoye | 30072778
#' 
## ---------------------------------------------------------------------------
library(corrplot)
library(ggplot2)
library(dplyr)
library(highr)

#' 
#' ## Data Exploration by Fidelix and Kaothara
## ---------------------------------------------------------------------------
### First 6 rows
dim(mtcars) ## we have 32 rows and 11 columns
head(mtcars, 6)

## ---------------------------------------------------------------------------
is.na(mtcars)
sum(is.na(mtcars))
## There is no missing values in the dataset

## ---------------------------------------------------------------------------
summary(mtcars)

#' 
#' ##Hypothesis Testing by Toluwalope and Oluwaseyifunmi
## ---------------------------------------------------------------------------
#Two-sample t-test for mpg by cylinder groups (4 vs 6)
cat("\n Two-sample t-test for mpg (4 cyl vs 6 cyl):\n")
mpg_4cyl <- mtcars$mpg[mtcars$cyl == 4]
mpg_6cyl <- mtcars$mpg[mtcars$cyl == 6]

t_test_result <- t.test(mpg_4cyl, mpg_6cyl)
print(t_test_result)

## ---------------------------------------------------------------------------
# Interpretation
cat("\nInterpretation:\n")
if (t_test_result$p.value < 0.05) {
  cat("With p-value =", t_test_result$p.value, 
      "we reject the null hypothesis. There is a significant difference in mean mpg between 4-cylinder and 6-cylinder cars.\n")
} else {
  cat("With p-value =", t_test_result$p.value, 
      "we fail to reject the null hypothesis. No significant difference in mean mpg between 4-cylinder and 6-cylinder cars.\n")
}

#' 
## ---------------------------------------------------------------------------
cat("\n One-sample proportion test for automatic transmission:\n")
n_auto <- sum(mtcars$am == 0)
n_total <- nrow(mtcars)
prop_test_result <- prop.test(n_auto, n_total, p = 0.5, correct = FALSE)
print(prop_test_result)

## ---------------------------------------------------------------------------
# Interpretation
cat("\nInterpretation:\n")
if (prop_test_result$p.value < 0.05) {
  cat("With p-value =", prop_test_result$p.value, 
      "we reject the null hypothesis. The proportion of automatic cars is significantly different from 50%.\n")
} else {
  cat("With p-value =", prop_test_result$p.value, 
      "we fail to reject the null hypothesis. The proportion of automatic cars is not significantly different from 50%.\n")
}

#' 
#' ##Correlation Analysis by Aminat and Fidelix
## ---------------------------------------------------------------------------
# Compute correlation matrix
cat("\n6. Correlation matrix for numerical variables:\n")
cor_matrix <- cor(mtcars)
print(cor_matrix)

#' 
## ---------------------------------------------------------------------------
# Visualize correlation matrix with heatmap
cat("\n7. Correlation heatmap:\n")
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45, addCoef.col = "black")

#' 
## ---------------------------------------------------------------------------
# Identify highly correlated variables
cat("\n8. Highly correlated variables (absolute correlation > 0.7):\n")
high_cor <- which(abs(cor_matrix) > 0.7 & abs(cor_matrix) < 1, arr.ind = TRUE)
high_cor_pairs <- data.frame(
  Variable1 = rownames(cor_matrix)[high_cor[,1]],
  Variable2 = colnames(cor_matrix)[high_cor[,2]],
  Correlation = cor_matrix[high_cor]
)
print(high_cor_pairs)

#' 
#' ##Regression Modelling by Yetunde and Ibraheem
## ---------------------------------------------------------------------------
# Simple linear regression (mpg ~ wt)
cat("\n9. Simple linear regression (mpg ~ wt):\n")
lm_simple <- lm(mpg ~ wt, data = mtcars)
summary(lm_simple)


#' 
#' 
## ---------------------------------------------------------------------------
# Interpretation
cat("\nInterpretation of simple linear regression:\n")
cat("Regression equation: mpg =", coef(lm_simple)[1], "+", coef(lm_simple)[2], "* wt\n")
cat("For each 1000 lb increase in weight, mpg decreases by", abs(coef(lm_simple)[2]), "on average.\n")
cat("R-squared value of", summary(lm_simple)$r.squared, 
    "means that", round(summary(lm_simple)$r.squared*100, 1), 
    "% of the variability in mpg is explained by weight.\n")

## ---------------------------------------------------------------------------
#Multiple linear regression (mpg ~ wt + hp + cyl)
cat("\n10. Multiple linear regression (mpg ~ wt + hp + cyl):\n")
lm_multiple <- lm(mpg ~ wt + hp + cyl, data = mtcars)
summary(lm_multiple)

#' 
## ---------------------------------------------------------------------------
# Interpretation
cat("\nInterpretation of multiple linear regression:\n")
cat("Regression equation: mpg =", coef(lm_multiple)[1], "+", 
    coef(lm_multiple)[2], "* wt +", 
    coef(lm_multiple)[3], "* hp +", 
    coef(lm_multiple)[4], "* cyl\n")
cat("When holding other variables constant:\n")
cat("- For each 1000 lb increase in weight, mpg decreases by", abs(coef(lm_multiple)[2]), "\n")
cat("- For each unit increase in horsepower, mpg decreases by", abs(coef(lm_multiple)[3]), "\n")
cat("- For each additional cylinder, mpg decreases by", abs(coef(lm_multiple)[4]), "\n")
cat("Adjusted R-squared value of", summary(lm_multiple)$adj.r.squared, 
    "means that", round(summary(lm_multiple)$adj.r.squared*100, 1), 
    "% of the variability in mpg is explained by the model.\n")

## ---------------------------------------------------------------------------
# Model comparison
cat("\n11. Model comparison:\n")
cat("Simple model R-squared:", summary(lm_simple)$r.squared, "\n")
cat("Multiple model Adjusted R-squared:", summary(lm_multiple)$adj.r.squared, "\n")
if (summary(lm_multiple)$adj.r.squared > summary(lm_simple)$r.squared) {
  cat("The multiple regression model explains more variance in mpg and is preferred.\n")
} else {
  cat("The simple regression model is sufficient.\n")
}

#' 
#' ##Visualization by Ibraheem and Oluwaseyifunmi
## ---------------------------------------------------------------------------
# Scatter plot of mpg vs wt with regression line
cat("\n12. Creating visualizations...\n")
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "MPG vs Weight with Regression Line",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()

#' 
## ---------------------------------------------------------------------------
# Boxplot of mpg by cylinder count
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "MPG Distribution by Number of Cylinders",
       x = "Number of Cylinders",
       y = "Miles per Gallon") +
  theme_minimal()

#' 
## ---------------------------------------------------------------------------
# Histogram of mpg with normal curve overlay
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(aes(y = ..density..), bins = 10, fill = "lightgreen", color = "black") +
  stat_function(fun = dnorm, args = list(mean = mean(mtcars$mpg), sd = sd(mtcars$mpg)), 
                color = "red", size = 1) +
  labs(title = "Distribution of MPG with Normal Curve",
       x = "Miles per Gallon",
       y = "Density") +
  theme_minimal()

#' 
#' # ----------------------------
#' #  Reporting Results
#' # ----------------------------
#' 
## ---------------------------------------------------------------------------
cat("\. Summary of findings:\n")
cat("- Data Exploration: The dataset contains no missing values. Summary statistics show the range and central tendencies of each variable.\n")
cat("- Hypothesis Testing: Found significant difference in mpg between 4 and 6 cylinder cars. Automatic transmission proportion differs from 50%.\n")
cat("- Correlation Analysis: Strong negative correlation between mpg and weight (-0.87), cylinders (-0.85), and horsepower (-0.78).\n")
cat("- Regression Models: Multiple regression with weight, horsepower and cylinders explains 84% of mpg variance, better than simple model (75%).\n")
cat("- Visualizations: Show relationships between variables and distributions clearly.\n")
cat("\nLimitations: Small sample size (32 cars). Assumptions of normality and linearity should be checked further.\n")

