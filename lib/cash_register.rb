class CashRegister
   attr_accessor :total, :discount, :list_of_titles, :last_transacton

    def initialize(discount =0)
       @total = 0
       @discount = discount
       @list_of_titles=[]
    end
  
    def add_item (title, price,quantity = 1)
        quantity.times do
        self.list_of_titles << title
        end
        self.last_transacton = price*quantity
        self.total = self.total + price*quantity
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = @total * (100-@discount)*0.01
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        self.list_of_titles
    end

    def void_last_transaction
        self.total -= self.last_transacton
    end


end

