class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:index, :create]

  def index
    if urrent_user.id != @product.user_id && @product.history == nil
      @product_history = ProductHistory.new
    else
      redirect_to root_path
    end
  end

  def create
    @product_history = ProductHistory.new(order_params)
    if @product_history.valid?
      pay_item
      @product_history.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_products
    @product = Product.find(params[:item_id])
  end

  def order_params
    params.require(:product_history).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token], history_id: params[:history_id], user_id: current_user.id )
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
    end
end
