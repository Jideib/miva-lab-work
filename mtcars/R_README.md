\#\#\# \*\*1. Data Explorer (Task: Data Exploration and Preprocessing)\*\*    
\*\*Job:\*\*    
\- Open the toy car book (mtcars dataset) in R.    
\- Show the first 6 toy cars (rows) so we know what’s inside.    
\- Check if any toy cars are missing pieces (missing values). If yes, say how to fix it.    
\- Tell everyone the average (mean), middle (median), and smallest/biggest (range) numbers for all toy car details.  

\*\*Tools:\*\*    
\- R code: \`head(mtcars)\`, \`summary(mtcars)\`, \`is.na(mtcars)\`  

\---

\#\#\# \*\*2. Hypothesis Detective (Task: Hypothesis Testing)\*\*    
\*\*Job:\*\*    
\- \*\*T-Test:\*\* Compare if 4-cylinder and 6-cylinder toy cars have the same gas (mpg).    
  \- Say: "Is there a difference? Yes or no?" (p-value tells you\!)    
\- \*\*Proportion Test:\*\* Check if half the toy cars are automatic (am \= 0).    
  \- Say: "Is it 50%? Or different?" (p-value tells you\!)  

\*\*Tools:\*\*    
\- R code: \`t.test()\`, \`prop.test()\`  

\---

\#\#\# \*\*3. Correlation Artist (Task: Correlation Analysis)\*\*    
\*\*Job:\*\*    
\- Draw a big table (matrix) showing how toy car numbers are friends (correlated).    
\- Make a colorful heatmap to show who’s best friends (high correlation) or enemies (negative correlation).    
\- Tell everyone which numbers love/hate each other (e.g., "When weight goes up, gas goes down\!").  

\*\*Tools:\*\*    
\- R code: \`cor(mtcars)\`, \`heatmap()\`, \`corrplot()\`  

\---

\#\#\# \*\*4. Regression Builder (Task: Regression Modeling)\*\*    
\*\*Job:\*\*    
\- \*\*Simple Model:\*\* Use weight (wt) to guess gas (mpg).    
  \- Write the math rule (equation) and explain what it means.    
\- \*\*Fancy Model:\*\* Use weight, horsepower (hp), and cylinders (cyl) to guess gas.    
  \- Say which numbers help the most (significant predictors).    
  \- Compare which model is better (R-squared).  

\*\*Tools:\*\*    
\- R code: \`lm(mpg \~ wt, data=mtcars)\`, \`lm(mpg \~ wt \+ hp \+ cyl, data=mtcars)\`  

\---

\#\#\# \*\*5. Picture Drawer (Task: Visualization)\*\*    
\*\*Job:\*\*    
\- Draw a dot plot (scatter plot) of gas (mpg) vs. weight (wt) with a prediction line.    
\- Make a box picture (boxplot) showing gas for 4, 6, 8-cylinder cars.    
\- Draw a bar chart (histogram) of gas with a smooth curve.  

\*\*Tools:\*\*    
\- R code: \`plot()\`, \`boxplot()\`, \`hist()\`  

\---

\#\#\# \*\*6. Storyteller (Task: Reporting Results)\*\*    
\*\*Job:\*\*    
\- Write a summary of everything the team did (like a storybook).    
\- Explain the results in simple words (no math jargon\!).    
\- Say what could be wrong (limitations) or what you assumed.  

\*\*Tools:\*\*    
\- Words, pictures, and a happy ending\!  

\---

\#\#\# \*\*How to Work Together:\*\*    
We need to work together simultaneously via Github, so everyone drops your Github account username and Ibraheem Alawode will create a repo.

1. If needs be, we might just have to do a crash class on Github collaboration  
2. We need to pick this task and do the coding  
3. We are writing with Latex and we will all be editing it together.  
4. Kindly pick any of the tasks below and Two people can pick one task.

1\. \*\*Data Explorer\*\* starts first (Task 1).    
2\. \*\*Hypothesis Detective\*\* and \*\*Correlation Artist\*\* work next (Tasks 2 & 3).    
3\. \*\*Regression Builder\*\* uses their work (Task 4).    
4\. \*\*Picture Drawer\*\* makes everything pretty (Task 5).    
5\. \*\*Storyteller\*\* writes the final report (Task 6).    
