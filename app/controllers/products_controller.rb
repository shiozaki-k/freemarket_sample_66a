class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :category_children, :category_grandchildren, :buy, :pay]

  def index
    @products = Product.includes(:images).order('created_at DESC')

  end

  def new

   
    @product = Product.new
    @product.images.new
    @category = Category.all.order("id ASC").limit(13) # categoryの親を取得
    
  end

  def category_children 
    @category_children = Category.find(params[:productcategory]).children 
    respond_to do |format|
      format.html
      format.json
  end
end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得
 
  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
    end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで孫を取得｡（実際には子カテゴリーの子になる｡childrenは子を取得するメソッド)

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
  @parents = Category.where(ancestry: nil)
  end
  
  
  def edit
    @category = Category.all.order("id ASC").limit(13)
    @grandchildren_category = @product.category.siblings
    @children_category = @product.category.parent.siblings

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
  # require 'payjp'
  def buy
    # Payjp.api_key = "秘密鍵"
    # Payjp::Charge.create(
    # amount: 809, # 決済する値段
    # card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
    # currency: 'jpy'
    # )
  end  
  require 'payjp'
  def pay
    # @product = Product.find(params[:id])
    # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    # charge = Payjp::Charge.create(
    # amount: @product.price,
    # card: params['payjp-token'],
    # currency: 'jpy'
    # )
    Payjp.api_key = "秘密鍵"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

  def done
  end

  private

  def product_params

    params.require(:product).permit(:name, :price, :condition, :category_id, :brand, :description, :shipping_fee, :prefecture_id, :shipping_duration, :user_id, images_attributes:  [:src, :_destroy, :id]).merge(status: 0, user_id: current_user.id)

  end

  def set_product
    @product = Product.find(params[:id])
  end
end
