class CategoriesController < ApplicationController
 
  def set_parents
    @parents = Category.where(ancestry: null)
    binding.pry
    render layout 'header'
  end

  # def new
  #   @children = Category.find(params[:parent_id]).children
  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end
 
  
end
