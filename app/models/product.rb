class Product < ApplicationRecord
  belongs_to :user
  has_one :history,dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :obligation
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  with_options presence: true do
    validates :p_name, :description, :image
    
    with_options numericality: { other_than: 1 ,message: "can't be blank"} do
      validates :category_id, :status_id, :obligation_id, :prefecture_id, :day_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 299, less_than: 10000000 } 
    end
  end
end
