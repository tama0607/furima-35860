class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :product_set, only: [edit, :update]



  def index
    @products = Product.all.order(created_at: "DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.valid?
        @product.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @product.update(item_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def product_params
    params.require(:product).permit(:p_name, :description, :category_id, :status_id, :obligation_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def product_set
    @product = Product.find(params[:id])
  end
end
