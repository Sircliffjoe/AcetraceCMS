class MycasecommentsController < ApplicationController
  before_action :set_mycasecomment, only: [:show, :edit, :update, :destroy]
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
  # GET /mycasecomments
  # GET /mycasecomments.json
  def index
    @mycasecomments = Mycasecomment.all
  end

  # GET /mycasecomments/1
  # GET /mycasecomments/1.json
  def show
	@mycasecomment = Mycasecomment.find(params[:id])
  end

  # GET /mycasecomments/new
  def new
  @mycase = Mycase.find(params[:mycase_id])
  @mycasecomment = @mycase.mycasecomments.build(mycasecomment_params)
  #@mycasecomment.user_id = current_user.id
  
  end

  # GET /mycasecomments/1/edit
  def edit
  end

  # POST /mycasecomments
  # POST /mycase comments.json
  def create
   @mycase = Mycase.find(params[:mycase_id])
  @mycasecomment = @mycase.mycasecomments.create(mycasecomment_params)
  @mycasecomment.mycasecommenter_id = current_user.id
   @mycasecomment.mycasecommenter_type = current_user.type
    @mycasecomment.save
  if @mycasecomment.save  
    if @mycase.users.any?
      @mycase.users.each do |f|
        CaseCommentEmailJob.set(wait: 20.seconds).perform_later(f, @mycase, @mycasecomment)
  
          Notification.create(
          notify_type: 'casecomment',
          actor: current_user,
          user: f,
          target: @mycase)
      end
    end


    Notification.create(
          notify_type: 'casecomment',
          actor: current_user,
          user: @mycase.admin,
          target: @mycase)

    Notification.create(
          notify_type: 'casecomment',
          actor: current_user,
          user: @mycase.client,
          target: @mycase) 

     CaseCommentEmailJob.set(wait: 20.seconds).perform_later(@mycase.admin, @mycase, @mycasecomment)
  
   CaseCommentEmailJob.set(wait: 20.seconds).perform_later(@mycase.client, @mycase, @mycasecomment)
  
    respond_to do |format|
      
        format.html { redirect_to meet_mycase_path(@mycase.id), notice: 'Dicussion posted was successfully created.' }
        format.json { render :show, status: :created, location: @mycasecomment }
		format.js
      end
    end
  end

  # PATCH/PUT /mycasecomments/1
  # PATCH/PUT /mycasecomments/1.json
  def update
    respond_to do |format|
      if @mycasecomment.update(mycasecomment_params)
        format.html { redirect_to meet_mycase_path(@mycase.id), notice: 'Mycasecomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @mycasecomment }
		format.js
      else
        format.html { render :edit }
        format.json { render json: @mycasecomment.errors, status: :unprocessable_entity }
		format.js
      end
    end
  end

  # DELETE /mycasecomments/1
  # DELETE /mycasecomments/1.json
  def destroy
     @mycase = Mycase.find(params[:mycase_id])
     @mycasecomment=@mycase.mycasecomments.find(params[:id])
	 @mycasecomment.destroy
    respond_to do |format|
      format.html { redirect_to meet_mycase_path(@mycase), notice: 'threat was successfully deleted.' }
      format.json { head :no_content }
	  format.js
    end
  end
  def download_file
  #@mycase = Mycase.find(params[:mycase_id])
  @mycasecomment=Mycasecomment.find(params[:id])
  send_file @mycasecomment.attachment.path
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mycasecomment
      @mycasecomment = Mycasecomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mycasecomment_params
      params.require(:mycasecomment).permit!
    end
end
