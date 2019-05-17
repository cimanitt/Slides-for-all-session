library("e1071")
set.seed(1234)

#visualization of data
library('ggplot2')
data(iris)
head(iris)
dim(iris)


#visualization of data
ggplot(iris, aes(x = Petal.Length, y = Sepal.Length, colour = Species)) + 
  geom_point() +
  ggtitle('Iris Species by Petal and Sepal Length')


#data prepration
ind<-sample(2,nrow(iris),replace=TRUE, prob=c(0.67,0.33))
iris.training<-iris[ind==1,1:4]
print(iris.trianing)
iris.test<-iris[ind==2,1:4]
iris.trainLabels<-iris[ind==1,5]
iris.testLabels<-iris[ind==2,5]


# training model 
N=naiveBayes(iris.training,iris.trainLabels)
N


# Prediction using model
predict(N,iris.test)
xtab=table(predict(N,iris.test),iris.testLabels)


library("caret")
confusionMatrix(xtab)
