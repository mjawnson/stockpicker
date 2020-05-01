#Define an array of stock prices
stock_prices = [17,3,6,9,15,8,6,1,10,4,2,10,5,3,4,16,2]

#Define a method that takes an array of stock prices and determines the best day to buy and sell
def stockpicker(array)
#Define an array for the optimal days
optimal_strat = []
#Define a variable for the highest profit (or lowest loss...)
max_profit = 0
length = array.length
    #Loop through each stock price...
    array.each_with_index do |buy_day, buy_index|
        #Create a temporary array containing the remaining days to loop through
        temp = array.slice((buy_index + 1)...length)
        #Loop through each of these remaining 'sell' days and compute if the sell day produces a higher profit than the current highest
        temp.each_with_index do |sell_day, sell_index|
            profit_loss = sell_day.to_i - buy_day.to_i
            #If the profit for this combination of buy and sell days is higher than the current highest, reassign the days to the current
            if profit_loss > max_profit 
                max_profit = profit_loss
                optimal_strat = [buy_index, (sell_index + length - temp.length)]
            end
        end
    end
puts max_profit
optimal_strat
end

#Print the ouput to the console
p stockpicker(stock_prices)