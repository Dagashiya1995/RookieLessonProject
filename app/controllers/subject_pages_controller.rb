class SubjectPagesController < ApplicationController
  before_action(:user_check)
  
  def user_check
    @user = User.find(session[:user_id]).account
  end
  
  def index
    @subject_pages = SubjectPage.all
    @category = Category.find(params[:category_id])
  end

  def show
    @subject_page = SubjectPage.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def edit
    @subject_page = SubjectPage.find(params[:id])
  end

  def update
    subject_page = SubjectPage.find(params[:id])
    subject_page_params = params['subject_page']
    subject_page.update(title: subject_page_params['title'],
                       category_id: subject_page_params['category_id'],
                       number: subject_page_params['number'],
                       body: subject_page_params['body'],
                       user_id: session[:user_id]
                      )
    redirect_to user_category_subject_pages_path(subject_page.user_id)
  end

  def new
    @subject_page = SubjectPage.new
  end

  def create
    subject_page = params['subject_page']
    user = params['user']
    SubjectPage.create(title: subject_page['title'],
                       category_id: subject_page['category_id'] ,
                       number: subject_page['number'],
                       body: subject_page['body'],
                       user_id: session[:user_id]
                      )
    redirect_to user_category_subject_pages_path
  end

  def destroy
    subject_page = SubjectPage.find(params[:id])
    subject_page.destroy
    redirect_to user_category_subject_pages_path
  end
end
