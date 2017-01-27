# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def login_check
    return redirect_to new_login_path, alert: 'ログインしていません' if session[:user_id] == nil
  end
end
