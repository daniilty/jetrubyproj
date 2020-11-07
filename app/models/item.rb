class Item < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :menu
  validates :name, presence: true
  validates :price, presence: true
  validates :d_type, presence: true
end
