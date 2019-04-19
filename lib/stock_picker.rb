#!/usr/bin/env ruby

def stock_picker stocks
    buy_day, sell_day = nil
    max_profit = 0

    stocks.each_with_index do |buy, x|
        # ignore days before the buy day
        stocks[x..-1].each_with_index do |sell, y|

            if sell - buy > max_profit
                max_profit = sell - buy
                # adjust y index to account for days before buy day
                buy_day, sell_day = x, y + x
            end
        end
    end

    [buy_day, sell_day, max_profit]
end

p stock_picker [17,3,6,9,15,8,6,1,10]
p stock_picker [17,3,6,9,15,8,6,1,10].reverse