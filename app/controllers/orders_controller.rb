class OrdersController < ApplicationController
  before_action :is_admin, only: [:index]
  skip_before_action :authenticate_user!, only: [:rest]
  def index
    @orders = Order.all
  end
  def rest
    hmac_secret = 'my$ecretK3y'
    @orders = Order.where('menu_id = ?', today_menu.id)
    payload = @orders.each.map do |order|
      JSON.parse({order_id: order.id, name: User.find(order.user_id).name, order_details: { first_course: order.first_id == 0 ? 'None' : Item.find(order.first_id).name, main_course: order.main_id == 0 ? 'None' : Item.find(order.main_id).name, drinks: order.drink_id == 0 ? 'None' : Item.find(order.drink_id).name }, total_price: order.price }.to_json)
    end
    token = JWT.encode payload, hmac_secret, 'HS256'
    render json: { token: token }.to_json, status: :ok
  end
  def create
    @order = Order.new(order_params)
    if @order.main_id == 0 && @order.first_id == 0 && @order.drink_id == 0 
      redirect_back fallback_location: root_path, alert: 'You have to choose at least one option' and return
    end
    if @order.save
      redirect_to root_url, notice: 'We will process your order as fast as we can'
    else
      redirect_back fallback_location: root_path, alert: 'Something went wrong'
    end 
  end
  private
  def order_params
    ordp = params.require(:order).permit(:user_id, :main_id, :first_id, :menu_id, :drink_id)
  end
  def is_admin
    unless is_adm 
      redirect_to root_url, alert: 'You are not allowed to do this' and return
    end
  end
end
