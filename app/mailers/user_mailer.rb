class UserMailer < ApplicationMailer
	def order_product(user)
		# @product = product
		@user = user
		if @user.present?
			mail(to: @user.email, subject: 'Order your product')
		end
		
	end
end
	