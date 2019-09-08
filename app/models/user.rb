class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, AvatarUploader
  def is_admin?
    return true if self.role =="admin"
  end

  extend FriendlyId
  friendly_id :first_name, use: :slugged
  has_many :wishlists, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  GENDER = {:male => "Male", :female => "Female"}

        
end
