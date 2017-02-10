# coding: utf-8
class Admin::BaseController < ApplicationController
  before_action :login_check, :admin_check

  def admin_check
    return if User.find(session[:user_id]).admin?
    redirect_to new_login_path, alert: '管理者専用です'
  end
end
