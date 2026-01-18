# Student performance analysis based on test preparation

## Description

The objective of this project was to perform an `Exploratory Data Analysis (EDA) using R` on a dataset containing students’ academic performance in mathematics, reading, and writing.

The analysis compares students who completed a test preparation course with those who did not, in order to identify differences in performance and relationships between variables.

This project was developed to prove to myself that I could take the concepts and notes from the Coursera course _Introduction to Data Science: Statistical Programming with R_ and apply them to a real-world project—one that I built independently. The goal was to reinforce my understanding of the language while navigating different references and resources to develop a functional and coherent analysis as my first hands-on approach to R.

## Dataset

- Source: Adeyemi, T. (2024). _Students Performance in Exams._ Kaggle. Retrieved January 16th, 2026 from [Students Performance in Exams](https://www.kaggle.com/datasets/timothyadeyemi/students-performance-in-exams)

- Observations: 1,000 students

- Main variables:

  - math.score

  - reading.score

  - writing.score

  - test.preparation.course

## Analysis Questions

1. Are there differences in math performance between students who completed the test preparation course and those who did not?

2. How are reading scores distributed?

3. Is test preparation associated with better academic results?

4. What is the relationship between reading and writing scores?

## Methodology

1. We load the dataset and perform an initial exploration to ensure that the data has been successfully imported into the R environment and to understand its structure and variables.
   
2. The data is divided into subsets based on a categorical variable, allowing for a clearer comparative analysis and the formulation of meaningful hypotheses.
   
3. Using built-in R functions, we calculate descriptive statistics such as the mean, median, and standard deviation for each data subset.
   
4. The numerical results are corroborated through graphical visualizations using base R graphics, including histograms, boxplots, and scatter plots.

## Key Findings

As stated before, the purpose of this project was to become familiar with R-specific functions and syntax. Therefore, the initial analytical questions were largely deduced by inspecting the variables and values within the dataset. Nevertheless, it was nice to confirm that these initial assumptions could be validated using mathematical tools and graphical visualizations that clearly illustrated the underlying patterns in the data.

Therefore, I can state the following:

 - Students who completed the test preparation course achieved higher average scores across all three subjects.

 - Reading and writing scores show a strong positive relationship for both groups.

 - Score variability is similar regardless of test preparation status.

## Tools Used

R

- Base R functions (apply, subset, factor)

- Base R graphics (hist, boxplot, plot)
