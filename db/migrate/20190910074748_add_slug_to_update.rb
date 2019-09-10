class AddSlugToUpdate < ActiveRecord::Migration[5.2]
  def up
  	User.find_each(&:save)
  	Product.find_each(&:save)
  end
  def down
  	
  end
end
