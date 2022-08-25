
require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total, :all_items

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @all_items = []
    end

    def add_item(title, price, quantity = 1)
       quantity.times do 
            @items << title
       end
        
        self.total += (price * quantity)
        self.all_items.push({
            title: title, 
            price: price, 
            quantity: quantity
        })
    end

    def apply_discount
        if(@discount != 0)
            self.total = self.total.to_f * (100 - @discount.to_f)/100
            message = "After the discount, the total comes to $#{total.round}."
        else
            message = "There is no discount to apply."
        end
        message
    end

    def items
        @items
    end 

    def void_last_transaction
        last_item = self.all_items[-1]
        puts last_item
        self.total -= last_item[:price] * last_item[:quantity]

        self.all_items.pop
    end
end

binding.pry