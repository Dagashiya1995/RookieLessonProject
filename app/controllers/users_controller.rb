class UsersController < ApplicationController
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
                password: user['password']
               )
    redirect_to users_path
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
                password: user_params['password']
               )
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end
