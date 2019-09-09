class Address < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :order, optional: true
	def full_address
		"#{address}, #{district}, #{country}-#{post_code}"
	end
end
