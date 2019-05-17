library(ggvis)
library(class)   # required for knn

#data Visualization
dim(iris)
iris %>% ggvis(~Sepal.Length, ~Sepal.Width, fill = ~Species) %>% layer_points()
iris %>% ggvis(~Petal.Length, ~Petal.Width, fill = ~Species) %>% layer_points()

str(iris) #displays fields and a sample of their data

table(iris$Species)#creates tabular results of categorical data.

summary(iris)#gives an idea of the ranges

#Preprocessing
# normalizing the values
normalize <- function(x) { 
  num <- x - min(x) 
  denom <- max(x) - min(x) 
  return (num/denom) 
}
iris_norm <- as.data.frame(lapply(iris[1:4], normalize))
summary(iris_norm)


#Data prepration

#Random splitting of iris data as 70% train and 30%test datasets
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

#removing factorvariable from training and test datasets
trainData1 <- trainData[-5]
testData1 <- testData[-5]

#checking the dimensions of train and test datasets
dim(trainData)
dim(trainData1)
dim(testData)
dim(testData1)


#storing target variable for testing and training data.
iris_train_labels <- trainData$Species 
dim(iris_train_labels)

class(iris_train_labels)

iris_test_labels <- testData$Species
dim(iris_test_labels)

#training a model on the data
knn_model <- knn(train = trainData1, test = testData1, cl= iris_train_labels,k = 3,prob=TRUE) 

library(gmodels)
CrossTable(x = iris_test_labels, y = iris_test_pred1,prop.chisq=FALSE) 


#92% accurate

