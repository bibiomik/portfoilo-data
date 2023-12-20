#pizza chatbot

print("Welcome to Buddy’s Pizza Chatbot 🤖🍕")
pizza_menu <- c("Hamburger Beef", "Pepperoni", "Meat Lovers", "Haeaiian", "Extreme Cheese")
drink_menu <- c("Soda", "Strawberry Smoothie", "Lemonade")
size_name <- c("Small", "Medium", "Large")
type_menu <- c("Pizza", "Drink")
payment_method <- c("Cash", "Propmtpay", "Credit Card")

all_menu <- data.frame(
    menu_name = c("Hamburger Beef", "Pepperoni", "Meat Lovers", "Haeaiian", "Extreme Cheese", "Soda", "Strawberry Smoothie", "Lemonade"),
    s_price = c(21.00, 17.80, 20.00, 16.50, 14.30, 1.90, 2.90, 3.50),
    m_price = c(21.50, 18.30, 20.50, 17.00, 14.80, 2.60, 3.45, 4.00),
    l_price = c(22.00, 18.30, 21, 17.50, 15.30, 3.60, 4.30, 5.00),
    type = c("Pizza", "Pizza", "Pizza", "Pizza", "Pizza", "Drink", "Drink", "Drink")
)

## data customer
flush.console()
name_input <- readline("Please insert your name: ")
flush.console()
phone_input <- readline("Please insert your phone number: ")

flush.console()
paste("Hello! ", name_input)
print("What can I do for you?")

my_order_id <- format(Sys.time(), "%Y%m%d-%H%M")

end_input <- 0
grand_total <- 0
ask_again <- TRUE

## order loop
    flush.console()
    while (end_input != 1) {

        if (ask_again == TRUE) {
            flush.console()
            type_input <- as.numeric(readline("Show me the list of [1]Pizza [2]Drink: "))
        } else order <- TRUE
        ## choose menu
        if (type_input == 1) {
            print("[1]Hamburger Beef [2]Pepperoni [3]Meat Lovers [4]Haeaiian [5]Extreme Cheese")
            flush.console()
            data_input <- as.numeric(readline("Please choose the PIZZA: "))
        } else if (type_input == 2) {
            print("[1]Soda [2]Strawberry Smoothie [3]Lemonade")
            flush.console()
            data_input <- as.numeric(readline("Please choose the DRINK: "))
        } else {
            print("Please order again")
        }
        type_input_name = as.character(type_menu[type_input])

        filter_menu <- all_menu[all_menu$type == type_input_name, ]
        menu_data <- c(filter_menu[data_input, ])

      # menu_data[][["menu_name"]]   name
      # menu_data[][["s_price"]]     small unit price
      # menu_data[][["m_price"]]     medium unit price
      # menu_data[][["l_price"]]     large unit price
      # menu_data[][["type"]]        type

      ## choose size
      size <- c("Small", "Medium", "Large")

      print(paste("You've ordered ", menu_data[][["menu_name"]]))
      flush.console()
      if (type_input != 3) {
        size_input <- as.numeric(readline(paste("You prefer size [1]Samll(",menu_data[][["s_price"]],") or [2]Medium(",menu_data[][["m_price"]],") or [3]Large(",menu_data[][["l_price"]],"): ")))
      } else {
        size_input <- 3
      }
      ## choose quantity
      flush.console()
      qty_input <- as.numeric(readline("Quantity: "))

      ## table order customer
      # col_order = c( "order_id","customer_name","list_id","menu","size","unit_price","qty","total_price")

      # cust_order = data.frame(matrix(nrow = 0,ncol = length(col_order)))
      # colnames(cust_order) = col_order

      # my_order_id
      # customer_name
      # my_list_id = nrow(cust_order) + 1
      my_menu = menu_data[][["menu_name"]]
      my_size = size_name[size_input]
      my_unit_price = as.numeric(menu_data[][[1 + size_input]])
      my_qty = as.integer(qty_input)
      my_total_price = as.numeric(menu_data[][[1 + size_input]] * qty_input)

      ## add a new item
      if (grand_total == 0) {
      # cust_order[nrow(cust_order) + 1,] <- list(my_order_id, name_input, my_list_id, my_menu, my_size, my_unit_price, my_qty, my_total_price)
        cust_order <- data.frame(order_id = my_order_id, customer_name = name_input, list_id = 1, menu = my_menu, size = my_size, unit_price = my_unit_price, qty = my_qty, total_price = my_total_price)
      } else {
        my_list_id = nrow(cust_order) + 1
        cust_order <- rbind(cust_order, list(order_id = my_order_id, customer_name = name_input, list_id = my_list_id, menu = my_menu, size = my_size, unit_price = my_unit_price, qty = my_qty, total_price = my_total_price))
      }

      print(cust_order)

      grand_total = grand_total + my_total_price

      if (ask_again == TRUE) {
        flush.console ()
        end_input <- readline("Anythine else? [1]Finish [2]Order more: ")
      }
  }

print("Order Summary")
print("####################################################################################")
cust_order
print("####################################################################################")

paste0("The total price: ", grand_total)
flush.console ()
payment_ans <- as.numeric(readline("Please choose a payment method [1]Cash [2]Promptpay [3]Credit Card: "))
paste("Payment Method: ", payment_method[payment_ans])
print(".........In Progress...........")
print("##### Payment Succesfully #####")
print("###############################")
print("Thank you for ordering at Buddy’s Pizza Restaurant 🤖🍕")
print("Your pizza is on the way! 🛵💨")
