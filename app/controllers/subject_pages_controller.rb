class SubjectPagesController < ApplicationController
  def index
    @subject_pages = SubjectPage.all
  end

  def show
  end

  def edit
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
end
