class Order < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :user, optional: true
    has_many :addresses, dependent: :destroy

end
