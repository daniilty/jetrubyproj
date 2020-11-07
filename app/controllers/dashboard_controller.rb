class DashboardController < ApplicationController
  def index
    @menus = Menu.all
  end
end
