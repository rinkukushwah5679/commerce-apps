class Wishlist < ApplicationRecord
	belongs_to :category, optional: true
end
