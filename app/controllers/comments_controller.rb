class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_path(@product) }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to product_path(@product) }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
