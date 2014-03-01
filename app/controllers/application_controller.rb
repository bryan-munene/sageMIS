class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_required
  #before_filter { |c| Authorization.current_user = c.current_user }
  def login_required
    return if logged_in?
    flash[:warning]='Please login to continue'
    session[:return_to]=request.fullpath
    redirect_to :controller => "sessions", :action => "login"
    return false
  end
  def logged_in?
    current_user
    ! @current_user.nil?
  end
  def current_user
    @current_user = session[:user] if session[:user]
  end
  def current_item
    @current_item = session[:item_id] if session[:item_id]
  end
  def current_sale
    @current_sale = session[:sale] if session[:sale]
  end
  # A before filter for views that only authorized users can access
  def ensure_authorized(error_message)
    if logged_in?
      @person = Person.find(params[:person_id] || params[:id])
      return if current_user?(@person)
      flash[:error] = error_message
      redirect_to root and return
    end
  end
  protected

  def permission_denied
  flash[:error] = "Sorry, you are not allowed to access this module"
  redirect_to :controller=>"dashboard"
  end
end
