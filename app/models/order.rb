class Order < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :user, optional: true
	belongs_to :cart, optional: true
	has_many :reviews, dependent: :destroy

    # belongs_to :address, optional: true
    default_scope {order("created_at desc")}
    def full_address
    "#{address} #{district} #{country}-#{postal_code}"
  end
end
