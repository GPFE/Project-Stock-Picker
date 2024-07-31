def find_best_stock_to_sell(initial_day, stock_prices)
    stock_prices.reduce(initial_day) do |best_day, day|
      (initial_day - best_day) > (initial_day - day) && stock_prices.find_index(initial_day) < stock_prices.find_index(day) ? best_day = day : best_day = best_day
    end
end

def find_best_stocks(stock_prices)
  stock_prices.reduce([]) do |arr, day|
    best_day = find_best_stock_to_sell(day, stock_prices)
    arr << [day, best_day]
  end
end

def find_best_stock(stocks)
  stocks.reduce(stocks[1]) do |best_stock, stock|
    (stock[1] - stock[0]) > (best_stock[1] - best_stock[0]) ? best_stock = stock : best_stock = best_stock
  end
end

def find_best_day(stock_pair, stock_prices)
  stock_pair.map do |stock|
    stock_prices.find_index(stock)
  end
end

def stock_picker(stock_prices)
  best_stocks = find_best_stocks(stock_prices)
  best_stock = find_best_stock(best_stocks)
  find_best_day(best_stock, stock_prices)
end

p stock_picker([17,3,6,9,15,8,6,1,10])