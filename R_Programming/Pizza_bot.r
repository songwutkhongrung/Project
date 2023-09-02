#Table Menu
Menu <- c('Hawaiian','Seafood Deluxe','Super Deluxe','Seafood Cocktail','Chicken Trio')
Price_of_Menu <-c(320,300,350,350,300)
Pizza_menu = data.frame(Menu,Price_of_Menu)
#Table Crust
Crust_name = c('Pan Medium','Crispy Thin Medium','Extreme Cheese Meduim','Extreme Sausage & Cheese')
Price_of_Crust = c(100,50,150,200)
Crust = data.frame(Crust_name,Price_of_Crust)

chatbot <- function() {
  print("Welcome To W pizza you’re want to order?")
  Answer = readline("Yes or No!!!!")
  if (Answer == "nO"|Answer == "No"|Answer == "no"|Answer == "NO"){
    return("Have a good day.Thank you to come W pizza")
  }else print("What you enjoy to eat")
        print("You want to enjoy with .Select a number of pizza .")
        print("1.Hawaiian")
        print("2.Seafood Deluxe")
        print("3.Super Deluxe")
        print("4.Seafood Cocktail")
        print("5.Chicken Trio")
        
        orderpizza = as.numeric(readline())
         
    if (orderpizza %in% 1:5 ){
      selected_pizza <- Pizza_menu[orderpizza, 1]
      pizza_price <- Pizza_menu[orderpizza, 2]
      print(paste("Nice choice! The price of", selected_pizza, "pizza is", pizza_price))
      
      print("Can add happiness")
      print("You want to enjoy with .Select a number of Crust.")
      print("1.Pan Medium")
      print("2.Crispy Thin Medium")
      print("3.Extreme Cheese Meduim")
      print("4.Extreme Sausage & Cheese")
      print("5.No add")
      
      ordercrust = as.numeric(readline())
      
      while(TRUE)
        if(ordercrust %in% 1:4){
        selected_crust <- Crust[ordercrust, 1]
        crust_price <- Crust[ordercrust, 2]
        return(paste("It's very special! The", selected_crust, "will add more happiness to your", selected_pizza, "pizza. The total price is", pizza_price + crust_price))
      } else if (ordercrust == 5) {
        return(paste("You chose not to add any additional crust to your", selected_pizza, "pizza. The total price is", pizza_price))
        break
      } else {
        print("Invalid input. Please select a valid crust number.")
        ordercrust <- as.numeric(readline())
      }
    } 
}

chatbot()
