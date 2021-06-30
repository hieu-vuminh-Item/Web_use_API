require 'uri'
require 'net/http'

class EditController < ApplicationController
  def edit
    user = params[:user]
    token = session[:token]
    if user == "admin"
      flash[:notice] = "Can't edit default account"
      redirect_to infor_path
    end
    uri = URI('http://0.0.0.0:3000/edit')
    param = {:user => user, :token => token}
    uri.query = URI.encode_www_form(param)
    res = Net::HTTP.get_response(uri)
    temp = JSON.parse(res.body)

    @item = temp["account"]
    @listrole = temp["role"]
    @liststatus = temp["status"]
  end

  def edit_get
    redirect_to info_path
  end

  def send_data
    uri = URI('http://0.0.0.0:3000/update')
    res = Net::HTTP.post_form(uri, 'user' => params[:user], 'pass' => params[:pass], 'role' => params[:role], 'status' => params[:status], 'token' => session[:token])
    # puts res.body  if res.is_a?(Net::HTTPSuccess)
    temp = JSON.parse(res.body)
    check_update(temp["current"], params[:status], params[:user])
  end

  def check_update(current, status, user)
    if user == current
      if status == '2'
        redirect_to info_logout_path
      else
        redirect_to info_path
      end
    else
      redirect_to info_path
    end
  end

end
