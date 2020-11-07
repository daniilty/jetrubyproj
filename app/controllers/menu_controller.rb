class MenuController < ApplicationController
  before_action :is_admin, only: [:new]
  def new 
    @main_course = today_menu.items.where("d_type = ?", "Main course")
    @first_course = today_menu.items.where("d_type = ?", "First course")
    @drinks = today_menu.items.where("d_type = ?", "Drinks") 
  end

  private
  def is_admin
    unless is_adm 
      redirect_to root_url, alert: 'You are not allowed to do this' and return
    end
  end
end
