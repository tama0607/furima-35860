class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_products, only: [:edit, :update]

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
    unless current_user.id == @product.user_id
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path(@product)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:p_name, :description, :category_id, :status_id, :obligation_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_products
    @product = Product.find(params[:id])
  end
end
