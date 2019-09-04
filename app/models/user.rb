class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         def is_admin?
         return true if self.role =="admin"
          end
        extend FriendlyId
        friendly_id :first_name, use: :slugged
        
end
