class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :current_cart

    before_action :configure_permitted_parameters, if: :devise_controller?


    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end
    

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :phone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :phone])
    end

  private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
    
end
