class AdminsController < ApplicationController
 skip_before_action :authenticate_user!, if: [:new, :create]
  
	def new
   @user = Admin.new
 	#@lawfirm = Lawfirm.find(params[:lawfirm_id])
    #@user = @lawfirm.users.build(user_params)
  end
   
   def show
    @user = User.find(params[:id])
   @user_cases ||= []
       @user.mycases.each do |u| 
        if u.client_id == current_user.id || u.attorney_id = current_user.id
     @user_cases << u
      end
    end
      
   end
  def create
	#@lawfirm = Lawfirm.find_by id: :lawfirm_id
      #@user = @lawfirm.users.build(user_params)
        #@user.add_role :lawfirmadmin, @lawfirm
    @user=Admin.create(user_params)
	 @user.save
        
	  respond_to do |format|

      if @user.save
        SendEmailJob.set(wait: 20.seconds).perform_later(@user)
        sign_in(@user)
        format.html { redirect_to  root_path, notice: 'Successfully Created Lawfirm Admin Acount.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        
      end
    end
	  
	  
  end

   private
    # Use callbacks to share common setup or constraints between actions.
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:admin).permit!
    end
  

end