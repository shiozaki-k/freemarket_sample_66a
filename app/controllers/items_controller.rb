class ItemsController < ApplicationController

  def index
    
  end
  def new
    @item =Item.new
    @item.images.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品完了しました'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :condition, :brand, :description, :shipping_fee, :shipping_origin, :shipping_duration, images_attributes:  [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
