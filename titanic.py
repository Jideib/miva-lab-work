#!/usr/bin/env python
# coding: utf-8

# ## Team Members
# No.| Name | Student ID |
# |--|---|---|
# 1 | Oluwaseyifunmi Olowookere (Group Leader) | 30143472
# 2 | Yetunde Omotayo | 30074434
# 3 | Raymond Fidelix | 30072826
# 4 | Aishat Adekanye | 30153529
# 5 | Ibraheem Alawode | 30044828
# 6 | Kaothara Balogun | 30140021
# 7  |Toluwalope Medunoye | 30072778

# ### Data Exploration Oluwaseyifunmi and Aminat
# \- Open the Titanic passenger list (dataset) in Python.    
# \- Show the first few passengers (rows) so everyone knows what’s inside.    
# \- Check if any passenger info is missing (e.g., age, ticket price).    
# \- Draw pictures (visualizations) to show how things like age or ticket class relate to survival.

# In[2]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.model_selection import train_test_split  
from sklearn.linear_model import LogisticRegression  
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report


# In[3]:


titanic = sns.load_dataset("titanic") # Load the Titanic dataset from Seaborn


# In[4]:


print(titanic.head(10)) # Display the first ten rows


# In[5]:


# Basic information about the dataset
print("\nDataset Info:")
print(titanic.info())


# In[6]:


#Display the rows with missing values and amount of missing values
print(titanic.isnull().sum()) 


# In[7]:


plt.figure(figsize=(15, 10))
plt.subplot(2, 2, 1)
sns.barplot(x='pclass', y='survived', data=titanic)
plt.title('Survival Rate by Passenger Class')

plt.subplot(2, 2, 2)
sns.barplot(x='sex', y='survived', data=titanic)
plt.title('Survival Rate by Gender')

plt.subplot(2, 2, 3)
sns.histplot(data=titanic, x='age', hue='survived', bins=30, kde=True, multiple='stack')
plt.title('Age Distribution by Survival')

plt.subplot(2, 2, 4)
sns.histplot(data=titanic, x='fare', hue='survived', bins=30, kde=True, multiple='stack')
plt.title('Fare Distribution by Survival')

plt.tight_layout()
plt.show()


# ### Data Cleaning by Fidelix        
# \- Look for weird numbers (outliers) in ticket prices using boxplots and decide what to do.  

# In[8]:


# Outlier detection + removal (chained assignment)
fare_q3 = titanic['fare'].quantile(0.75)
fare_iqr = fare_q3 - titanic['fare'].quantile(0.25)
fare_cap = fare_q3 + 1.5 * fare_iqr  # Tukey's method


# In[9]:


fare = [index for index, row in titanic.iterrows() if row['fare'] <= fare_cap]

# Filter the DataFrame
titanic = titanic.loc[fare]


# In[10]:


sns.boxplot(x=titanic['fare']).set(title='Fare Distribution After Capping');


# ### Feature Engineering by Kaothara and Yetunde
# \- Create a Family Size feature by adding siblings (SibSp) and parents (Parch).    
# \- Group ages into buckets like "kids," "teens," "adults," and "seniors."    
# \- Group ticket prices into "cheap," "medium," and "expensive."  

# In[11]:


### How many of them in the family
titanic['FamilySize'] = titanic['sibsp'] + titanic['parch']
# Define age bins and corresponding labels
bins = [0, 2, 12, 17, 64, 80]  # Adjust maximum age as needed
labels = ['Infant', 'Kid', 'Teen', 'Adult', 'Old_Age']

# Create a new column with age categories
titanic['AgeGroup'] = pd.cut(titanic['age'], bins=bins, labels=labels, right=True)

# Define fare bins and labels
## The fare group is created based on the Fare Statistics Summary
bins = [0, 13, 26, 66]  # 0–13: Cheap, >13–26: Medium, >26–65+: Expensive
labels = ['Cheap', 'Medium', 'Expensive']

# Create a new column
titanic['FareGroup'] = pd.cut(titanic['fare'], bins=bins, labels=labels, right=False)


# ### Data Transformation by Toluwalope, Fidelix and Ibraheem
# \- Turn words (categories) like "male/female" or "embarkation port" into numbers (encoding).    
# \- Scale numbers like age, fare, and family size so they’re fair for the model.  
# \- Also fix any missing data

# In[12]:


# Preprocessing pipeline
# Numeric features
numeric_features = ['age', 'fare', 'FamilySize']
numeric_transformer = Pipeline(steps=[
    ('imputer', SimpleImputer(strategy='median')),
    ('scaler', StandardScaler())
])

# Categorical features
categorical_features = ['sex', 'embarked', 'AgeGroup', 'FareGroup']
categorical_transformer = Pipeline(steps=[
    ('imputer', SimpleImputer(strategy='most_frequent')),
    ('encoder', OneHotEncoder(handle_unknown='ignore'))
])

preprocessor = ColumnTransformer(
    transformers=[
        ('num', numeric_transformer, numeric_features),
        ('cat', categorical_transformer, categorical_features)
    ])


# In[13]:


# Prepare features and target
X = titanic[['pclass', 'sex', 'age', 'fare', 'embarked', 'FamilySize', 'AgeGroup', 'FareGroup']]
y = titanic['survived']

# Split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)


# ### Model training by All the team members
# \- Split passengers into a training group (70%) and a test group (30%).    
# \- Teach the computer (train a model) to guess survival using Logistic Regression.    
# \- Check if the computer is good at guessing (accuracy, confusion matrix).  

# In[14]:


# Model training
model = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('classifier', LogisticRegression(max_iter=1000))
])

model.fit(X_train, y_train)
print("Model trained successfully!")


# In[15]:


# Model Evaluation
y_pred = model.predict(X_test)

print(f"Accuracy: {accuracy_score(y_test, y_pred):.2f}")
print("\nConfusion Matrix:")
print(confusion_matrix(y_test, y_pred))
print("\nClassification Report:")
print(classification_report(y_test, y_pred))


# In[16]:


#  Make predictions 
new_data = pd.DataFrame({
    'pclass': [1, 3],
    'sex': ['female', 'male'],
    'age': [30, 25],
    'fare': [100, 20],
    'embarked': ['C', 'S'],
    'FamilySize': [1, 0],
    'AgeGroup': ['Adult', 'Adult'],
    'FareGroup': ['High', 'Low']
})

predictions = model.predict(new_data)
print("Predictions:", predictions)


# ### Feature Importance Analysis by Ibraheem
# - Most important positive survival factors 
# - Most important negative survival factors

# In[17]:


# Get feature names
ohe = model.named_steps['preprocessor'].named_transformers_['cat'].named_steps['encoder']
cat_features = ohe.get_feature_names_out(categorical_features)
all_features = numeric_features + list(cat_features)

# Get coefficients
coefficients = model.named_steps['classifier'].coef_[0]
feature_importance = pd.DataFrame({'Feature': all_features, 'Coefficient': coefficients})

# Sort by absolute value for importance
feature_importance['Abs_Coefficient'] = feature_importance['Coefficient'].abs()
feature_importance = feature_importance.sort_values('Abs_Coefficient', ascending=False)

# Display top drivers
print("\nTop Positive Factors (Increased Survival):")
print(feature_importance[feature_importance['Coefficient'] > 0].head())

print("\nTop Negative Factors (Decreased Survival):")
print(feature_importance[feature_importance['Coefficient'] < 0].head())


# In[18]:


# Visualising feature contributing to the survival
plt.figure(figsize=(10, 6))
sns.barplot(
    x='Coefficient', 
    y='Feature', 
    data=feature_importance,
    hue=np.where(feature_importance['Coefficient'] < 0, 'Negative', 'Positive'),
    palette={'Negative': 'red', 'Positive': 'green'},
    dodge=False 
)
plt.title('Logistic Regression Coefficients')
plt.xlabel('Coefficient Value')
plt.axvline(x=0, color='black', linestyle='--')
plt.show()


# ### Result
# The model achieved 78% accuracy with the following key insights:
# - Most important positive survival factors: 
# - Female
# - Infants
# - Most important negative survival factors:
# - Male
# - Family Size

# 
# 
