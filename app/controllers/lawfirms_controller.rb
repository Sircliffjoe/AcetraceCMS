class LawfirmsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'application', only: [:index, :show]
  #load_and_authorize_resource :lawfirm
  before_action :set_lawfirm, only: [:activate_lawfirm, :deactivate_lawfirm, :show, :edit, :update, :destroy]
  before_action :in_check
  
  def in_check
    if current_user.admin? || current_user.adminassistant? || current_user.client? || current_user.attorney?
      if current_user.lawfirm
        if current_user.lawfirm.status == "inactive" ||  current_user.lawfirm.status == nil
          redirect_to new_transaction_path, notice: 'Your Lawfirm Subscription has Expire Contact your Lawfirm Admin!'
        end
      end
    end
  end

  def index
    @lawfirms = Lawfirm.all.paginate(page: params[:page], per_page: 5) 
  end

  def show
  end

  def activate_lawfirm
    @lawfirm.update(status: 1)
    redirect_to @lawfirm, notice: 'Lawfirm was successfully activated.' 
  end

  def deactivate_lawfirm
    @lawfirm.update(status: 0)
    redirect_to @lawfirm, notice: 'Lawfirm was successfully deactivated.'
  end

  def new
    if current_user.admin?
      @lawfirm = Lawfirm.new
    else
      redirect_to root_path, notice: 'Sorry, Only Lawfirm Admins Create Lawfirm'
    end
  end

  def edit
  end

  def create
    @lawfirm = Lawfirm.new(lawfirm_params)
    @lawfirm.admin_id= current_user.id
    #current_user.lawfirm = @lawfirm
    @lawfirm.status = 0
    @lawfirm.save
    respond_to do |format|
      if @lawfirm.save
        format.html { redirect_to @lawfirm, notice: 'Lawfirm was successfully created. Welcome to Acetracecms!' }
        format.json { render :show, status: :created, location: @lawfirm }
      else
        format.html { render :new }
        format.json { render json: @lawfirm.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lawfirm.update(lawfirm_params)
        format.html { redirect_to @lawfirm, notice: 'Lawfirm was successfully updated.' }
        format.json { render :show, status: :ok, location: @lawfirm }
      else
        format.html { render :edit }
        format.json { render json: @lawfirm.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lawfirm.destroy
    respond_to do |format|
      format.html { redirect_to lawfirms_url, notice: 'Lawfirm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
  def set_lawfirm
    @lawfirm = Lawfirm.find(params[:id])
  end

  def lawfirm_params
    params.require(:lawfirm).permit(:status, :interval, :name,:logos,:remove_logos, :logos_cache, :type_of_organization, :address, :email, :phone_number, :state, :city)
  end
	 #resourcify
end
