# Body Fat Percentage Analysis

This repository contains the data, code, and analysis for the project on body fat percentage prediction and analysis. Below is a summary of the repository structure and the contents of each folder.

## Repository Structure

### 1. Data Folder
This folder contains the raw and cleaned datasets used in the analysis:
- **body_fat.csv**: Contains the raw body fat data.
- **qted.csv**: Contains the cleaned data with corrected values for BODYFAT, HEIGHT, and ADIPOSITY.
- **world_2024.csv**: Contains body fat percentage data by age and gender, sourced from [Verywell Health](https://www.verywellhealth.com/body-fat-percentage-chart-8550202).

### 2. Code Folder
This folder contains the code for data cleaning, analysis, and building the Shiny app:
- **analysis.Rmd**: R Markdown file with data cleaning and model building code.
- **app.R**: The base code for the Shiny app used in the project.

### 3. Image Folder
This folder contains plots, tables, and figures generated from the analysis:
1. **Age Distribution of Sample.png**: Histogram showing the age distribution from the raw data (`body_fat.csv`).
2. **Age Distribution of World 2024.png**: Histogram showing the age distribution from `world_2024.csv`.
3. **Bodyfat vs Density After Imputation.png**: Scatter plot with regression line showing the relationship between BODYFAT and DENSITY after imputation from the cleaned data (`qted.csv`).
4. **Bodyfat vs Density Before Imputation.png**: Scatter plot with regression line showing the relationship between BODYFAT and DENSITY before imputation from the raw data (`body_fat.csv`).
5. **Hypothesis Testing Results.png**: Table showing t-test and F-test results from the final model.
6. **KNN Imputation.png**: Scatter plot showing the difference between actual and predicted BODYFAT values using KNN, compared with the raw data (`body_fat.csv`).
7. **Residual QQ plot.png**: Q-Q plot showing how well the residuals from the final model align with a normal distribution, testing the assumption of normality.
8. **Residual plot.png**: Residual plot showing the distribution of residuals from the final model, assessing non-linearity and heteroscedasticity.
9. **VIF for OLS Backward.png**: Table showing Variance Inflation Factors (VIF) for the backward selection model (not using weighted least squares).
10. **VIF for OLS Forward.png**: Table showing Variance Inflation Factors (VIF) for the forward selection model (final model, not using weighted least squares).
11. **choose model.png**: Table showing the comparison of all models based on MSE (LOOCV), AIC, and BIC scores.

### 4. Summary File
- **summary_group8.pdf**: A two-page summary of the project, including an overview of the analysis and key findings.

### 5. Presentation
- **stat628_group8_module2.pptx**: The final presentation slides used during the project presentation.

## How to Use the Code

### Prerequisites
Make sure you have R and the necessary packages installed (e.g., `ggplot2`, `shiny`, `dplyr`). You can install missing packages with the following command:

```r
install.packages(c("ggplot2", "shiny", "dplyr"))
```
## Running the Analysis
1. Open and run **analysis.Rmd** to perform the data cleaning, model building, and analysis.
2. Use **app.R** to run the Shiny app that interacts with the data and allows users to explore the results visually.

```r
# Running the Shiny app
shiny::runApp("app.R")
```
## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact
For any questions or inquiries about this project, feel free to contact:
- **Your Name**: your-email@example.com

## Acknowledgements
We would like to thank all contributors and open-source libraries used in this project.

## Contributing
Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request. Please review the contribution guidelines in the `CONTRIBUTING.md` file.
