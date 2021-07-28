class HistoryCustomer
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :product_id, :user_id

  with_options presence: true do
    validates :token, :municipality, :address
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postal_code, length: { is: 8 } 
    end
  end

    def save
      Customer.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
      History.create(user_id: user_id, product_id: product_id)
    end
end