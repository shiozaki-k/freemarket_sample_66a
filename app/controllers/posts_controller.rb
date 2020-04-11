class PostsController < ApplicationController
  def index
  end
  def show
    render "posts/index"
  end

  def new
    render "posts/card"
  end

end
  
