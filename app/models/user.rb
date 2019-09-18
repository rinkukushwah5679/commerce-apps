class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, AvatarUploader
  extend FriendlyId
  friendly_id :first_name, use: :slugged
  def is_admin?
    return true if self.role =="admin"
  end
  has_many :wishlists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :cart
  has_many :reviews, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  GENDER = {:male => "Male", :female => "Female"}

 
end
