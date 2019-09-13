class ApplicationController < ActionController::Base
  	 protect_from_forgery with: :exception
     before_action :user_admin, expect:[:after_sign_in_path_for]
    include ApplicationHelper
    layout :set_layout
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :check_subscription
    helper_method :current_cart 
  def current_cart
    if current_user.present?
      return Cart.find_or_create_by(user_id: current_user.id, is_done:false)
    end
  end
  
  def after_sign_in_path_for(resource)
    resource.is_admin? ? admin_root_path : root_path
  end

  def user_admin
    if request.fullpath.split("/")[1] == "admin"
      if user_signed_in?
        if current_user.role != 'admin'
          redirect_to root_path
        else
          request.url
        end
      else
        redirect_to new_user_session_path
        flash[:alert] = "You are not authorized to perform this action."
      end
    else
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role, :first_name, :last_name, :image, :is_active, :is_admin, :phone, :gender, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :role, :first_name, :last_name, :image, :is_active, :is_admin, :phone, :gender, :address])

  end

  def authentication_admin!
      unless current_user.is_admin?
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
      end
   end
  

 end
