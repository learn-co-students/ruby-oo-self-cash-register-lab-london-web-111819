require 'pry'

class CashRegister
    attr_accessor :total, :last_transaction
    attr_reader :discount

    def initialize(discount = nil)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = 0
    end


    def add_item(title, price, quantity = 1)
        calc_price = price * quantity
        @total += calc_price
        counter = 0
        while counter < quantity do 
            @items.push(title)
            counter += 1
        end
        @last_transaction = price * quantity
    end

    def apply_discount
       if @discount == nil
        "There is no discount to apply."
       else
        @total = @total - (@total * (@discount.to_f / 100))
       "After the discount, the total comes to $#{@total.to_i}."
       end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end

# binding.pry
# 'start'
