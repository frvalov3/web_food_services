class SessionsController < ApplicationController
  def new
    @categories = FoodCategory.all
    render "shared/_form_login"
  end

  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      if user.Admin? 
        flash[:success] = "Welcome admin"
        redirect_to admin_root_url
      elsif user.Employee?
        flash[:success] = "Welcome Employee"
        redirect_to employee_root_url
      else
        flash[:success] = "Welcome"
        # redirect_back_or root_url
        redirect_to user
      end
    else
      flash[:danger] = "Invalid account"
      render 'shared/_form_login'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
