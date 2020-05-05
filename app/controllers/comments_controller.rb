class CommentsController < ApplicationController

  def create
    @comments = Comment.create(comment_params)
    if @comments.id == nil
     redirect_to product_path(@comments.product.id),notice: 'コメント送信に失敗しました。' and return
    else
     redirect_to product_path(@comments.product.id),notice: 'コメントが送信されました。' and return
    end
    
  end

  # def destroy
  #   if user_signed_in? && current_user.id
  #     @comments = Comment.find(params[:id])
  #     if @comments.destroy
  #       redirect_to product_path(@comments.product.id),notice: 'コメントが削除されました' and return
  #     else
  #       redirect_to product_path(@comments.product.id),notice: 'コメント削除に失敗しました' and return
  #     end
  #   else
  #     redirect_to product_path(@comments.product.id),notice: 'コメント削除に失敗しました' and return
  #   end
    
  # end




  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
