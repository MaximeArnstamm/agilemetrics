class PagesController < ApplicationController
  def home
    @projects = Project.order(:name)
    render :layout => 'login'
  end
end
