class CashRegister

    attr_accessor :total, :discount, :all_items, :transactions 

    def initialize(discount=0)
        @discount = discount
        @all_items = []
        @total = 0 
        @transactions = []

    end 


    def add_item(title, price, quantity=0)

        if quantity != 0
            transaction = price * quantity
            self.total += transaction
            transactions << transaction
            quantity.times{@all_items << title}
        else 
            self.total += price 
            @all_items << title  
            transactions << price 
        end
    end 

    def apply_discount 
        if discount == 0 
            return "There is no discount to apply."  
        else
            self.total = self.total * (100 - discount)/100
            return "After the discount, the total comes to $#{self.total}."
        end
    end 
    
    def items 
        @all_items
    end 

    def void_last_transaction 
        last_transaction = transactions.pop()
        self.total -= last_transaction
    end 
end 
