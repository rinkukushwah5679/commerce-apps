class Address < ApplicationRecord
	belongs_to :user, optional: true
	 # has_many :orders, dependent: :destroy

	def full_address
		"#{address} #{district} #{country}-#{post_code}"
	end
end
