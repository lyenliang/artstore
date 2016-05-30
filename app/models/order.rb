class Order < ActiveRecord::Base
    belongs_to :user
    
    has_many :items, class_name: "OrderItem", dependent: :destroy
    has_one :info, class_name: "OrderInfo", dependent: :destroy
    
    accepts_nested_attributes_for :info
    
    before_create :generate_token
    
    def generate_token
        self.token = SecureRandom.uuid
    end
    
    def build_item_cache_from_cart(cart)
        # cart_item is a product
        cart.items.each do |cart_item|
            # item is a OrderItem
            item = items.build
            item.product_name = cart_item.title
            item.price = cart_item.price
            item.quantity = 1
            item.save
        end 
    end
    
    def calculate_total!(cart)
        # total is defined in yyyyddddtttttt_create_orders.rb
        self.total = cart.total_price
        self.save
    end
end
