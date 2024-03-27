class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
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
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @post = Post.find(params[:post_id])
  @comment=@post.comments.build
  end

  # GET /comments/1/edit
  def edit
     @post = Post.find(params[:post_id])
     @comment=@post.comments.find(params[:id])
     
  end

  # POST /comments
  # POST /comments.json
  def create
    @post=Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
     @comment.commenter_id = current_user.id
    @comment.commenter_type = current_user.type
    @comment.save
    respond_to do |format|
      if @comment.save
     
     if  @comment.commenter_id  !=  current_user.lawfirm.admin.id 

          Notification.create(
          notify_type: 'comment',
          actor: current_user,
          user: current_user.lawfirm.admin,
          target: @post)
    end

    if  @comment.commenter_id  !=  @post.poster.id 

          Notification.create(
          notify_type: 'comment',
          actor: current_user,
          user: @post.poster,
          target: @post)
        end

         if @post.comments

            @post.comments.each do |f|

              Notification.create(
          notify_type: 'comment',
          actor: current_user,
          user: f.commenter,
          target: @post)
            end
          end
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @post = Post.find(params[:post_id])
     @comment=@post.comments.find(params[:id])

    @comment.save
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
     @post = Post.find(params[:post_id])
     @comment=@post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_url(@post), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit!
    end
 
end
