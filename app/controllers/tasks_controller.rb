class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
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
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @mycase = Mycase.find(params[:mycase_id])
    @task = @mycase.tasks.build
    
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @attorney = Attorney.find_by(params[:taskter_id])
    @mycase = Mycase.find(params[:mycase_id])
  @task = @mycase.tasks.create(task_params)
 
  @task.taskter_id =  @attorney.id
    @task.taskter_type =  @attorney.type
    @task.save

if @task.save

          if @mycase.users.any?
      @mycase.users.each do |f|
         CaseTaskEmailJob.set(wait: 20.seconds).perform_later(f, @mycase, @task)
  
          Notification.create(
          notify_type: 'task',
          actor: current_user,
          user: f,
          target: @mycase)
      end
    end


    Notification.create(
          notify_type: 'task',
          actor: current_user,
          user: @mycase.admin,
          target: @mycase)

 CaseTaskEmailJob.set(wait: 20.seconds).perform_later(@mycase.admin, @mycase, @task)
  
    respond_to do |format|
      
        format.html { redirect_to casetask_mycase_path(@mycase.id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
     
      end
    end
  end
  
  
   def download_file
  #@mycase = Mycase.find(params[:mycase_id])
  @task=Task.find(params[:id])
  send_file @task.document.path
end

  

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    id = @task.mycase.id
    @task.destroy
    respond_to do |format|
      format.html { redirect_to casetask_mycase_path(id), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit!
    end
end
