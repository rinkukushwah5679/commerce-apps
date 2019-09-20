class Product < ApplicationRecord
	belongs_to :category, optional: true
  has_many :reviews
	mount_uploader :image, AvatarUploader
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  has_many :orders
  has_many :cart_items
  has_many :favorites, dependent: :destroy
	validate :discount_after_price?
  acts_as_paranoid
  default_scope {order("created_at desc")}
  def discount_after_price?
   	if discount_price.present? 
	   	if discount_price.to_i > price.to_i 
	   		errors.add :discount_price, " ,full price must be less than"
	   	end
    end 	
  end
  def discount_percentage
    if price.present? && price.to_i > 0 && discount_price.present? && discount_price.to_i > 0
      "" + (100 - (discount_price.to_f / price.to_f * 100.0)).round(2).to_s + "%"
    else
      "0.0"
    end
  end
  
end
