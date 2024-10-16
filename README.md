1. For the data folder:
	1. ***body_fat.csv*** contains the raw data.
	2. ***qted.csv*** contains the cleaned data with corrected values for BODYFAT, HEIGHT, and ADIPOSITY.
	3. ***world_2024.csv*** shows the body fat percentage by age in male and female from https://population-pyramid.net/.

2. For the code folder:
	1. ***analysis.Rmd*** contains data-cleaning and model building code written for the project.
	2. ***app.R*** contains Shiny base code. You can use the app from https://uw-madison-stat628-project2-mci.shinyapps.io/stat628_project2/. The package version shows below:
		1.  shiny >= "1.9.1"

3. For the image folder:
	1. ***Age Distribution of Sample.png*** is a histogram plot showing the distribution of age from the raw data(***body_fat.csv***).
	2. ***Age Distribution of World 2024.png*** is a histogram plot showing the distribution of age from ***world_2024.csv***.
	3. ***Bodyfat vs Density After Imputation.png*** is a scatter plot with a regression line, showing the linear relationship between BODYFAT and DENSITY from the cleaned data(***qted.csv***).
	4. ***Bodyfat vs Density Before Imputation.png*** is a scatter plot with a regression line, showing the linear relationship between BODYFAT and DENSITY from the raw data(***body_fat.csv***).
	5. ***Hypothesis Testing Results.png*** is a table showing the results of t-test and F-test from the final model.
	6. ***KNN Imputation.png*** is a scatter plot showing the difference between the actual BODYFAT from the raw data(***body_fat.csv***) and the predicted BODYFAT using KNN. 
	7. ***Residual QQ plot.png*** is a Q-Q plot showing how well the residuals align with a normal distribution from the final model, indicating whether the model's assumption of normality is reasonable.
	8. ***Residual plot.png*** is a residual plot showing the distribution of residuals from the final model, indicating whether the model's assumption of non-linearity and heteroscedasticity is reasonable.
	9. ***VIF for OLS Backward.png*** is a table showing the Variance Inflation Factors (VIF) for the backward selection model, which does not use weighted least squares.
	10. ***VIF for OLS Forward.png*** is a table showing the Variance Inflation Factors (VIF) for the forward selection model, which does not use weighted least squares. This model is the final model we are chosen.
	11. ***choose model.png*** is a table showing the results of all the models, including MSE(LOOCV), AIC, and BIC.

4. ***summary_group8.pdf*** contains the project summary.

5. ***stat628_group8_module2.pptx*** is the slide we used for the presentation.
