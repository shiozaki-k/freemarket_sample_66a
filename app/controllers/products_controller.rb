class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    product_params[:status]= 0
    @product = Product.new(product_params)
    if @product.save
      redirect_to controller: :products, action: :index
    else
      render :new
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :condition, :category, :brand, :description, :shipping_fee, :shipping_origin, :shipping_duration, :user_id, images_attributes:  [:src, :_destroy, :id]).merge(status:0)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
