library(caret)
library(tidyverse)
library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)

path_House_price_india <- "E:/Program R/Prediction house price in india/House Price India.xlsx"

df_sheet1 <- read_excel(path_House_price_india,sheet = 1)
df_sheet2 <- read_excel(path_House_price_india,sheet = 2)
full_df <- rbind(df_sheet1,df_sheet2)

full_df <- full_df %>%
  mutate(Date = as.Date(Date, format = "%Y-%m-%d"))


#Exploratory Data Analysis House Price India
#Bar plot mount most sell house
month_report <- full_df %>% 
  ggplot(mapping = aes(x=month(Date)))+
  geom_bar(fill="#0E8388")+
  theme_minimal()+
  scale_x_continuous(breaks = 1:12, labels = month.abb)
month_report

#india house price
price_report <- full_df %>%
  ggplot(mapping = aes(x = Price)) +
  geom_density(color="#845EC2") +
  theme_minimal()
price_report

#year built
year_built_sell <- full_df %>%
  select(Date, `Built Year`, Price) %>%
  mutate(diff_Year = year(Date) - `Built Year`) %>%
  group_by(diff_Year) %>%
  summarise(Mean = mean(Price), No = n()) %>%
  arrange(desc(Mean))
year_built_sell


#Check NA data
colSums(is.na(full_df))

#Check normal distribution
price_Box <- full_df %>%
  ggplot(mapping = aes(x=Price)) +
  geom_boxplot(color="#00C9A7",fill="#C4FCEF")+
  theme_minimal()
price_Box

full_df$log_price <- log(full_df$Price)
qqnorm(full_df$log_price)


#def function for read data
split_data <- function(df,size_data){
  set.seed(10)
  n <- nrow(df)
  id <- sample(1:n,size = round(n * size_data))
  train_data <- df[id,]
  test_data <- df[-id,]
  list(train = train_data, test = test_data)
}

# 1. split data to train and test
perp_data <- split_data(full_df,size_data = 0.8)
train <- perp_data[[1]]
test <- perp_data[[2]]

#2. Create model linear Regression and summary model

PredictionModel <- train(
  log_price ~ . - Price - id,
  data = train,
  method = "lm"
)
summary(PredictionModel)
t <- predict(PredictionModel,newdata = train)
t_test_predict <- exp(t)
train_MAE <- mean(abs( t_test_predict - train$Price ))
train_MSE <- mean((t_test_predict - train$Price)**2)
train_RMSE <- sqrt (mean((t_test_predict - train$Price )**2))

#3 score model

p <- predict(PredictionModel,newdata = test)
P_test <- exp(p)

# 4 evaluate model
#Mean absolute error
test_MAE <- mean(abs( P_test - test$Price ))
#Mean Squared Error
test_MSE <- mean((P_test - test$Price)**2)
#Root mean square error
test_RMSE <- sqrt (mean((P_test - test$Price )**2))

cat("Train Mean absolute error :", train_MAE, "\n",
    "Test Mean absolute error :", test_MAE, "\n",
    "Train Mean Squared Error :", train_MSE, "\n",
    "Test Mean Squared Error :", test_MSE, "\n",
    "Train Root mean square error :", train_RMSE, "\n",
    "Test Root mean square error :", test_RMSE,"\n",
    "Diff Mean absolute error :",train_MAE-test_MAE,"\n",
    "Diff Mean Squared Error :",train_MSE-test_MSE,"\n",
    "Diff Root mean square error :",train_RMSE-test_RMSE)
#a lot of independent variable
PredictionModel$finalModel
#we choose independent variable top 5 variable
important_model <- varImp(PredictionModel)





