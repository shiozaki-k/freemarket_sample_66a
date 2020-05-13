class BookmarksController < ApplicationController
  def create
    # bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    # bookmark.save!
    # redirect_to products_path, success: t('.flash.bookmark')
    @user_id = current_user.id
    @category_id = Category.find(params[:id]).id
    @bookmark = Bookmark.new(category_id: @category_id, user_id: @user_id)


      if @boookmark.save
        redirect_to user_path(current_user)
      end
  end

  def destroy
    # current_user.bookmarks.find_by(board_id: params[:board_id]).destroy!
    # redirect_to products_path, success: t('.flash.not_bookmark')
    @bookmark = Bookmark.find(params[:id])
    if @clip.destroy
      redirect_to user_path(current_user)
    end
  end

  def show
    if @product.bookmark_by?(current_user)
      = render partial: 'bookmark_list'
    else
  end
end
