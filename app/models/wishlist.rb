class Wishlist < ApplicationRecord
	belongs_to :product, optional: true
end
