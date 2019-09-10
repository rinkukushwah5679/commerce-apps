class Order < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :user, optional: true
    belongs_to :address, optional: true
end
