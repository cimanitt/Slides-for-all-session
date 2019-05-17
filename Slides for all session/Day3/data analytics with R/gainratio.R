install.packages("RoughSets")
library("RoughSets", lib.loc="~/R/win-library/3.3")

install.packages("readxl")
library("readxl", lib.loc="~/R/win-library/3.3")

install.packages("FSelector")
library("FSelector", lib.loc="~/R/win-library/3.3")

decision.table <- read_excel("C:/Users/vijaya/Documents/New folder/Data.xlsx")
decision.table
View(decision.table)

dataset <- SF.asDecisionTable(dataset = decision.table, decision.attr = 19,indx.nominal = c(6,8,9,11,12,14,15,17))
dataset
View(dataset)

result<-gain.ratio(churn~.,dataset)
result
subset<-cutoff.k(result,5)
f<-as.simple.formula(subset,"churn")
f
