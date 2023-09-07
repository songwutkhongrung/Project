library(titanic)
library(caret)

#Check NA values in Table
colSums(is.na(titanic_train))
#Clear Na values in Table
titanic_train <- na.omit(titanic_train)
colSums(is.na(titanic_train))
#Change value 
titanic_train$Survived_2 <- ifelse(titanic_train$Survived == 1 , "survived","notsurvived")

#funtion Confustion matrix
Confustion_matrix <- function(prediction,actual){
  Confution <- table(prediction,actual,dnn = c("Prediction","Acturl"))
  print(Confution)
  
  accu <- (Confution[1,1]+Confution[2,2])/sum(Confution)
  cat("\nAccuracy :", accu)
  
  Preci <- (Confution[1,1]/(Confution[1,1]+Confution[2,1]))
  cat("\nPrecision :",Preci)
  
  Rec <- (Confution[1,1]/(Confution[1,1]+Confution[1,2]))
  cat("\nRecall :", Rec)
  
  F1 <- 2*((Preci*Rec)/(Preci+Rec))
  cat("\nF1 score :", F1)
}
#Chance_of_survive
Chance_survive = 0.65


# 1.split data for train and test
split_data <- function( titanic_train , train_size = 0.8 ){
  set.seed(10)
  n <- nrow(titanic_train)
  id <- sample(1:n,size= n* train_size)
  train_data <- titanic_train[id,]
  test_data <- titanic_train[-id,]
  list(train = train_data , test = test_data)
}

prep_data = split_data(titanic_train)
train_data = prep_data[[1]]
test_data = prep_data[[2]]


# 2.train data in model Logistic Regression
model <- train(Survived~Sex+Age+Pclass+SibSp+Parch+Fare,
               dat=train_data,
               method = "glm")
summary(model)
train_data$prob_survive <- predict(model,newdata = train_data)
train_data$prob_survive <- ifelse(train_data$prob_survive >= Chance_survive,"survived","notsurvived")
show_con_train <- Confustion_matrix(train_data$prob_survive,train_data$Survived_2)




#3.score/ predict new data
test_data$prob_survive <- predict(model,newdata = test_data)
test_data$prob_survive <- ifelse(test_data$prob_survive >= Chance_survive,"survived","notsurvived")
show_con_test <- Confustion_matrix(test_data$prob_survive,test_data$Survived_2)



