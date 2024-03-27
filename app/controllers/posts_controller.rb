class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, :only => [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :in_check
  
  def in_check
   if current_user.admin? || current_user.adminassistant? || current_user.client? || current_user.attorney?
    if current_user.lawfirm
    if current_user.lawfirm.status == "inactive" ||  current_user.lawfirm.status == nil
         redirect_to new_transaction_path, notice: 'Your Lawfirm Subscription has Expire Contact your Lawfirm Admin!'
      end
      else
        redirect_to new_lawfirm_path, notice: 'Setup Your Lawfirm First'

    end
    end
  end
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
   
  end

  # GET /posts/new
  def new
    unless current_user.sadmin? || current_user.client?
        @post = Post.new
    else redirect_to root_path notice: 'Super admin and clients can not create forum post.'

    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    
    @post = Post.create(post_params)
     @post.poster_id = current_user.id
    @post.poster_type = current_user.type
    @post.save
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
		format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
		format.js
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit!
    end
end
