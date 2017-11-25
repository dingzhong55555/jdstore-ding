class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    redirect_to :back
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy

    redirect_to :back
    flash[:warning] = "评论已删除"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
