class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_products, only: [:index, :create]
  before_action :set_user,only:[:index,:create]

  def index
    @history_customer = HistoryCustomer.new
  end

  def create
    @history_customer = HistoryCustomer.new(order_params)
    if @history_customer.valid?
      pay_product
      @history_customer.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_products
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:history_customer).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token],product_id: params[:product_id], user_id: current_user.id )
  end

  def set_user
    unless current_user.id != @product.user_id && @product.history == nil
      redirect_to root_path
    end
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
