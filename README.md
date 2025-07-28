# Titanic Survival Prediction Project

## Overview
This project predicts passenger survival on the Titanic using machine learning. The implementation includes data cleaning, feature engineering, and logistic regression modeling.

## Dataset
The dataset contains information about 891 Titanic passengers, including:
- Survival status (target variable)
- Passenger class
- Age
- Sex
- Fare amount
- Number of siblings/spouses aboard
- Number of parents/children aboard
- Port of embarkation

## Implementation Steps

### 1. Data Exploration
- Loaded and examined the dataset
- Checked for missing values
- Visualized target distribution

### 2. Feature Engineering
- Created `FamilySize` from sibling and parent counts
- Binned `age` into meaningful categories
- Categorized `fare` into quartiles

### 3. Data Preprocessing
- Handled missing values
- Scaled numerical features
- Encoded categorical variables

### 4. Model Training
- Logistic regression classifier
- 70/30 train-test split
- Pipeline for preprocessing and modeling

### 5. Evaluation
- Accuracy: XX%
- Confusion matrix
- Classification report

## How to Run
1. Install requirements: 
    `pip install pandas matplotlib seaborn matplotlib scikit-learn`
2. Run all cells in the Jupyter notebook

## Results
The model achieved 78% accuracy with the following key insights:
- Most important positive survival factors: 
- Female
- Infants
- Most important negative survival factors:
- Male
- Family Size




