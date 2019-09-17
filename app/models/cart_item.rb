class CartItem < ApplicationRecord
	  belongs_to :cart
	  belongs_to :product
      default_scope {order(:created_at)}
     def total_price
     	unit_price = quantity * price	
     end
     
 end
