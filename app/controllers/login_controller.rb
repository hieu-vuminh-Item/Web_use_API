class LoginController < ApplicationController
  def login

  end

  def create_session
    session[:user] = params[:user]
    redirect_to info_path
  end
end