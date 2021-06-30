require 'uri'
require 'net/http'
require 'json'


class InfoController < ApplicationController
  def info
    user = session[:token]
    if user == nil || user == ""
      redirect_to login_path
    else
      uri = URI('http://0.0.0.0:3000/info')
      param = {:user => user}
      uri.query = URI.encode_www_form(param)

      res = Net::HTTP.get_response(uri)
      temp = JSON.parse(res.body)
      @a = temp["data"]
      if @a == nil
        redirect_to login_path
      end
      @role_name = temp["role_name"]
      @status_name = temp["status_name"]
      @listacc = temp["list"]
      @role_admin = temp["roleadmin"]
    end
  end

  def logput_get
    logout
  end

  def logout
    session[:user] = nil
    redirect_to login_path
  end
end
