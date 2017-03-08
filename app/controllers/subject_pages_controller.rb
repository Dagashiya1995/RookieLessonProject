class SubjectPagesController < ApplicationController
  def index
    @subject_pages = SubjectPage.all
  end

  def show
  end

  def edit
    @subject_page = SubjectPage.find(params[:id])
  end

  def update
    subject_page = params['subject_page']
    SubjectPage.update(title: subject_page['title'],
                       category: subject_page['category'] ,
                       body: subject_page['body'],
                      )
    redirect_to subject_pages_path
  end

  def new
    @subject_page = SubjectPage.new
  end

  def create
    subject_page = params['subject_page']
    SubjectPage.create(title: subject_page['title'],
                       category: subject_page['category'] ,
                       body: subject_page['body'],
                      )
    redirect_to subject_pages_path
  end

  def destroy
    subject_page = SubjectPage.find(params[:id])
    subject_page.destroy
    redirect_to subject_pages_path
  end
end
