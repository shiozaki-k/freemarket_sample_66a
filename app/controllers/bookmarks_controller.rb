class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    bookmark.save!
    redirect_to products_path, success: t('.flash.bookmark')
  end

  def destroy
    current_user.bookmarks.find_by(board_id: params[:board_id]).destroy!
    redirect_to products_path, success: t('.flash.not_bookmark')
  end

  def show
    if @product.bookmark_by?(current_user)
      = render partial: 'bookmark_list'
    else
  end
end
