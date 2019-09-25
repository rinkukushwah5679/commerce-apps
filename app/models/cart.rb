class Cart < ApplicationRecord
		# belongs_to :product, optional: true
		belongs_to :user, optional: true
		has_many :cart_items
		has_many :orders, dependent: :destroy
        default_scope {order("created_at desc")}
     def sub_total
     	cart_items.map(&:price).reject {|e| !e.present?}.sum	
	end
	 def quantity
     	cart_items.map(&:quantity).sum	
	end
	
end
