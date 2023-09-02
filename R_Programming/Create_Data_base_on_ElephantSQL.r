library(RPostgreSQL)
library(tidyverse)
con <- dbConnect(PostgreSQL(),
                host="arjuna.db.elephantsql.com",
                port=5432,
                user= "qusquxji",
                password="mSRrvIY4X66e-un8CGRCh5_rXiJTcOGY",
                dbname="qusquxji"
)
list_menu <-  data.frame(id=c(123783421,123783422,123783423,123783424,123783426,
                             123783427,123783428,123783431,123783432,123783433,
                             123783426,123783427,123783428,123783431,123783423,
                             123783424,123783426,123783427,123783431,123783432,
                             123783433,123783435,123783421,123783422,123783423),
                         menu=c("Pad Thai","Green Curry","Tom Yum Soup","Massaman Curry",
                                "Pad Kra Pao","Satay","Green Papaya Salad","Pad Thai",
                                "Green Curry","Tom Yum Soup","Massaman Curry","Pad Kra Pao",
                                "Satay","Green Papaya Salad","Spicy minced pork",
                                "Spicy minced chicken salad","Fried rice with shrimp",
                                "Porridge with fish","Fried chicken",
                                "Chicken and galangal in coconut milk soup",
                                "Green Papaya Salad","Red Curry","Spicy minced beef",
                                "Spicy minced pork","Spicy minced chicken salad"))
Selling <- data.frame(transaction_id=c(123783421,123783422,123783423,123783424,
                                       123783426,123783427,123783428,123783431,
                                       123783432,123783433,123783435),
                      date_of_tran=c( 2022-12-08,2022-12-08,2022-12-08,
                                      2022-12-09,2022-12-09,2022-12-10,
                                      2022-12-10,2022-12-11,2022-12-12,
                                      2022-12-12,2022-12-12),
                      amount=c(200,400,600,400,800,200,400,600,400,600,800),
                      Customer_ID=c(10003141,10003142,10003143,10003144,
                                    10003141,10003142,10003143,10003145,
                                    10003141,10003141,10003143))
customer <- data.frame(Customer_ID = c(10003141, 10003142, 10003143, 10003144, 10003145),
                      Point_of_Customer = c(500, 600, 700, 800, 900),
                      First_name = c("John", "Supper", "Thee", "Nat", "Boom"),
                      Last_name = c("olsen", "Buss", "luvfamily", "Yeol", "Burapa"),
                      Age = c(25, 28, 23, 22, 30))
menu <- data.frame(Menu = c('Pad Thai', 'Green Curry', 'Tom Yum Soup', 'Massaman Curry', 
                               'Pad Kra Pao', 'Satay', 'Green Papaya Salad', 'Red Curry', 
                               'Spicy minced beef', 'Spicy minced pork', 'Spicy minced chicken salad', 
                               'Fried rice with shrimp', 'Porridge with fish', 'Fried chicken', 
                               'Chicken and galangal in coconut milk soup', 'Steamed duck'),
                      Price = c(120, 120, 100, 120, 80, 50, 100, 100, 120, 90, 80, 100, 80, 80, 120, 150),
                      Meat = c('shrimp', 'Chicken', 'shrimp', 'Pork belly', 'Pork', 
                               'Pork belly', 'Beef', 'Duck', 'Beef', 'Pork', 'Chicken', 
                               'shrimp', 'Fish', 'Chicken', 'Chicken', 'Duck'))
cost_of_food <- data.frame(
  Meat = c('Chicken', 'Pork', 'Pork belly', 'Duck', 'Beef', 'shrimp', 'Fish'),
  Price = c(20, 30, 20, 20, 40, 30, 40)
)


dbWriteTable(con,"list_menu",list_menu)
dbWriteTable(con,"Selling",Selling)
dbWriteTable(con,"customer",customer)
dbWriteTable(con,"menu",menu)
dbWriteTable(con,"cost_of_food",cost_of_food)

dbListTables(con)

dbDisconnect(con)
