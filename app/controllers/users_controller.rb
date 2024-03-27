class UsersController < ApplicationController
	before_action :set_user, only: [ :show, :edit]
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
 
  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.admin? || @user.client? || @user.attorney?
      @user_lawfirm = @user.lawfirm 
      @user_cases = @user.mycases
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new
    @user = User.new
  end
  
  def edit
    #@lawfirm = Lawfirm.find_by(params[:lawfirm_id])
    # @user=@lawfirm.users.find(params[:id])
  end
  
  def update
    #@lawfirm = Lawfirm.find_by(params[:lawfirm_id])
    @user=User.find_by(params[:id])

    @user.update(user_params)
    redirect_to users_admin_path(@user), notice: 'User was successfully updated.'         
  end
  
  def create
    @user = current_user.lawfirm.users.build(user_params)
    @user.save
        
	  respond_to do |format|
      if @user.save
        format.html { redirect_to  users_admin_path(@user), notice: 'Successfully added a new user profile.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
      end
    end
	end
  
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end  
end
