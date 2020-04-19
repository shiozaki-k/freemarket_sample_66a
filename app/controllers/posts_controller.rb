class PostsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end
  def show
    @parents = Category.where(ancestry: nil)
    render "posts/index"
  end

  def new
    @parents = Category.where(ancestry: nil)
    render "posts/card"
  end

end
  
