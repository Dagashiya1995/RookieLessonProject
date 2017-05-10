class SubjectPagesController < ApplicationController
  before_action(:user_check)
  
  def user_check
    @user = User.find(session[:user_id]).account
  end
  
  def index
    @subject_pages = SubjectPage.order('number DESC')
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
    redirect_to user_category_subject_pages_path(subject_page.user_id, subject_page.category_id)
  end

  def new
    @subject_page = SubjectPage.new
  end

  def create
    @subject_pages = SubjectPage.all
    subject_page_params = params['subject_page']
    category = subject_page_params['category_id']
    user = params['user']

    latestNumber = (category.to_i - 1) * 1000
    @subject_pages.each do |subject_page|
      if category.to_i == subject_page.category_id && subject_page.number.to_i > latestNumber && subject_page.user_id == session[:user_id]
        latestNumber = subject_page.number.to_i
      end
    end
    number = latestNumber + 10

    subject_page = SubjectPage.new(title: subject_page_params['title'],
                                   category_id: subject_page_params['category_id'] ,
                                   number: number,
                                   body: subject_page_params['body'],
                                   user_id: session[:user_id]
                                  )
    subject_page.save
    redirect_to user_category_subject_pages_path(session[:user_id], subject_page.category_id)
  end

  def destroy
    @subject_pages = SubjectPage.all
    subject_page_destroy = SubjectPage.find(params[:id])

    @subject_pages.each do |subject_page|
      if subject_page.category_id == subject_page_destroy.category_id && subject_page.number > subject_page_destroy.number && subject_page.user_id == session[:user_id]
        subject_page.number = subject_page.number - 10
        subject_page.save
      end
    end

    subject_page_destroy.destroy

    redirect_to user_category_subject_pages_path
  end
end
