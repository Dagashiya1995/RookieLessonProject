# coding: utf-8
class Admin::UsersController < Admin::BaseController
  before_action :login_check
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]

  
  #def login_check
  #  return redirect_to new_login_path, alert: 'ログインしていません' if session[:user_id] == nil
  #end
  
    
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = params['user']
    User.create(name: user['name'],
                grade: user['grade'] ,
                snum: user['snum'],
                account: user['account'],
                password: Digest::SHA256.hexdigest(user['password']),
                password_confirmation: Digest::SHA256.hexdigest(user['password_confirmation']),
                is_admin: user['is_admin'] == '1'
               )
    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user_params = params['user']
    user.update(name: user_params['name'],
                grade: user_params['grade'] ,
                snum: user_params['snum'],
                account: user_params['account'],
                password:  Digest::SHA256.hexdigest(user_params['password']),
                password_confirmation: Digest::SHA256.hexdigest(user_params['password_confirmation']),
                is_admin: user['is_admin'] == '1'
               )
    redirect_to admin_users_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end
end
