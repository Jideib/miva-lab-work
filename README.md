# miva-lab-work
  ## Team Members
  Oluwaseyifunmi, Fidelix, Kaothara, Aminat, Ibraheem

  ### What needs to be done
1\. Data Explorer (Task: Data Exploration)  
What to be done  
\- Open the Titanic passenger list (dataset) in Python.    
\- Show the first few passengers (rows) so everyone knows what’s inside.    
\- Check if any passenger info is missing (e.g., age, ticket price).    
\- Draw pictures (visualizations) to show how things like age or ticket class relate to survival.  

Tools:  
\- **Python code: \`sns.load\_dataset('titanic')\`, \`head()\`, \`isnull()\`, \`sns.countplot()\`**

2\. Data Cleaner (Task: Data Cleaning)  
What to be done    
\- Fix missing passenger ages by guessing (imputing) the average age.    
\- Fill in missing embarkation ports (e.g., use the most common port).    
\- Look for weird numbers (outliers) in ticket prices using boxplots and decide what to do.  

Tools:  
**\- Python code: \`fillna()\`, \`sns.boxplot()\`, \`dropna()\`**  

3\. Feature Inventor (Task: Feature Engineering)    
What needs to be done  
\- Create a Family Size feature by adding siblings (SibSp) and parents (Parch).    
\- Group ages into buckets like "kids," "teens," "adults," and "seniors."    
\- Group ticket prices into "cheap," "medium," and "expensive."  

\*\*Tools:  
**\- Python code: \`df\['FamilySize'\] \= df\['SibSp'\] \+ df\['Parch'\]\`, \`pd.cut()\`**

4\. Data Magician (Task: Data Transformation)    
What needs to be done  
\- Turn words (categories) like "male/female" or "embarkation port" into numbers (encoding).    
\- Scale numbers like age, fare, and family size so they’re fair for the model.  

Tools:  
\- **Python code: \`pd.get\_dummies()\`, \`StandardScaler()\`, \`MinMaxScaler()\`**  

5\. Model Trainer (Task: Model Preparation)    
What needs to be done  
\- Split passengers into a training group (70%) and a test group (30%).    
\- Teach the computer (train a model) to guess survival using Logistic Regression.    
\- Check if the computer is good at guessing (accuracy, confusion matrix).  

Tools:    
**\- Python code: \`train\_test\_split()\`, \`LogisticRegression()\`, \`classification\_report()\`**  

6\. Storyteller (Task: Report Writing)    
What needs to be done  
\- Write a summary of what the team did (like a detective’s notebook).    
\- Explain the steps in simple words (no confusing math\!).    
\- Show pictures of the work (graphs, tables) and say how good the model is.  

Tools:    
\- Words, graphs, and a clear conclusion\!  

How to Work Together:

1. We need to work together simultaneously via Github, so everyone drops your Github account username and Ibraheem Alawode will create a repo.  
2. If needs be, we might just have to do a crash class on Github collaboration  
3. We need to pick this task and do the coding  
4. We are writing with Latex and we will all be editing it together.  
5. Kindly pick any of the tasks below and Two people can pick one task.

1\. Data Explorer starts (Task 1).    
2\. Data Cleaner fixes missing/weird data (Task 2).    
3\. Feature Inventor and Data Magician work together (Tasks 3 & 4).    
4\. Model Trainer builds and tests the model (Task 5).    
5\. Storyteller writes the final report (Task 6).

