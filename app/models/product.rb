class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :oligation
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :date

  with_options presence: true do
    validates :p_name, :description, :image
    
    with_options numericality: { other_than: 1 ,message: "can be blank"} do
      validates :category_id, :status_id, :oligation_id, :prefecture_id, :date_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
    end
  end
end
