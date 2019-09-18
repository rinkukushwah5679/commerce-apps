class Favorite < ApplicationRecord
   belongs_to :product, optional: true
end
