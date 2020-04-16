class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    # if user_signed_in?
      @product = Product.new
      @product.images.new
    # else
    #   redirect_to items_path
    # end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
   
  end
  
  def edit

  end

  

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
 
    if @product.destroy
      redirect_to root_path
    else
      redirect_to product_path(@product.id)
    end
    
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :condition, :category, :brand, :description, :shipping_fee, :shipping_origin, :shipping_duration, :user_id, images_attributes:  [:src, :_destroy, :id]).merge(status: 0, user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
