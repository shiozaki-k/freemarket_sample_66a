class ItemsController < ApplicationController


  def index
    @products = Product.includes(:images).order('created_at DESC')
   
  end

  def show
    

    
  end


def index
  @parents = Category.where(ancestry: nil)

end


def show
  
end


end
