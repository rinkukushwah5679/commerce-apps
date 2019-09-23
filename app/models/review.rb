class Review < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :product, optional: true
	belongs_to :order, optional: true
	def half_star?
		if ((self.rating/2.0).to_s.split('.')[1].to_i) > 0
			true
		else
			false
		end
	end
end
