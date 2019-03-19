class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :follow, :unfollow]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :user_is_owner?, only: [:edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order(:cached_votes_up => :desc)
  end

  def upvote
    authenticate_user!
    @product.liked_by current_user
    current_user.follow(@product)
    redirect_to request.referrer, notice: "You are now following this product! If you would like to vote and not follow, click unfollow."
  end

  def downvote
    authenticate_user!
    @product.downvote_from current_user
    redirect_to request.referrer
  end

  def follow
    authenticate_user!
    current_user.follow(@product)
    redirect_to request.referrer
  end

  def unfollow
    authenticate_user!
    current_user.stop_following(@product)
    redirect_to request.referrer
  end


  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order('created_at DESC')
  end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :stage, :category, :description, :product_type, :url, comments: [])
    end

    def user_is_owner?
      is_owner = current_user == @product.user
      redirect_to @product unless is_owner
    end

end
