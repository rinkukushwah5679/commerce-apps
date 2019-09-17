class Review < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :product, optional: true
	belongs_to :order, optional: true
end
