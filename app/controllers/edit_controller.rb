class EditController < ApplicationController
  def edit
    user = params[:user]
    if user == "admin"
      flash[:notice] = "Can't edit default account"
      redirect_to infor_path
    end
    uri = URI('http://0.0.0.0:3000/edit')
    param = {:user => user}
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

  def check_update
    user = params[:user]
    if user == session[:user]
      status = params[:status]
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
