class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :is_adm
  helper_method :today_menu
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  def is_adm
    if current_user && !current_user.is_adm.nil?
      true
    else
      false
    end
  end
  def today_menu
    if Menu.any?
      if Menu.last.date == Date.today
        Menu.last
      else
        get_a_new_menu
      end
    else
      get_a_new_menu
    end
  end
  def get_a_new_menu 
    Menu.create(date: Date.today)
  end
end
