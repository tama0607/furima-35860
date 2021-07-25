class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :oligation
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :date
end
