class SessionsController < ApplicationController
  include CookieAuth
  layout 'login'
  skip_before_action :authenticate, only: [:new, :create]
  before_action :auth_via_cookie, only: [:new]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      self.session_cookie = user.tokens.create.key
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    find_token(session_cookie).destroy
    self.session_cookie = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
