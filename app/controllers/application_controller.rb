class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_required
    # admin? is a user-defined method
    if !current_user.admin?
      redirect_to "/"
    end
  end

  helper_method :current_cart
  
  def current_cart
    @current_cart ||= find_cart
  end
  
  private 
  
  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    
    unless cart.present?
      cart = Cart.create
      # Can I put "session[:cart_id] = cart.id" here?
    end
    
    logger.debug "cart.id: #{cart.id}"
    logger.debug "session[:cart_id]: #{session[:cart_id]}"
    if (cart.id != session[:cart_id]) 
      logger.debug "difference found"
    end
    session[:cart_id] = cart.id
    
    return cart
  end

end
