class CategoriesController < ApplicationController
 
  def set_parents
    @parents = Category.where(ancestry: nil)
    render layout 'header'
  end
  # def index
  #   @parents = Category.all.order("id ASC").limit(13)
  # end

  # def new
  #   @children = Category.find(params[:parent_id]).children
  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end
end