# coding: utf-8
class UsersController < ApplicationController
  before_action :login_check
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update] 
  
  def index
    @users = User.all
  end
end
