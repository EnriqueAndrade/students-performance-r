# Student performance analysis based on test preparation

## An `Exploratory Data Analysis (EDA) using R` on a dataset containing students’ academic performance in mathematics, reading, and writing.

The analysis compares students who completed a test preparation course with those who did not, in order to identify differences in performance and relationships between variables.

This project was developed to prove to myself that I could take the concepts and notes from the Coursera course _Introduction to Data Science: Statistical Programming with R_ and apply them to a real-world project—one that I built independently. The goal was to reinforce my understanding of the language while navigating different references and resources to develop a functional and coherent analysis as my first hands-on approach to R.
Additionally, this project represents my first exposure to both Kaggle and GitHub, allowing me to become familiar with modern tools that are widely used in the industry and that serve as a valuable complement to my university studies.

## Dataset

- Source: Adeyemi, T. (2024). _Students Performance in Exams._ Kaggle. Retrieved January 16th, 2026 from [Students Performance in Exams](https://www.kaggle.com/datasets/timothyadeyemi/students-performance-in-exams)

- Observations: 1,000 students

- Main variables:
  
  - math.score ("integer")

  - reading.score ("integer")

  - writing.score ("integer")

  - test.preparation.course ("character")

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

### 1. Differences in the math performance

A boxplot was used to compare math scores between students who completed the test preparation course and those who did not.

![Math score comparison](math.score_boxplots.png)

The 358 students who completed the test preparation course show a higher average and more compact results, with the lowest score being close to 20.
In contrast, the 642 students who did not complete the course present a wider dispersion of scores, including lower outliers than those observed in the group that completed the preparation course.

### 2. Distribution of reading scores

I generated histograms to visualize the distribution of the reading scores.

![Reading scores of those who took the test course](reading_distribution_cumplidos.png)
![Reading scores of those who didn't take the test course](reading_distribution_incumplidos.png)

Separating students into two groups—those who completed the test preparation course and those who did not—proved to be a meaningful decision.
Using measures of central tendency such as the mean, median, and standard deviation, we can confirm that **this categorical variable does show an association with better academic performance** for students who completed the course.

### 3. Test preparation and academic results

Separating students into two groups—those who completed the test preparation course and those who did not—proved to be a meaningful decision.
Using measures of central tendency such as the mean, median, and standard deviation, we can confirm that **this categorical variable does show an association with better academic performance** for students who completed the course.

### 4. Relationship between reading and writing scores

Scatter plots were used to explore the relationship between reading and writing scores.

![Reading vs Writing - Completed](read_write_relation_cumplidos.png)
![Reading vs Writing - Not completed](read_write_relation_incumplidos.png)

Both groups exhibit a positive relationship between reading and writing scores. However, the presence of several outliers prevents this relationship from being interpreted as a strict rule.
While higher reading scores often coincide with higher writing scores, the dispersion of the data suggests that this association should be interpreted with caution.

## Tools Used

R & RStudio

- Base R functions (apply, subset, factor)

- Base R graphics (hist, boxplot, plot)

## How to Test This Program on Your Own Computer

To run this project on your local machine, make sure you have installed the tools and datasets described in the previous sections.

You may also test the program using your own dataset. In that case, the dataset must contain the required columns used throughout the analysis and those columns must have compatible data types. Otherwise, the program will stop execution to prevent incorrect results.
