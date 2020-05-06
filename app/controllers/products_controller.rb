class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :category_children, :category_grandchildren,:buy,]

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
      @product.images.new
      @category = Category.all.order("id ASC").limit(13)
      render :new
    end
  end

  def show
  @parents = Category.where(ancestry: nil)
  @comment = Comment.new
  @comments = @product.comments.includes(:user)
  end
  
  
  def edit
    @category = Category.all.order("id ASC").limit(13)
    @grandchildren_category = @product.category.siblings
    @children_category = @product.category.parent.siblings

  end

  

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product.id),notice: '商品編集が完了しました' and return
    else
      @category = Category.all.order("id ASC").limit(13)


      if @product.category == nil
        redirect_to edit_product_path(@product.id), notice: '・カテゴリーは3つ選択してください。' and return
      
      else
        @children_category = @product.category.parent.siblings
       
      end
        if @product.category == nil
          redirect_to edit_product_path(@product.id), notice: '・カテゴリーは3つ選択してください。' and return
          
        else
          @grandchildren_category = @product.category.siblings
        end
     
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @product.user_id
      if @product.destroy
        redirect_to root_path,notice: '商品が削除されました' and return
      else
        redirect_to product_path(@product.id),notice: '商品削除に失敗しました' and return
      end
    else
      redirect_to product_path(@product.id),notice: '商品削除に失敗しました' and return
    end
    
  end

  def buy
  end  

  private

  def product_params

    params.require(:product).permit(:name, :price, :condition, :category_id, :brand, :description, :shipping_fee, :prefecture_id, :shipping_duration, :user_id, images_attributes:  [:src, :_destroy, :id]).merge(status: 0, user_id: current_user.id)

  end

  def set_product
    @product = Product.find(params[:id])
  end
end
