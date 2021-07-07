class CashRegister
    attr_accessor :discount, :total,:price,:quantity,:items_list,:last_transaction_amount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items_list =[]
        @last_transaction_amount = nil
    end

    def total
        @total
    end

    def add_item(item,price,quantity=1)
        self.total += price * quantity
        quantity.times do
        self.items_list.push(item)
        end
        self.last_transaction_amount = price * quantity
    end

    def apply_discount
        if self.discount != 0
        self.total = self.total * ((100 - self.discount )/ 100.0) 
        return "After the discount, the total comes to $#{self.total.to_i}."
        else 
            return "There is no discount to apply."
        end
    end

    def items
        self.items_list
    end

    def void_last_transaction
        self.total -= self.last_transaction_amount
    end

end