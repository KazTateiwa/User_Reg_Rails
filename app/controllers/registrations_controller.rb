class RegistrationsController < ApplicationController
  def index

  end

  def create
    @user = User.new
    @user.full_name = params[:full_name]
    @user.street_address = params[:street_address]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.postal_code = params[:postal_code]
    @user.country = params[:country]
    @user.email_address = params[:email_address]
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
    # if successful, redirect to confirmation page
    redirect_to '/confirmation'
    else
      redirect_to '/'
      flash.now[:notice] = "Try again!"
      #render text: "Try again!"
      # replace this w/ flash once basic implemenation works and redirect to index
    end
  end

  def confirmation

  end

  def login
    # get user's id out of session
    @user = User.find(session[:user_id])
  end

  def check_user
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
    redirect_to '/login'
  else #Go back and check why this method doesn't go through to else statement if user is unknown.
      redirect_to '/'
      flash.now[:notice] = "Invalid login"
    end
  end

end
