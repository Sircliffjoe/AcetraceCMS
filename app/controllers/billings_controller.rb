class BillingsController < ApplicationController
  before_action :set_billing, only: [:approve_billing,:show, :edit, :update, :destroy]

  def index
    @billings = Billing.all
  end
  
  def show
  end

  def new
    @mycase = Mycase.find(params[:mycase_id])
    @billing =  @mycase.billings.build
  end

  def edit
  end


  def download_file
    #@mycase = Mycase.find(params[:mycase_id])
    @task=Billing.find(params[:id])
    send_file @task.document.path
  end

  def create
    
    @mycase = Mycase.find(params[:mycase_id])
    @task = @mycase.billings.create(billing_params)
    @task.status =  0
    @task.poster_id =  current_user.id
    @task.poster_type =  current_user.type
    @task.save

    if @task.save

    if @mycase.users.any?
        @mycase.users.each do |f|
           CaseBillingEmailJob.set(wait: 20.seconds).perform_later(f, @mycase, @task)
  
          Notification.create(
          notify_type: 'billing',
          actor: current_user,
          user: f,
          target: @mycase)
      end
    end

      if current_user.client?
           Notification.create(
                notify_type: 'billing',
                actor: current_user,
                user: @mycase.admin,
                target: @mycase)
      elsif current_user.admin?
         Notification.create(
                notify_type: 'billing',
                actor: current_user,
                user: @mycase.client,
                target: @mycase)

      end
      CaseBillingEmailJob.set(wait: 20.seconds).perform_later(@mycase.client, @mycase, @task)
  
  CaseBillingEmailJob.set(wait: 20.seconds).perform_later(@mycase.client, @mycase, @task)
  
        

    respond_to do |format|
      
        format.html { redirect_to billing_mycase_path(@mycase.id), notice: 'Billing was successfully added.' }
        format.json { render :show, status: :created, location: @task }
     
      end
    end
  end


  def approve_billing
    @billing.update(status: 1)
     CaseBillingApprovedEmailJob.set(wait: 20.seconds).perform_later(@mycase.admin, @mycase)
    CaseBillingApprovedEmailJob.set(wait: 20.seconds).perform_later(@mycase.client, @mycase)
    redirect_to billing_mycase_path(@billing.mycase.id), notice: 'Billing was successfully approved.' 
    
    
  end

  # PATCH/PUT /billings/1
  # PATCH/PUT /billings/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to @billing, notice: 'Billing was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billings/1
  # DELETE /billings/1.json
  def destroy
   @task = Biling.find(params[:id])
    id = @task.mycase.id
    @task.destroy
    respond_to do |format|
      format.html { redirect_to billing_mycase_path(id), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_params
      params.require(:billing).permit!
    end
end
