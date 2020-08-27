class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        @total += (price * quantity)
        @items.fill(item, @items.size, quantity)
        @last_transaction = (price * quantity)
    end

    def apply_discount
        if @discount > 0
            @total = @total * (0.01 * (100 - @discount))
            "After the discount, the total comes to $#{@total.to_s.sub(/\.?0+$/, '')}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total == 0.0 ? @total : @total -= @last_transaction
    end
end
