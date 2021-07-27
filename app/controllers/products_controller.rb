class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_products, only: [:show,:edit, :update,:destroy]
  before_action :set_user, only: [:edit,:destroy]

  def index
    @products = Product.all.order(created_at: "DESC")
  end

  def show
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
    unless set_user
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

  def destroy
    if set_user
      @product.destroy
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:p_name, :description, :category_id, :status_id, :obligation_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_products
    @product = Product.find(params[:id])
  end

  def set_user
    current_user.id == @product.user_id
  end

end
