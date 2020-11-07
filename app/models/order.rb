class Order < ApplicationRecord
  before_save :set_price
  private
  def set_price
    mainp = self.main_id == 0 ? 0 : Item.find(self.main_id).price 
    firstp = self.first_id == 0 ? 0 : Item.find(self.first_id).price 
    drinkp = self.drink_id == 0 ? 0 : Item.find(self.drink_id).price 
    self.price = drinkp + firstp + mainp
  end
end
