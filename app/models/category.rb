class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	mount_uploader :image, AvatarUploader
end
