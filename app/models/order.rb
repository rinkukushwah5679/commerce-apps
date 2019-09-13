class Order < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :user, optional: true
	belongs_to :cart, optional: true
    # belongs_to :address, optional: true
    def full_address
    "#{address} #{district} #{country}-#{postal_code}"
  end
end
