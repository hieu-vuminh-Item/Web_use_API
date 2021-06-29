class LoginController < ApplicationController
  def login

  end

  def create_session
    session[:user] = params[:user]
    redirect_to infor_path
  end
end