class ItemsController < ApplicationController
  before_action :is_admin, only: [:new, :create, :delete]
  def delete
    today_menu.items.find(params[:id]).destroy
    redirect_to menu_new_url, notice: 'Successfully deleted select item' and return
  end
  def new
    @item = Item.new
  end
  def create
    @item = today_menu.items.new(item_params)
    if @item.save
      redirect_to menu_new_url, notice: 'Successfully added a menu item' and return
    else
      desc = ''
      if @item.errors.any?
        @item.errors.each do |item, err|
          desc += item.to_s + ': ' + err.to_s + " \n" 
        end
      end 
      redirect_to items_new_url, alert: desc
  end
  end
  private 
  def item_params
      params.require(:item).permit(:name,:price,:image,:d_type)
  end
  def is_admin
    unless is_adm 
      redirect_to root_url, alert: 'You are not allowed to do this' and return
    end
  end
end
