class CartItem < ActiveRecord::Base
    belongs_to :cart_items
    belongs_to :product
end
