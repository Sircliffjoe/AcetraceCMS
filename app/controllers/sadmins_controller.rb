class SadminsController < ApplicationController
  skip_before_action :verify_authenticity_token
#skip_before_action :authenticate_user!

	def new
   @user = Sadmin.new
 	#@lawfirm = Lawfirm.find(params[:lawfirm_id])
    #@user = @lawfirm.users.build(user_params)
  end

  def index
    @users = Sadmin.all
 
  end
  
  def show
    @user = Sadmin.find(params[:id])
  end
   
  def create

    @user=Sadmin.create(user_params)

    @user.save
	  respond_to do |format|
      if @user.save
        format.html { redirect_to  @user, notice: 'Successfully added Superadmin.' }
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
      params.require(:sadmin).permit!
    end
  

end