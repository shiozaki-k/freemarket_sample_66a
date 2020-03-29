class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :condition, :brand, :description, :shipping_fee, :shipping_origin, :shipping_duration, :user_id, images_attributes: [:src])
  end
end
