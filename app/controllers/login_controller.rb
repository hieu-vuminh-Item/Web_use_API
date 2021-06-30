class LoginController < ApplicationController
  def login

  end

  def create_session
    session[:token] = params[:user]
    redirect_to info_path
  end
end