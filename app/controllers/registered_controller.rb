class RegisteredController < ApplicationController
  before_action :is_admin, only: [:index]
  
  def index
    @users = User.all
  end

  private
  def is_admin
    unless is_adm 
      redirect_to root_url, alert: 'You are not allowed to do this' and return
    end
  end
end
