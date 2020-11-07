class WeekdayController < ApplicationController
  def menu
    @orders = Order.where('menu_id = ?', params[:id])
    @order = Order.new
    @menu = Menu.find(params[:id])
    @main_course = @menu.items.where("d_type = ?", "Main course")
    @first_course = @menu.items.where("d_type = ?", "First course")
    @drinks = @menu.items.where("d_type = ?", "Drinks") 
  end
end
